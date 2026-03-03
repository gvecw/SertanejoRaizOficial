import sys
with open(index.html, r, encoding=utf8) as f: curr = f.read()
with open(index.html.corrupted, r, encoding=utf8) as f: orig = f.read()
import re
orig_match = re.search(r<div\s+class=bg-gradient-to-br from-\\[#1a0f0a\\] to-\\[#0d0705\\].*?Acesso Básico.*?O PREMIUM</a>\s*</div>, orig, re.DOTALL)
curr_match = re.search(r<div\s+class=bg-gradient-to-br from-\\[#1a0f0a\\] to-\\[#0d0705\\].*?Acesso Base.*?O PREMIUM</a>\s*</div>, curr, re.DOTALL)
if orig_match and curr_match:
    curr = curr.replace(curr_match.group(0), orig_match.group(0))
    with open(index.html, w, encoding=utf8) as f: f.write(curr)
    print(Replaced matching section successfully.)
else:
    print(Could not find matching sections.)
