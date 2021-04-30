#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Installs SDKMan, changes some configuration and installs various packages

curl -s "https://get.sdkman.io" | sh

source "$HOME/.sdkman/bin/sdkman-init.sh"

sed -i 's/\(sdkman_auto_answer=\)false/\1true/ \
        s/\(sdkman_auto_selfupdate=\)false/\1true/' "$HOME/.sdkman/etc/config"

APPS=( "maven" "gradle" "springboot" "kotlin" "groovy" )

for app in $APPS
do
    echo "sdk install $app"
    sdk install $app
done
