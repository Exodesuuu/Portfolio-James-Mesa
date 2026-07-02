$html = (Invoke-WebRequest -Uri 'https://sites.google.com/view/jamesmesa/home' -UseBasicParsing).Content
$pattern = 'https://[a-zA-Z0-9-]+\.googleusercontent\.com/[^\"''\s\\]+'
$matches = [regex]::Matches($html, $pattern) | ForEach-Object { $_.Value } | Select-Object -Unique
$matches | Out-File -FilePath urls.txt
Write-Host "Found $($matches.Count) URLs"
