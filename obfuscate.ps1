$srcPath = "C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\app.src.js"
$destPath = "C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\app.js"

if (Test-Path $srcPath) {
    $code = Get-Content $srcPath -Raw
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($code)
    $base64 = [System.Convert]::ToBase64String($bytes)
    
    # Wrap in browser-safe UTF-8 base64 eval decoder
    $obfuscatedCode = "eval(decodeURIComponent(escape(window.atob('$base64'))));"
    
    Set-Content -Path $destPath -Value $obfuscatedCode -Encoding UTF8
    Write-Host "Successfully obfuscated app.src.js into app.js!"
} else {
    Write-Warning "Source file app.src.js not found!"
}
