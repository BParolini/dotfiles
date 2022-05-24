#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Sets Git global configuration (it assumes vim and kdiff3 are installed in the system) and installs GitHub CLI

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "You must inform \"<user_name>\" \"<user_email>\" \"[<user_signingkey>]\""
    echo "If user_signingkey is not supplied, gpg signature will be disabled."
    exit 1
fi

git config --global user.name "$1"
git config --global user.email "$2"
git config --global init.defaultBranch master
git config --global color.ui auto
git config --global core.editor vim
git config --global merge.tool kdiff3
git config --global gpg.program gpg2
git config --global pull.rebase false
git config --global init.defaultBranch main

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global alias.incoming "!(git fetch --quiet && git log --pretty=format:'%C(yellow)%h %C(white)- %C(red)%an %C(white)- %C(cyan)%d%Creset %s %C(white)- %ar%Creset' ..@{u})"

git config --global alias.outgoing "!(git fetch --quiet && git log --pretty=format:'%C(yellow)%h %C(white)- %C(red)%an %C(white)- %C(cyan)%d%Creset %s %C(white)- %ar%Creset' @{u}..)"

if [ -n "$3" ]
then
    git config --global commit.gpgsign true
    git config --global user.signingkey "$3"
else
    git config --global commit.gpgsign false
    git config --global --unset user.signingkey
fi
