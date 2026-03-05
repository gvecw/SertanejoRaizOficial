import os

path = r'c:\Users\dejes\sertanejo 2.0\index.html'
with open(path, 'r', encoding='utf-8', errors='replace') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if '' in line:
        print(f"Line {i+1}: {line.strip()}")
