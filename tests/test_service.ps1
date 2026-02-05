# test_service.ps1

param(
    [string]$URL = "http://localhost"
)

$ExpectedText = "Hello from Effective Mobile!"

Write-Host "Making request on $URL"
Write-Host "Expected output: $ExpectedText"

# Делаем HTTP-запрос
try {
    $Response = Invoke-WebRequest -Uri $URL -UseBasicParsing -ErrorAction Stop
} catch {
    Write-Host "Failed to connect to $URL"
    exit 1
}

$Body = $Response.Content

Write-Host "Response:"
Write-Host $Body

# Проверка тела
if (-not ($Body -like "*$ExpectedText*")) {
    Write-Host "Response body does not contain expected text: $ExpectedText"
    exit 1
}

Write-Host "Backend is healthy."
exit 0
