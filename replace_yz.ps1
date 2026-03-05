$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$text = Get-Content $path -Raw -Encoding UTF8
$gift = [System.Text.Encoding]::UTF8.GetString([byte[]](240, 159, 142, 129, 32))
$text = $text -replace 'YZ', $gift
[System.IO.File]::WriteAllText($path, $text, [System.Text.Encoding]::UTF8)
