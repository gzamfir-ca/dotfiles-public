# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/georgezamfir/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Configure shell prompt
fpath+=/Users/georgezamfir/.zsh_prompt/pure
autoload -U promptinit; promptinit
prompt pure


# Upload shell extensions
source /usr/local/opt/fzf/shell/completion.zsh
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh


# Customize key bindings
bindkey '^ ' autosuggest-accept
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# Setup terminal colours
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=yellow"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export GREP_COLOR='1;35'
export GREP_OPTIONS='--color=auto'


# Setup dev environment
export JAVA_HOME=$(/usr/libexec/java_home --version 17)
export M2_HOME="/usr/local/opt/maven/libexec"

export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/readline/include -I/usr/local/opt/libyaml/include"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/libyaml/lib"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1 --with-readline-dir=/usr/local/opt/readline --with-libyaml-dir=/usr/local/opt/libyaml"

path=('/usr/local/opt/make/libexec/gnubin' $path)

eval "$(nodenv init -)"
eval "$(rbenv init -)"


# Upload terminal aliases
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias -- -='cd -'
alias al='alias'
alias bk='sy /Users/georgezamfir/repo/ /Volumes/Akitio\ XA/repo'
alias c.='code .'
alias cb='clang++ -std=c++11 -stdlib=libc++ -o'
alias cd='(){builtin cd "${1}" && la}'
alias cl='clear'
alias cm='tar -czvf'
alias cp='cp -nv'
alias ct='cat -et'
alias d.='df -h .'
alias dl='diskutil list'
alias ds='du -h'
alias en='env | sort'
alias g~='cd "$(git rev-parse --show-toplevel)"'
alias ga='git config --get-regexp "^alias\."'
alias gr='grep -ni'
alias hi='history'
alias jj='java -jar'
alias la='ls -Fhla'
alias ll='ls -Fhl'
alias ln='ln -sv'
alias lt='ls -Fhlt'
alias ls='ls -1'
alias mc='(){mkdir -pv "${1}" && cd "${1}"}'
alias md='(){mkdir -pv "${@}" && la}'
alias mv='mv -nv'
alias nr='npm run'
alias o.='open .'
alias pd='(){builtin pwd}'
alias pg='open postgres://localhost'
alias rm='rm -iv'
alias st='stat -x'
alias sy='rsync --archive --update --delete --info=progress2 --human-readable'
alias tl='tail -n 50 -F'
alias to='touch'
alias tp='top -R -F -s 10 -o rsize'
alias tr='tree'
alias up='uptime'
alias w-='chmod u-w'
alias wl='wc -l'
alias x+='chmod u+x'
alias xp='tar -xvf'
alias xt='exit'

alias bri='brew install --verbose'
alias brl='brew deps --installed --tree $(brew leaves)'
alias bru='brew update --verbose && brew upgrade --verbose && brew cleanup --verbose'

alias bsd='brew services stop'
alias bsl='brew services list'
alias bsu='brew services start'

alias gmi='gem install'
alias gml='gem list --local --no-details | grep -v "default:"'
alias gmu='gem update --system && gem update --conservative && gem cleanup'

alias npi='npm install --global'
alias npl='npm list --global --depth 1'
alias npu='npm install npm --global && npm update --global'
