$htmlPath = "c:\Users\dejes\sertanejo 2.0\index.html"
$html = Get-Content -Raw $htmlPath

$carouselBlock = Get-Content -Raw "c:\Users\dejes\sertanejo 2.0\carousel_block.html"

# The target block starts with <div class="relative mx-auto mb-10 md:mb-14 w-[92vw] max-w-[330px]"> and ends right before <div class="mb-10 md:mb-12">
$pattern = '(?s)\t{3,4}<div class="relative mx-auto mb-10 md:mb-14 w-\[92vw\] max-w-\[330px\]">.*?<div class="mb-10 md:mb-12">'

if ($html -match $pattern) {
    # It matched, so let's construct the replacement
    # We want to keep <div class="mb-10 md:mb-12"> since it was eaten by the regex or just replace appropriately
    $replacement = $carouselBlock + "`n`n`t`t`t`t<div class=`"mb-10 md:mb-12`">"
    $newHtml = $html -replace $pattern, $replacement
    Set-Content -Path $htmlPath -Value $newHtml -Encoding UTF8
    Write-Output "Successfully replaced carousel block in index.html"
} else {
    Write-Output "Could not find the target block to replace."
}
