$appPath = "C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\app.js"
$newGridPath = "C:\Users\James\Documents\GitHub\Portfolio-James-Mesa\render_grid_new.js"

$lines = Get-Content $appPath
$newLines = Get-Content $newGridPath

# renderGrid starts at line 579 (index 578)
# createSubCategoryCard is at line 690 (index 689)
# So we want to replace from index 578 to 688.

$before = $lines[0..577]
$after = $lines[689..($lines.Length - 1)]

$final = $before + $newLines + $after

Set-Content -Path $appPath -Value $final
Remove-Item $newGridPath
