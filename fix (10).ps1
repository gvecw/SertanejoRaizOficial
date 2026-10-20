$content = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\index.html', [System.Text.Encoding]::UTF8)
$bytes = [System.Text.Encoding]::GetEncoding("ISO-8859-1").GetBytes($content)
$fixed = [System.Text.Encoding]::UTF8.GetString($bytes)
[System.IO.File]::WriteAllText('c:\Users\dejes\sertanejo 2.0\index_repaired.html', $fixed, [System.Text.Encoding]::UTF8)
