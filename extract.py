import urllib.request
import re

url = "https://sites.google.com/view/jamesmesa/home"
req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
html = urllib.request.urlopen(req).read().decode('utf-8')

# Find googleusercontent.com image links
pattern = r'https://[a-zA-Z0-9-]+\.googleusercontent\.com/[a-zA-Z0-9_-]+'
matches = re.findall(pattern, html)
unique_urls = list(set(matches))

with open('urls.txt', 'w') as f:
    for u in unique_urls:
        f.write(u + '\n')

print(f"Extracted {len(unique_urls)} unique googleusercontent URLs.")
