$htmlPath = "c:\Users\dejes\sertanejo 2.0\index.html"
$corruptedText = Get-Content -Raw -Path $htmlPath -Encoding UTF8
$ansiBytes = [System.Text.Encoding]::GetEncoding("iso-8859-1").GetBytes($corruptedText)
$fixedText = [System.Text.Encoding]::UTF8.GetString($ansiBytes)
Set-Content -Path "c:\Users\dejes\sertanejo 2.0\index_fixed.html" -Value $fixedText -Encoding UTF8
