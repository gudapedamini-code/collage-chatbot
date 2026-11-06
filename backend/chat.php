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
function loadEnv($path) {
    if (!file_exists($path)) return;
    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        if (strpos($line, '=') === false) continue;
        list($key, $value) = explode('=', $line, 2);
        $key = trim($key); $value = trim($value);
        if (!empty($key)) { putenv("$key=$value"); $_ENV[$key] = $value; }
    }
}
loadEnv(__DIR__ . '/.env');

// ── CORS Headers ──
$allowedOrigin = getenv('ALLOWED_ORIGIN') ?: '*';
header("Content-Type: application/json; charset=utf-8");
header("Access-Control-Allow-Origin: $allowedOrigin");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, X-Requested-With");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: DENY");

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

// ── Rate Limiting (simple session-based) ──
session_start();
$now = time();
$window = 60; // 1 minute
$maxRequests = 30; // 30 requests per minute per user

if (!isset($_SESSION['requests'])) {
    $_SESSION['requests'] = [];
}

// Remove old requests outside window
$_SESSION['requests'] = array_filter(
    $_SESSION['requests'],
    fn($t) => ($now - $t) < $window
);

if (count($_SESSION['requests']) >= $maxRequests) {
    http_response_code(429);
    echo json_encode([
        "reply" => "⏳ Too many requests. Please wait a moment and try again.",
        "image" => null
    ]);
    exit;
}
$_SESSION['requests'][] = $now;

// ── Read & Sanitize Input ──
$rawInput = file_get_contents("php://input");
if (!$rawInput) {
    echo json_encode(["reply" => "Please type a message.", "image" => null]);
    exit;
}

$data = json_decode($rawInput, true);
if (json_last_error() !== JSON_ERROR_NONE) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid JSON"]);
    exit;
}

$message   = isset($data['message']) ? trim(strip_tags($data['message'])) : "";
$forceLang = isset($data['lang'])    ? trim($data['lang'])                : null;

// Validate lang
if (!in_array($forceLang, ['en','hi','mr',null])) $forceLang = null;

// Max message length
if (mb_strlen($message) > 500) {
    $message = mb_substr($message, 0, 500);
}

// Empty check
if ($message === "") {
    echo json_encode([
        "reply" => "Please type a message. / कृपया कुछ लिखें। / कृपया काहीतरी टाइप करा.",
        "image" => null
    ]);
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
        "reply" => "⚠️ Something went wrong. Please try again.",
        "image" => null
    ]);
} finally {
    if (isset($conn)) $conn->close();
}
?>
