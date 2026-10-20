$file = Join-Path $PSScriptRoot 'index.html'
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

# The duplicated/leaked CSS starts right after the first </style> tag (the GOOD one is inside <head>)
# and ends at the second </head> tag, replaced by just </head>
# We'll find the first </style> after our master block (which ends with "</style>"),
# then cut everything between that and the next </head>.

# Markers
$styleClose = '</style>'
$headClose  = '</head>'
$bodyOpen   = '<body'

# Find where the GOOD </style> closes (inside head) — it's the FIRST one
$firstStyleEnd = $content.IndexOf($styleClose)
if ($firstStyleEnd -lt 0) { Write-Host "No </style> found!"; exit 1 }
$afterFirstStyle = $firstStyleEnd + $styleClose.Length

# Find the </head> after the first </style>
$headCloseIdx = $content.IndexOf($headClose, $afterFirstStyle)
if ($headCloseIdx -lt 0) { Write-Host "No </head> found after first </style>!"; exit 1 }

# We want to KEEP from $afterFirstStyle to $headCloseIdx only whitespace/newline, 
# but there's leaked CSS in between. So we replace everything between them with just newlines.
$before = $content.Substring(0, $afterFirstStyle)
$after  = $content.Substring($headCloseIdx)

$clean = $before + "`r`n" + $after

[System.IO.File]::WriteAllText($file, $clean, [System.Text.Encoding]::UTF8)
$lineCount = ($clean -split '\n').Count
Write-Host "Done! Lines: $lineCount"
