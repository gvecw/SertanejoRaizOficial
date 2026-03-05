$htmlPath = "c:\Users\dejes\sertanejo 2.0\index.html"
$html = Get-Content -Raw $htmlPath

$jsBlock = Get-Content -Raw "c:\Users\dejes\sertanejo 2.0\inject_js.js"

$pattern = '// Accordion Logic'

if ($html -match $pattern) {
    $replacement = $jsBlock + "`n`t`t`t// Accordion Logic"
    $newHtml = $html -replace $pattern, $replacement
    Set-Content -Path $htmlPath -Value $newHtml -Encoding UTF8
    Write-Output "Successfully injected JS into index.html"
} else {
    Write-Output "Could not find Accordion Logic to replace."
}
