$file = Join-Path $PSScriptRoot 'index.html'
$lines = [System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8)

# Find the line index of the NEW </section> (after our new pricing block).
# The new pricing section ends at line 1938 (1-indexed), i.e. index 1937.
# The old residual content starts AT line 1939 (index 1938) and ends at line 2191 (index 2190).
# We want to keep: lines 0..1937 + lines 2191.. ($lines.Length-1)

$keepUpTo   = 1937   # 0-indexed: inclusive (new </section> line)
$deleteFrom = 1938   # 0-indexed: start of old residual
$deleteTo   = 2190   # 0-indexed: inclusive last line of residual old section

# Safety check
Write-Host "Line at keepUpTo ($keepUpTo): $($lines[$keepUpTo])"
Write-Host "Line at deleteFrom ($deleteFrom): $($lines[$deleteFrom])"
Write-Host "Line at deleteTo ($deleteTo): $($lines[$deleteTo])"
Write-Host "Line at deleteTo+1 ($($deleteTo+1)): $($lines[$deleteTo+1])"

$newLines = [System.Collections.Generic.List[string]]::new()
for ($i = 0; $i -le $keepUpTo; $i++) { $newLines.Add($lines[$i]) }
for ($i = $deleteTo + 1; $i -lt $lines.Length; $i++) { $newLines.Add($lines[$i]) }

[System.IO.File]::WriteAllLines($file, $newLines, [System.Text.Encoding]::UTF8)
Write-Host "Done! New line count: $($newLines.Count)"
