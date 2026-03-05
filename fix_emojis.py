import os
path = "c:/Users/dejes/sertanejo 2.0/index.html"
with open(path, "r", encoding="utf-8") as f:
    c = f.read()

c = c.replace("ðŸŽ ", "🎁 ")
c = c.replace("ðŸŽ", "🎁 ")
c = c.replace("BÃ”NUS", "BÔNUS")
c = c.replace("BÃ“NUS", "BÔNUS")
c = c.replace("BÃ\"NUS", "BÔNUS")

with open(path, "w", encoding="utf-8") as f:
    f.write(c)
