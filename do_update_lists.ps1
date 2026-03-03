$lines = Get-Content 'index.html' -Encoding UTF8
$list1 = Get-Content 'list1.html' -Encoding UTF8
$list2 = Get-Content 'list2.html' -Encoding UTF8
$newContent = $lines[0..1075] + $list1 + $lines[1180..1206] + $list2 + $lines[1345..($lines.Count-1)]
$newContent | Set-Content 'index.html' -Encoding UTF8
