<?php
// Forward root requests to frontend/index.html
if (file_exists(__DIR__ . '/frontend/index.html')) {
    // Serve frontend directly or redirect
    header("Location: /frontend/index.html");
    exit;
}
echo "COET Akola Chatbot API Server is Running.";
?>