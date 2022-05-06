#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Defines env variables

# A link must be created using the following command:
# ln -s $HOME/.dotfiles/apps/.profile $HOME/.profile

export JAVA_HOME=$HOME/apps/java
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dsun.java2d.xrender=true"

export JETBRAINS_SCRIPTS=$HOME/apps/jetbrains
export GRADLE_USER_HOME=$HOME/.gradle

export NVM_SYMLINK_CURRENT=true
export NVM_NODE_PATH=/home/bparolini/.nvm/current

export GOROOT=$HOME/apps/go
export GOPATH=$HOME/projetos/go
