<?php
// ============================================================
//  DATABASE CONNECTION — COET Akola (Production Ready)
// ============================================================

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
            // Remove surrounding quotes if present
            $value = trim($value, "\"'");
            if (!empty($key)) { 
                putenv("$key=$value"); 
                $_ENV[$key] = $value; 
            }
        }
    }
}

loadEnv(__DIR__ . '/.env');

$DB_HOST = getenv('DB_HOST') ?: ($_ENV['DB_HOST'] ?? 'localhost');
$DB_USER = getenv('DB_USER') ?: ($_ENV['DB_USER'] ?? 'root');
$DB_PASS = getenv('DB_PASS') ?: ($_ENV['DB_PASS'] ?? '');
$DB_NAME = getenv('DB_NAME') ?: ($_ENV['DB_NAME'] ?? 'college_chatbot');

// Disable automatic exceptions in PHP 8.1+ for custom error output
if (function_exists('mysqli_report')) {
    mysqli_report(MYSQLI_REPORT_OFF);
}

try {
    $conn = @new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);
} catch (Exception $e) {
    $conn = false;
}

if (!$conn || $conn->connect_error) {
    http_response_code(500);
    echo json_encode([
        "error" => "Database connection failed.",
        "reply" => "⚠️ <b>डेटाबेस एरर / Database Error:</b><br>डेटाबेसशी संपर्क होऊ शकला नाही. कृपया .env फाईल तपासा आणि MySQL चालू असल्याची खात्री करा.<br><i>(Check .env file and ensure MySQL is running)</i>",
        "hint"  => "Check .env file and make sure MySQL is running."
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
    exit;
}

$conn->set_charset("utf8mb4");
?>