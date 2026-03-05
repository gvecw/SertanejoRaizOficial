$path = 'c:\Users\dejes\sertanejo 2.0\index.html'
$lines = Get-Content $path -Encoding UTF8

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match "CL.+SSICOS") {
        $lines[$i] = $lines[$i] -replace "CL.+SSICOS", "CLÁSSICOS"
    }
    if ($lines[$i] -match "B.+NUS \d") {
        $lines[$i] = $lines[$i] -replace "B.+NUS (\d)", "BÔNUS `$1"
    }
    if ($lines[$i] -match '<span style="flex-shrink: 0; font-size: 16px;">.+</span>') {
        $lines[$i] = $lines[$i] -replace '<span style="flex-shrink: 0; font-size: 16px;">.+</span>', '<span style="flex-shrink: 0; font-size: 16px;">🎁 </span>'
    }
}

Set-Content -Path $path -Value $lines -Encoding UTF8
