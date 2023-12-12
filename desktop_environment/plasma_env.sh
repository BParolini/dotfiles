#!/usr/bin/env sh

# author: Bruno Parolini brunoparolini@gmail.com
# description: Defines environment variables which will be used by Plasma environment.
#              It must be added to Plasma initialization scripts.

export XDG_CURRENT_DESKTOP="${XDG_SESSION_DESKTOP:=plasma}"
export XDG_SESSION_DESKTOP="${XDG_SESSION_DESKTOP:=plasma}"
