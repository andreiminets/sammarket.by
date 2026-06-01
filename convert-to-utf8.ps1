# Convert HTML files from Windows-1251 to UTF-8 for GitHub Pages
$enc1251 = [System.Text.Encoding]::GetEncoding(1251)
$encUtf8 = New-Object System.Text.UTF8Encoding $false
Get-ChildItem -Path $PSScriptRoot -Filter *.html -Recurse | ForEach-Object {
    $content = [System.IO.File]::ReadAllText($_.FullName, $enc1251)
    $content = $content -replace 'charset=windows-1251', 'charset=utf-8'
    [System.IO.File]::WriteAllText($_.FullName, $content, $encUtf8)
    Write-Host "Converted: $($_.FullName)"
}
Write-Host "Done. All HTML files are now UTF-8."
