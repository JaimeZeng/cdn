#!/bin/bash -i
set -e

cur_dir=$(
    cd $(dirname $0)
    pwd
)
typora_theme="${cur_dir}/typora-theme"
drake_theme="${typora_theme}/drake"
obsidian_theme="${typora_theme}/obsidian"
cobalt_theme="${typora_theme}/cobalt"
cobalt_nunito="${cobalt_theme}/nunito"
wget_options='-q -c -N --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=20 -t 3 --no-check-certificate -O'
user_agent='Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36'
aria2c_options='--split=8 --quiet=true --max-connection-per-server=8 --retry-wait=20 --timeout=20 --check-certificate=false --allow-overwrite=true -U "${user_agent}"'
# aria2c_options='--split=8 --max-connection-per-server=8 --retry-wait=20 --timeout=20 --check-certificate=false --allow-overwrite=true --all-proxy=http://127.0.0.1:8889 -U "${user_agent}"'

function update_typora_theme() {
    for folder in "${drake_theme}" ${obsidian_theme}" "${cobalt_theme}" "${cobalt_nunito}"; do
        if [ ! -d "${folder}" ]; then
            mkdir -p "${folder}"
        fi
    done

    cd ${typora_theme}/
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-ayu.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-black.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-dark.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-google.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-juejin.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-light.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-material.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-purple.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake-vue.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/bennyxguo/typora-theme-obsidian/master/obsidian-day.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/bennyxguo/typora-theme-obsidian/master/obsidian-night.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple-blue.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple-cesno.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple-classic.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple-green.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple-plain.css
    aria2c ${aria2c_options} https://raw.githubusercontent.com/hliu202/typora-purple-theme/master/purple.css
    cd ${drake_theme}/
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake/JetBrainsMono-Bold.woff2
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake/JetBrainsMono-BoldItalic.woff2
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake/JetBrainsMono-Italic.woff2
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake/JetBrainsMono-Regular.woff2
    aria2c ${aria2c_options} https://raw.githubusercontent.com/liangjingkanji/DrakeTyporaTheme/master/drake/font.css
    cd ${obsidian_theme}/
    aria2c ${aria2c_options} https://raw.githubusercontent.com/bennyxguo/typora-theme-obsidian/master/obsidian/Rubik-Bold-kern-latin.woff2
    aria2c ${aria2c_options} https://raw.githubusercontent.com/bennyxguo/typora-theme-obsidian/master/obsidian/Rubik-Bold-kern-latin.woff2
    cd ${cobalt_theme}/
    # aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt/splash.png
    cd ${cobalt_nunito}/
    aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt/nunito/NunitoSans-ExtraBold.woff
    aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt/nunito/NunitoSans-ExtraBoldItalic.woff
    aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt/nunito/NunitoSans-Italic.woff
    aria2c ${aria2c_options} https://raw.githubusercontent.com/elitistsnob/typora-cobalt-theme/master/cobalt/nunito/NunitoSans-Regular.woff
}

if [ "$1" == "typora" ]; then
    apt-get install -y aria2
    update_typora_theme
fi
