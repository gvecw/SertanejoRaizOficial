$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# specific remaining unicode issues
$c = $c.Replace('ðŸŽ ', '🎁 ') 
$c = $c.Replace('ðŸŽ', '🎁') # Sometimes it is clipped
$c = $c.Replace('BÃ”NUS', 'BÔNUS')
$c = $c.Replace('BÃ“NUS', 'BÔNUS')
$c = $c.Replace('BÃ"NUS', 'BÔNUS')

[System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
