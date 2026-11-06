<?php
// ============================================================
//  DATABASE CONNECTION — COET Akola (Production Ready)
// ============================================================

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

$DB_HOST = getenv('DB_HOST') ?: 'localhost';
$DB_USER = getenv('DB_USER') ?: 'root';
$DB_PASS = getenv('DB_PASS') ?: '';
$DB_NAME = getenv('DB_NAME') ?: 'college_chatbot';

$conn = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode([
        "error" => "Database connection failed.",
        "hint"  => "Check .env file and make sure MySQL is running."
    ]);
    exit;
}

$conn->set_charset("utf8mb4");
?>
