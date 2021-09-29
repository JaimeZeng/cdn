#!/bin/bash
PATH="/usr/local/bin:/usr/bin:/bin"
set -euxo pipefail

wget_options='-q -c -N --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=20 -t 3 --no-check-certificate'
user_agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36'

cd ${HOME}/Downloads/
wget ${wget_options} -O "Notepad2.zip" "https://github.com/zufuliu/notepad2/releases/download/v4.21.07r3826/Notepad2_zh-Hans_x64_v4.21.07r3826.zip"
unzip Notepad2.zip -d /usr/share/notepad2

find "/usr/share/notepad2" -type d -exec chmod 755 "{}" \;
find "/usr/share/notepad2" -type f -exec chmod 644 "{}" \;

wget ${wget_options} -O "/usr/bin/notepad2" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/notepad/notepad2"
chmod 755 /usr/bin/notepad2
wget ${wget_options} -O "/usr/share/pixmaps/notepad2.png" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/notepad/notepad2.png"
chmod 644 /usr/share/pixmaps/notepad2.png
wget ${wget_options} -O "/usr/share/applications/notepad2.desktop" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/notepad/notepad2.desktop"
chmod 644 /usr/share/applications/notepad2.desktop
update-desktop-database -q /usr/share/applications