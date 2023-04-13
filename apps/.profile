#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Defines env variables

# A link must be created using the following command:
# ln -s $HOME/.dotfiles/apps/.profile $HOME/.profile

export GH_IDE_TOKEN="***REMOVED***"

export JAVA_HOME=$HOME/apps/java
# export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dsun.java2d.xrender=true"

export DOTNET_ROOT=$HOME/apps/dotnet

export PIPENV_VENV_IN_PROJECT=1

export JETBRAINS_SCRIPTS=$HOME/apps/jetbrains
export GRADLE_USER_HOME=$HOME/.gradle

export NVM_SYMLINK_CURRENT=true
export NVM_NODE_PATH=$HOME/.nvm/current

export GOROOT=$HOME/apps/go
export GOPATH=$HOME/projetos/go

export RUSTUP_HOME=$HOME/apps/rust
export CARGO_HOME=$HOME/apps/cargo

# export KAFKA_HOME=$HOME/apps/kafka

. "$HOME/.dotfiles/apps/plasma_env.sh"
