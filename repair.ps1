$html = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\index.html', [System.Text.Encoding]::UTF8)
$originalSection = [System.IO.File]::ReadAllText('c:\Users\dejes\sertanejo 2.0\section_original.html', [System.Text.Encoding]::UTF8)

$regex = '(?s)<section class="relative py-20 px-4 overflow-hidden" style="background-color: #F5F5DC;">.*?</section>'
$html = $html -replace $regex, $originalSection

$dict = @{
    'MÃºsicas' = 'Músicas'; 'ModÃ£o' = 'Modão'; 'sofrÃªncia' = 'sofrência'; 'vocÃª' = 'você';
    'PRÃ‰VIA' = 'PRÉVIA'; 'opÃ§Ã£o' = 'opção'; 'DÃšVIDAS' = 'DÚVIDAS'; 'CLÃ SSICOS' = 'CLÁSSICOS';
    'MODÃƒO' = 'MODÃO'; 'universitÃ¡rio' = 'universitário'; 'informaÃ§Ã£o' = 'informação';
    'OPÃ‡Ã•ES' = 'OPÇÕES'; 'NÃ£o' = 'Não'; 'mÃºsicas' = 'músicas'; 'atÃ©' = 'até';
    'Ã¡' = 'á'; 'Ã ' = 'à'; 'Ã©' = 'é'; 'Ãª' = 'ê'; 'Ã­' = 'í'; 'Ã³' = 'ó'; 'Ãµ' = 'õ';
    'Ãº' = 'ú'; 'Ã§' = 'ç'; 'Ã£' = 'ã'; 'Ã ' = 'Á'; '~.' = '★'; 'YZ' = '🎵'; '?"' = '↓';
    'OuÃ§a' = 'Ouça'; 'anÃºncio' = 'anúncio'; 'sÃ³' = 'só'; 'CompatÃ­vel' = 'Compatível';
    'multimÃ­dia' = 'multimídia'; 'apÃ³s' = 'após'; 'opÃ§Ã£o' = 'opção'; 'Acesso Base' = 'Acesso Básico';
}

foreach ($key in $dict.Keys) {
    if ($key -ne 'Acesso Base') {
        $html = $html.Replace($key, $dict[$key])
    }
}

$html = $html.Replace('Acesso Base', 'Acesso Básico')

# Revert my updates:
$html = $html.Replace('+3.000 CLÁSSICOS</span><br /><span class="text-white">DO MODÃO', '+3.000 MÚSICAS</span><br /><span class="text-white">SERTANEJAS')
$html = $html.Replace('+3.000 clássicos do modão raiz', '+3.000 músicas sertanejas')
$html = $html.Replace('3000 clássicos do modão', '3000 músicas sertanejas')


[System.IO.File]::WriteAllText('c:\Users\dejes\sertanejo 2.0\index.html', $html, [System.Text.Encoding]::UTF8)
