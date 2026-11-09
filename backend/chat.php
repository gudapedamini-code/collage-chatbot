<?php
// ============================================================
//  CHAT API — COET Akola (Production Ready)
//  - CORS protection
//  - Rate limiting
//  - Input sanitization
//  - Error handling
//  - Request logging
// ============================================================

// Load env
if (!function_exists('loadEnv')) {
    function loadEnv($path) {
        if (!file_exists($path)) return;
        $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            $line = trim($line);
            if (empty($line) || strpos($line, '#') === 0) continue;
            if (strpos($line, '=') === false) continue;
            list($key, $value) = explode('=', $line, 2);
            $key = trim($key); 
            $value = trim($value);
            $value = trim($value, "\"'");
            if (!empty($key)) { 
                putenv("$key=$value"); 
                $_ENV[$key] = $value; 
            }
        }
    }
}
loadEnv(__DIR__ . '/.env');

// ── CORS Headers ──
$allowedOrigin = getenv('ALLOWED_ORIGIN') ?: ($_ENV['ALLOWED_ORIGIN'] ?? '*');
header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Allow-Origin: $allowedOrigin");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-Requested-With, Authorization");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: SAMEORIGIN");

// Handle preflight
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

// Only POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["error" => "Method not allowed"]);
    exit;
}

// ── Rate Limiting (session-based) ──
if (session_status() === PHP_SESSION_NONE) {
    @session_start();
}
$now = time();
$window = 60; // 1 minute
$maxRequests = 40; // 40 requests per minute

if (!isset($_SESSION['requests']) || !is_array($_SESSION['requests'])) {
    $_SESSION['requests'] = [];
}

// Remove old requests outside window
$_SESSION['requests'] = array_filter(
    $_SESSION['requests'],
    function($t) use ($now, $window) {
        return ($now - $t) < $window;
    }
);

if (count($_SESSION['requests']) >= $maxRequests) {
    http_response_code(429);
    echo json_encode([
        "reply" => "⏳ खूप जास्त विनंत्या पाठवल्या आहेत. कृपया एक मिनिट थांबा आणि पुन्हा प्रयत्न करा. / Too many requests. Please wait a moment.",
        "image" => null
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}
$_SESSION['requests'][] = $now;

// ── Read & Sanitize Input ──
$rawInput = file_get_contents("php://input");
if (!$rawInput) {
    echo json_encode(["reply" => "Please type a message. / कृपया काहीतरी टाइप करा.", "image" => null], JSON_UNESCAPED_UNICODE);
    exit;
}

$data = json_decode($rawInput, true);
if (json_last_error() !== JSON_ERROR_NONE || !is_array($data)) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid JSON payload"]);
    exit;
}

$message   = isset($data['message']) ? trim(strip_tags((string)$data['message'])) : "";
$forceLang = isset($data['lang'])    ? trim((string)$data['lang'])                : null;

// Validate lang
if (!in_array($forceLang, ['en','hi','mr',null], true)) {
    $forceLang = null;
}

// Max message length
if (mb_strlen($message) > 500) {
    $message = mb_substr($message, 0, 500);
}

// Empty check
if ($message === "") {
    echo json_encode([
        "reply" => "Please type a message. / कृपया कुछ लिखें। / कृपया काहीतरी टाइप करा.",
        "image" => null
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

// ── Connect DB & Get Reply ──
require_once "db.php";
require_once "chatmodel.php";

try {
    $response = getReply($conn, $message, $forceLang);

    echo json_encode([
        "reply"    => $response['reply'],
        "image"    => $response['image'],
        "category" => $response['category'],
        "lang"     => $response['lang']
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "reply" => "⚠️ क्षमस्व, तांत्रिक अडचण आली आहे. कृपया थोड्या वेळाने प्रयत्न करा. / Something went wrong.",
        "image" => null
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} finally {
    if (isset($conn) && $conn instanceof mysqli) {
        $conn->close();
    }
}
?>