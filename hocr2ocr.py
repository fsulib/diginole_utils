#!/usr/bin/env python3

import sys
import os
from bs4 import BeautifulSoup

if len(sys.argv) < 2:
  sys.exit("Error: No HOCR source file provided.")
else:
  hocr_filename = sys.argv[1]
  with open(hocr_filename) as f:
    hocr_unparsed = f.read()

ocr_filename = hocr_filename.replace("shtml", "txt")
if os.path.exists(ocr_filename):
  os.remove(ocr_filename)
ocr_file = open(ocr_filename, "a")

hocr_parsed = BeautifulSoup(hocr_unparsed, 'html.parser')
for p in hocr_parsed.find_all('p'):
  for spanline in p.find_all('span'):
    line_words = []
    for spanword in spanline.find_all('span'):
      word = spanword.contents[0].strip()
      line_words.append(word)
    if len(line_words) > 0:
      ocr_file.write(' '.join(line_words) + "\n")
  ocr_file.write("\n")

ocr_file.close()
