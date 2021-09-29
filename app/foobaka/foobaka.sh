#!/bin/bash
PATH="/usr/local/bin:/usr/bin:/bin"
set -euxo pipefail
progName="foobaka"

wget_options='-q -c -N --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=20 -t 3 --no-check-certificate'
user_agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36'

cd ${HOME}/Downloads/
wget ${wget_options} -O "${progName}.zip" "123"
unzip ${progName}.zip -d /usr/share/

find "/usr/share/${progName}" -type d -exec chmod 755 "{}" \;
find "/usr/share/${progName}" -type f -exec chmod 644 "{}" \;

wget ${wget_options} -O "/usr/bin/${progName}" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/${progName}/${progName}"
wget ${wget_options} -O "/usr/share/pixmaps/${progName}.png" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/${progName}/${progName}.png"
wget ${wget_options} -O "/usr/share/applications/${progName}.desktop" "https://raw.githubusercontent.com/JaimeZeng/cdn/main/app/${progName}/${progName}.desktop"
chmod 755 /usr/bin/${progName}
chmod 644 /usr/share/pixmaps/${progName}.png
chmod 644 /usr/share/applications/${progName}.desktop
update-desktop-database -q /usr/share/applications

rm -rf $HOME/.$progName  \
    $HOME/.local/share/$progName  \
    /usr/share/${progName}  \
    /usr/bin/${progName}  \
    /usr/share/pixmaps/${progName}.png  \
    /usr/share/applications/${progName}.desktop 
