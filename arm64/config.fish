if status is-interactive

    # Disable sh welcome message
    function fish_greeting
    end

    # Configure brew environment
    /opt/homebrew/bin/brew shellenv | source
    set -gx HOMEBREW_NO_INSTALL_FROM_API 1

    # Configure psql@16 binaries
    fish_add_path --path /opt/homebrew/opt/postgresql@16/bin

    # Configure node environment
    nodenv init - | source

    # Configure ruby environment
    rbenv init - | source

    # Configure lisp environment
    fish_add_path --path /Applications/Racket\ v9.3/bin

    # Configure fish environment
    set -gx CLICOLOR 1
    set -gx EDITOR vim
    set -gx LSCOLORS ExFxBxDxCxegedabagacad
    set -gx PAGER less

    # Configure java environment
    set -gx JAVA_HOME (/usr/libexec/java_home --version 25)
    set -gx M2_HOME (readlink -f /opt/homebrew/opt/maven/libexec)
    set -gx GRADLE_HOME (readlink -f /opt/homebrew/opt/gradle/libexec)

    # Add brew cmd abbreviations
    abbr --add brwls 'brew list --versions (brew list --installed-on-request) && brew list --casks --versions'
    abbr --add brwup 'brew update --verbose && brew upgrade --verbose && brew cleanup --verbose'

    # Add ruby cmd abbreviations
    abbr --add gemls 'gem list --local --no-details | grep -v "default:"'
    abbr --add gemup 'gem update --system && gem update && gem cleanup'

    # Add node cmd abbreviations
    abbr --add npmls 'npm ls --global --depth 1'
    abbr --add npmup 'npm install --global npm && npm update --global'

    # Add git args abbreviations
    abbr --command git ad 'add -A && git commit --amend --no-edit'
    abbr --command git am 'commit --amend -m'
    abbr --command git cm 'add -A && git commit -m'
    abbr --command git co checkout
    abbr --command git dr 'add -A --dry-run'
    abbr --command git fe 'fetch --all && git rebase origin/$(git rev-parse --abbrev-ref HEAD)'
    abbr --command git lg 'log --oneline --graph --decorate --stat'
    abbr --command git ll 'log origin/(git rev-parse --abbrev-ref HEAD)..HEAD'
    abbr --command git pf 'push -f origin $(git rev-parse --abbrev-ref HEAD)'
    abbr --command git pu 'push -u origin $(git rev-parse --abbrev-ref HEAD)'
    abbr --command git st 'status --verbose'

    # Add common bundle commands
    abbr --add be 'bundle exec'
    abbr --add bo 'bundle outdated'
    abbr --add bu 'bundle update --all'

    # Make system commands safer
    function cp --wraps cp --description 'alias cp=cp -nv'
        command cp -nv $argv
    end

    function mv --wraps mv --description 'alias mv=mv -nv'
        command mv -nv $argv
    end

    function rm --wraps rm --description 'alias rm=rm -iv'
        command rm -iv $argv
    end

    # Add easier system commands
    function gt --description 'alias gt=cd (git rev-parse --show-toplevel)'
        cd (git rev-parse --show-toplevel)
    end

    function mc --wraps mkdir --description 'alias mc=mkdir -pv && cd'
        command mkdir -pv $argv && cd $argv
    end

    function md --wraps mkdir --description 'alias md=mkdir -pv'
        command mkdir -pv $argv
    end

    function ms --wraps mkdir --description 'alias ms=mkdir -pv (seq)'
        command mkdir -pv $argv[1](seq -f "%02g" $argv[2])
    end

    function mt --wraps mkdir --description 'alias mt=mkdir -pv (date) && cd'
        command mkdir -pv (date +%Y%m%d) && cd (date +%Y%m%d)
    end

    function tree --wraps tree --description 'alias tree=tree -a'
        command tree -a $argv
    end

    # Add create pod config file
    function newpod --description 'creates a new pod config file'
        printf "---\npodname: %s\nruntime: %s\n" >pod.yml $argv[1] $argv[2]
    end
end
