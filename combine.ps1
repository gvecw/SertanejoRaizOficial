$p1 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part1.txt')
$p2 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part2.txt')
$p3 = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\part3.txt')
$enc = new-object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText('c:\Users\dejes\sertanejo 2.0\index.html', $p1+$p2+$p3, $enc)
