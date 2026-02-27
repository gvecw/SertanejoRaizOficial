$html = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\index.html', [System.Text.Encoding]::UTF8)
$bad = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\bad_section.txt', [System.Text.Encoding]::UTF8)
$orig = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\section_original.html', [System.Text.Encoding]::UTF8)

# The Out-File might add a trailing CRLF. Let's remove it for exact matching.
$bad = $bad.TrimEnd("`r `n")
$orig = $orig.TrimEnd("`r `n")

$html = $html.Replace($bad, $orig)

# Revert my Hero edit:
$html = $html.Replace('+3.000 CLÁSSICOS</span><br /><span class="text-white">DO MODfO', '+3.000 MÚSICAS</span><br /><span class="text-white">SERTANEJAS')
$html = $html.Replace('3000 clássicos do modão', '3000 músicas sertanejas')
$html = $html.Replace('+3.000 clássicos do modão raiz', '+3.000 músicas sertanejas')

[System.IO.File]::WriteAllText('c:\Users\dejes\sertanejo 2.0\index.html', $html, [System.Text.Encoding]::UTF8)
