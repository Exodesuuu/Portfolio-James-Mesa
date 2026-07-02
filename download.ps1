New-Item -ItemType Directory -Force -Path C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\images\downloads
$urls = Get-Content C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\urls.txt | Where-Object { $_ -match 'googleusercontent\.com/sitesv' } | ForEach-Object { $_ -replace '\);$', '' }
$i = 1
foreach ($url in $urls) {
    try {
        Invoke-WebRequest -Uri $url -OutFile "C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\images\downloads\site_image_$i.png" -UseBasicParsing
        $i++
    } catch { }
}
Write-Host "Successfully downloaded $($i - 1) images from Google Sites!"
