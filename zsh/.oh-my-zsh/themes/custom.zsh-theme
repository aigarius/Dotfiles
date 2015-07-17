#! /bin/zsh

# http://superuser.com/questions/655607/removing-the-useless-space-at-the-end-of-the-right-prompt-of-zsh-rprompt
ZLE_RPROMPT_INDENT=0

reset_color() {
    echo "%{$reset_color%}"
}

fg() {
    echo "%{$fg[$@]%}"
}

fg_bold() {
    echo "%{$fg_bold[$@]%}"
}

return_status() {
    s="%(?:$(fg_bold green)✓:$(fg_bold red)✗)"
    s+="$(reset_color)"
    echo $s
}

who_and_where() {
    if [ -n "$SSH_CLIENT" ]; then
        s="$(fg yellow)%n$(reset_color)"
        s+="@"
        s+="$(fg magenta)%m$(reset_color)"
        s+=" "
    else
        s=""
    fi
    echo $s
}

git_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        echo "$(git_prompt_info)"
    else
        echo ""
    fi
}

current_directory() {
    dir="${PWD/#$HOME/~}"
    parts=("${(@s:/:)dir}")

    s=""
    for part in $parts; do
        x=${part:0:20}
        if [ "$x" != "$part" ]; then
            x="$x…"
        fi
        s="$s$x/";
    done

    if [ "$s" = "~/" ]; then
        s="~"
    fi

    echo "$(fg cyan)$s$(reset_color)"
}

datetime() {
    echo "$(fg_bold black)$(date '+%H:%M:%S')"
}

PROMPT='$(return_status) $(who_and_where)$(current_directory)$(git_prompt_info)  '
RPROMPT='$(datetime)$(reset_color)'

ZSH_THEME_GIT_PROMPT_PREFIX=" $(fg red)"
ZSH_THEME_GIT_PROMPT_DIRTY="$(fg_bold yellow)±"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX="$(reset_color)"
