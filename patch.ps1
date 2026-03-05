$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$lines = Get-Content $path -Encoding UTF8
$arrow = [System.Text.Encoding]::UTF8.GetString([byte[]](226, 172, 134, 239, 184, 143))

$lines[130] = "						class=`"animate-bounce`">$arrow</span> Escolha a opção ideal pra você logo abaixo</p>"
$lines[901] = "						<p class=`"text-gray-400`">É só copiar os arquivos pro seu pendrive. Super simples, não precisa de conhecimento técnico. Depois é só plugar no carro e curtir!</p>"

Set-Content -Path $path -Value $lines -Encoding UTF8
