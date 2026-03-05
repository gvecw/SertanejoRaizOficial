$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$text = Get-Content $path -Raw -Encoding UTF8

$text = $text -replace 'UMA PR.{1,3}VIA', 'UMA PRÉVIA'
$text = $text -replace 'Raiz .{1,4} Universit.{1,4}rio .{1,4} Sofr.{1,4}ncia .{1,4} Hits atuais', 'Raiz • Universitário • Sofrência • Hits atuais'
$text = $text -replace 'Zez. Di Camargo &amp; Luciano - .{1,3} o Amor', 'Zezé Di Camargo &amp; Luciano - É o Amor'
$text = $text -replace 'animate-bounce">.{1,4}</span>', 'animate-bounce">⬇️</span>'
$text = $text -replace 'OP.{1,5}ES DE ACESSO', 'OPÇÕES DE ACESSO'
$text = $text -replace '>(\s*).{1,3} só copiar os arquivos', '>$1É só copiar os arquivos'
$text = $text -replace '>{1,3}YZ.{1,3}<', '>🎁 <'
$text = $text -replace '>YZ<', '>🎁 <'
$text = $text -replace 'B.{1,4}NUS', 'BÔNUS'
$text = $text -replace 'B"NUS', 'BÔNUS'

[System.IO.File]::WriteAllText($path, $text, [System.Text.Encoding]::UTF8)
