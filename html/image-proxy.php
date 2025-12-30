<?php
// Simple image proxy to bypass CORS for Google Drive files.
// Use: /image-proxy.php?id=GOOGLE_DRIVE_FILE_ID
// Note: This proxy only supports Google Drive IDs to limit abuse.

$id = isset($_GET['id']) ? trim($_GET['id']) : '';

if ($id === '') {
    http_response_code(400);
    echo 'Missing id parameter';
    exit;
}

if (!preg_match('/^[A-Za-z0-9_-]{10,}$/', $id)) {
    http_response_code(400);
    echo 'Invalid id parameter';
    exit;
}

$url = 'https://drive.google.com/uc?export=download&id=' . urlencode($id);

$ch = curl_init($url);
curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HEADER => true,
    CURLOPT_USERAGENT => 'ImageProxy/1.0',
    CURLOPT_TIMEOUT => 20,
]);

$response = curl_exec($ch);
if ($response === false) {
    http_response_code(502);
    echo 'Upstream fetch failed';
    exit;
}

$headerSize = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$contentType = null;
$headersRaw = substr($response, 0, $headerSize);
$body = substr($response, $headerSize);

foreach (explode("\r\n", $headersRaw) as $line) {
    if (stripos($line, 'Content-Type:') === 0) {
        $contentType = trim(substr($line, strlen('Content-Type:')));
        break;
    }
}

curl_close($ch);

if ($statusCode >= 400) {
    http_response_code(502);
    echo 'Upstream error';
    exit;
}

if ($contentType) {
    header('Content-Type: ' . $contentType);
} else {
    header('Content-Type: image/jpeg');
}

header('Cache-Control: public, max-age=86400');
header('Access-Control-Allow-Origin: *');

echo $body;
