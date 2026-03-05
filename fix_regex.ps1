$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$c = $c -replace 'CLÃ\xA0SSICOS', 'CLÁSSICOS'
$c = $c -replace 'CLÃ SSICOS', 'CLÁSSICOS'
$c = $c -replace 'Amostra de Ã¡udio \(MP3\)', 'Amostra de áudio (MP3)'
$c = $c -replace 'Prévia de Ã¡udio \(MP3\)', 'Prévia de áudio (MP3)'
$c = $c -replace 'Prévia de áudio \(MP3\)', 'Prévia de áudio (MP3)'
$c = $c -replace 'ðŸŽµ', '🎵'
$c = $c -replace 'â†“', '⬇️'
$c = $c -replace 'ðŸ', '💎'
[System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
