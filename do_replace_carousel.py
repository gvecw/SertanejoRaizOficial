import codecs
path = r'c:\Users\dejes\sertanejo 2.0\index.html'
with codecs.open(path, 'r', 'utf-8') as f:
    text = f.read()

start_str = '<div class="relative" id="testimonial-slider-container">'
end_str = '</script>\n\n				</div>'

start_idx = text.find(start_str)
end_idx = text.find(end_str, start_idx)

if start_idx != -1 and end_idx != -1:
    end_idx += len(end_str)
    new_html = """<div class="flex flex-col gap-4 items-center">
					<img src="print1.jpg" alt="print depoimento 1" class="w-full max-w-[360px] rounded-[16px]" style="box-shadow: 0 4px 20px rgba(0,0,0,0.4);" />
					<img src="print2.jpg" alt="print depoimento 2" class="w-full max-w-[360px] rounded-[16px]" style="box-shadow: 0 4px 20px rgba(0,0,0,0.4);" />
					<img src="print3.jpg" alt="print depoimento 3" class="w-full max-w-[360px] rounded-[16px]" style="box-shadow: 0 4px 20px rgba(0,0,0,0.4);" />
				</div>"""
    new_text = text[:start_idx] + new_html + text[end_idx:]
    with codecs.open(path, 'w', 'utf-8') as f:
        f.write(new_text)
    print('Replaced successfully.')
else:
    print('Could not find markers.')
