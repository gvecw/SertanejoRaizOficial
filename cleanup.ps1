$p = 'c:\Users\dejes\sertanejo 2.0\index.html'
$c = Get-Content $p -Raw -Encoding UTF8
$r = [string][char]65533
$c = $c.Replace($r, "")
[System.IO.File]::WriteAllText($p, $c, [System.Text.Encoding]::UTF8)
