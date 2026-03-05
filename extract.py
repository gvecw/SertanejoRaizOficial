import re

with open('index_vercel.html', 'r', encoding='utf-8') as f:
    html = f.read()

pattern = re.compile(r'(<div class="relative mx-auto mb-10 md:mb-14 w-\[92vw\] max-w-\[330px\]">.*?)<div class="mb-10 md:mb-12">', re.S)
match = pattern.search(html)

if match:
    with open('extracted_slider.html', 'w', encoding='utf-8') as f:
        f.write(match.group(1))
        print("Success")
else:
    print("Match not found")
