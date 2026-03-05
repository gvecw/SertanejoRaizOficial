$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$content = Get-Content -Path $path -Encoding UTF8
$linenum = 1
foreach ($line in $content) {
    if ($line -match "|ï¿½||?|Â|Ã|â€¢|â†|ðŸ|â˜") {
        Write-Output "$linenum : $($line.Trim())"
    }
    $linenum++
}
