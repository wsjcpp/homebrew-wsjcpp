#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import hashlib
import re

r = requests.get('https://api.github.com/repos/wsjcpp/wsjcpp/releases')

latest_tag_name_release = r.json()[0]['tag_name']
print("latest release " + latest_tag_name_release)

url = 'https://github.com/wsjcpp/wsjcpp/archive/' + latest_tag_name_release + '.tar.gz'
print("Download archive " + url)
r = requests.get(url, allow_redirects=True)
sha256_ = hashlib.sha256(r.content).hexdigest()
print("sha256 = " + sha256_)

def replace2(file, pattern, subst):
    # Read contents from file as a single string
    file_handle = open(file, 'r')
    file_string = file_handle.read()
    file_handle.close()

    # Use RE package to allow for replacement (also allowing for (multiline) REGEX)
    file_string = (re.sub(pattern, subst, file_string))

    # print(file_string)

    # Write contents to file.
    # Using mode 'w' truncates the file.
    file_handle = open(file, 'w')
    file_handle.write(file_string)
    file_handle.close()

print("Update version and sha256 in wsjcpp.rb")
replace2("./wsjcpp.rb","/v\\d*\\.\\d*\\.\\d*\\.tar\\.gz\"","/" + latest_tag_name_release + ".tar.gz\"")
replace2("./wsjcpp.rb", "sha256 \"[a-fA-F0-9]*\"", "sha256 \"" + sha256_ + "\"")

print("Done.")