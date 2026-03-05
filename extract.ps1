$html = Get-Content -Raw "index_vercel.html"
$pattern = '(<div class="relative mx-auto mb-10 md:mb-14 w-\[92vw\] max-w-\[330px\]">.*?)<div class="mb-10 md:mb-12">'

if ($html -match $pattern) {
    $matched = $matches[1]
    
    # Simple formatting: insert newlines after some tags to make it readable
    $matched = $matched -replace '>(<div)', ">`n`t`t`t$1"
    $matched = $matched -replace '>(<button)', ">`n`t`t`t$1"
    $matched = $matched -replace '>(<span)', ">`n`t`t`t`t$1"
    $matched = $matched -replace '>(<p)', ">`n`t`t`t`t$1"
    $matched = $matched -replace '>(<h3)', ">`n`t`t`t`t$1"
    
    Set-Content -Path "extracted_slider.html" -Value $matched -Encoding UTF8
    Write-Output "Extraction successful."
} else {
    Write-Output "No match found."
}
