$jsonText = [System.IO.File]::ReadAllText("c:\Users\dejes\sertanejo 2.0\replacements.json", [System.Text.Encoding]::UTF8)
$arr = ConvertFrom-Json $jsonText
$htmlPath = "c:\Users\dejes\sertanejo 2.0\index.html"
$content = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)

# Sort by the length of the string to replace, so longer sequences (like CLÃ SSICOS) are replaced before shorter ones (Ã)
$sorted = $arr | Sort-Object { $_[0].Length } -Descending

foreach ($pair in $sorted) {
    if ($pair[0].Length -gt 0) {
        $content = $content.Replace($pair[0], $pair[1])
    }
}
[System.IO.File]::WriteAllText($htmlPath, $content, [System.Text.Encoding]::UTF8)
