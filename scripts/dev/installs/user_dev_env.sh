#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Configures NPM and JAVA_HOME, adds them to PATH env variable and runs npm.sh and sdkman.sh

echo "Prepare npm and JetBrains scripts directories"
mkdir -p "$HOME/apps/jetbrains"

printf 'export PATH=$JAVA_HOME/bin:$JETBRAINS_SCRIPTS:$NPM_CONFIG_PREFIX/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH\n\n' >> $HOME/.zshrc

source $HOME/.zshrc

BASEDIR=$(dirname "$0")

source $BASEDIR/npm.sh
source $BASEDIR/sdkman.sh
