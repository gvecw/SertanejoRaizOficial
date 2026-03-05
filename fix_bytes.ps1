$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$text = Get-Content $path -Raw -Encoding UTF8

$gift = [System.Text.Encoding]::UTF8.GetString([byte[]](0xF0, 0x9F, 0x8E, 0x81, 0x20))
$classicos = [System.Text.Encoding]::UTF8.GetString([byte[]](0x43, 0x4C, 0xC3, 0x81, 0x53, 0x53, 0x49, 0x43, 0x4F, 0x53))
$bonus = [System.Text.Encoding]::UTF8.GetString([byte[]](0x42, 0xC3, 0x94, 0x4E, 0x55, 0x53))

$text = $text -replace 'CL[^+]+SSICOS', $classicos
$text = $text -replace 'B[\S]+NUS', $bonus
$text = $text -replace '<span style="flex-shrink: 0; font-size: 16px;">([^<]+)</span>', ("<span style=`"flex-shrink: 0; font-size: 16px;`">" + $gift + "</span>")

[System.IO.File]::WriteAllText($path, $text, [System.Text.Encoding]::UTF8)
