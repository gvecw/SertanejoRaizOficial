$utf8 = new-object System.Text.UTF8Encoding $false
$p1 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part1.txt', $utf8)
$p2 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part2.txt', $utf8)
$p3 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part3.txt', $utf8)
[System.IO.File]::WriteAllText('c:\Users\dejes\sertanejo 2.0\index_clean.html', $p1+$p2+$p3, $utf8)
