# region Navigation
alias ls='ls --color'
alias ll='ls -lah'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
# endregion

# region fd-find
if [ $commands[fdfind] ]; then
    alias fd='fdfind'
fi
# endregion

# region fzf
alias nf='nvim $(fzf)'
alias nff='nvim $(fd . --type f --hidden --follow --exclude ".git" --exclude ".cache" --exclude ".venv" --exclude "venv" 2> /dev/null | fzf)'
alias nfd='nvim $(fd . --type d --hidden --follow --exclude ".git" --exclude ".cache" --exclude ".venv" --exclude "venv" 2> /dev/null | fzf)'
# endregion

# region neovim
alias nvimdiff='nvim -d'
# endregion

