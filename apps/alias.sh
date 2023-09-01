#!/usr/bin/env sh

alias grep='grep -Hn --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv}'
alias egrep='grep -HnE --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv}'
alias fgrep='grep -HnF --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox,.vscode,.fleet,.venv}'
