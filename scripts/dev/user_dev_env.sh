#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Configures NPM and JAVA_HOME, adds them to PATH env variable and runs npm.sh and sdkman.sh

echo "Prepare npm and JetBrains scripts directories"
mkdir -p "$HOME/apps/npm-global"
mkdir -p "$HOME/apps/jetbrains"

echo "Setting npm global directory"
npm config set prefix "$HOME/apps/npm-global"

echo "Setting npm, JetBrains, Java home and Android home environment variables"
printf '\nexport NPM_CONFIG_PREFIX=$HOME/apps/npm-global\n\n' >> $HOME/.zshrc

printf 'export JETBRAINS_SCRIPTS=$HOME/apps/jetbrains\n' >> $HOME/.zshrc
printf 'export JAVA_HOME=$HOME/apps/java\n\n' >> $HOME/.zshrc

printf 'export GOROOT=$HOME/apps/go\n' >> $HOME/.zshrc
printf 'export GOTPATH=$HOME/projetos/go\n\n' >> $HOME/.zshrc

printf 'export ANDROID_HOME=/home/bparolini/apps/Android/Sdk\n\n' >> $HOME/.zshrc

printf 'export PATH=$JAVA_HOME/bin:$JETBRAINS_SCRIPTS:$NPM_CONFIG_PREFIX/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH\n\n' >> $HOME/.zshrc

source $HOME/.zshrc

BASEDIR=$(dirname "$0")

source $BASEDIR/npm.sh
source $BASEDIR/sdkman.sh
