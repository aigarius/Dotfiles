alias ls='ls -a --color=always'

alias less='less -R'

function bb {
    echo "Shutdown scheduled. (Press Ctrl + C to terminate)"
    echo -n "Countdown... "
    for i in {10..1}
    do
        echo -n "$i "
        sleep 1
    done
    echo
    echo "Bye-bye then!"
    sudo shutdown -h now
}

function vimdir {
    gvim `find $1 -type f | xargs echo`
}

alias skype2='skype --dbpath=~/.Skype2'

alias rm='rm -i' # Once I accidentally deleted database file. If you think that this is "for noobs", you are an idiot!

alias diff='colordiff -u'

alias p='ping google.com'

function current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    echo ${ref#refs/heads/}
}

# Tons of Git alias I'm trying to use daily.
alias gad='/usr/bin/git add'
alias gbr='/usr/bin/git branch'
alias gcl='/usr/bin/git clone'
alias gcm='/usr/bin/git commit'
alias gco='/usr/bin/git checkout'
alias gdf='/usr/bin/git diff'
alias gin='/usr/bin/git init'
alias glg="/usr/bin/git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset <%an>' --abbrev-commit --date=relative"
alias gmr='/usr/bin/git merge'
alias gmv='/usr/bin/git mv'
alias gpl='/usr/bin/git pull'
alias gpu='/usr/bin/git push -u origin $(current_branch)'
alias grm='/usr/bin/git rm'
alias grs='/usr/bin/git reset'
alias grv='/usr/bin/git revert'
alias gst='/usr/bin/git status -sb'
alias gsw='/usr/bin/git show'
alias gtg='/usr/bin/git tag'

# To have a reason for using alias.
alias git=''

# A command I use for seeing changes between my home and Dotfiles dir.
alias dotdiff='diff ~ ~/Dotfiles/ | grep -v "Only in" | grep -v "Common subdirectories" | less'

# Opens Gvim as it was a real Vim. The difference is little low.
function vim {
    gvim -p $@ & disown
}
