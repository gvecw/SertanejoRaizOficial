$htmlPath = "c:\Users\dejes\sertanejo 2.0\index.html"
$content = Get-Content -Raw -Path $htmlPath -Encoding UTF8

$replacements = @{
    "ðŸŽµ" = "🎵"
    "CLÃSSICOS" = "CLÁSSICOS"
    "CLÃ SSICOS" = "CLÁSSICOS"
    "ClÃ¡ssicos" = "Clássicos"
    "MODÃƒO" = "MODÃO"
    "ModÃ£o" = "Modão"
    "mÃºsicas" = "músicas"
    "universitÃ¡rio" = "universitário"
    "sofrÃªncia" = "sofrência"
    "vocÃª" = "você"
    "PRÃ‰VIA" = "PRÉVIA"
    "opÃ§Ã£o" = "opção"
    "â†“" = "⬇️"
    "Ã¡" = "á"
    "Ã©" = "é"
    "Ã­" = "í"
    "Ã³" = "ó"
    "Ãº" = "ú"
    "Ã§" = "ç"
    "Ã£" = "ã"
    "Ãµ" = "õ"
    "Ã¢" = "â"
    "Ãª" = "ê"
    "Ã´" = "ô"
    "Ã " = "Á"
    "Ã‰" = "É"
    "Ã“" = "Ó"
    "Ãš" = "Ú"
    "Ã‡" = "Ç"
    "Ãƒ" = "Ã"
    "sÃ³" = "só"
    "vocÃªs" = "vocês"
}

foreach ($key in $replacements.Keys) {
    $content = $content.Replace($key, $replacements[$key])
}

Set-Content -Path $htmlPath -Value $content -Encoding UTF8
