$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$lines = Get-Content -Path $path -Encoding UTF8

$lines[96] = "`t`t`t`t`t`tclass=`"text-amber-400`">+3.000 CLÁSSICOS</span><br /><span class=`"text-white`">DO"

$lines[1412] = "`t`t`t`t`t`t`t<span style=`"flex-shrink: 0; font-size: 16px;`">🎁 </span>"
$lines[1413] = "`t`t`t`t`t`t`t<span>BÔNUS 1: Acesso Vitalício (Pague uma vez só)</span>"

$lines[1416] = "`t`t`t`t`t`t`t<span style=`"flex-shrink: 0; font-size: 16px;`">🎁 </span>"
$lines[1417] = "`t`t`t`t`t`t`t<span>BÔNUS 2: Videoclipes Sertanejos em HD</span>"

$lines[1420] = "`t`t`t`t`t`t`t<span style=`"flex-shrink: 0; font-size: 16px;`">🎁 </span>"
$lines[1421] = "`t`t`t`t`t`t`t<span>BÔNUS 3: Seleção `"As 100 Mais Tocadas nos Butecos`"</span>"

$lines[1424] = "`t`t`t`t`t`t`t<span style=`"flex-shrink: 0; font-size: 16px;`">🎁 </span>"
$lines[1425] = "`t`t`t`t`t`t`t<span>BÔNUS 4: Playlist `"Churrasco de Domingo`"</span>"

$lines[1428] = "`t`t`t`t`t`t`t<span style=`"flex-shrink: 0; font-size: 16px;`">🎁 </span>"
$lines[1429] = "`t`t`t`t`t`t`t<span>BÔNUS 5: Acesso ao Grupo VIP de Membros</span>"

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
