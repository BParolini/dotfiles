#!/usr/bin/env sh

alias grep='grep -Hn --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv,node_modules}'
alias egrep='grep -HnE --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv,node_modules}'
alias fgrep='grep -HnF --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv,node_modules}'
