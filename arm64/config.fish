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

    # Make system commands safer
    abbr cp 'cp -nv'
    abbr mv 'mv -nv'
    abbr rm 'rm -iv'

    # Add easier system commands
    abbr cl clear
    abbr ct 'bat --theme="Catppuccin Macchiato" --style=changes,numbers'
    abbr cx 'clear && exit'
    abbr gt 'cd (git rev-parse --show-toplevel)'
    abbr md 'mkdir -pv'
    abbr ta 'tree -a'

    # Add common bundle commands
    abbr be 'bundle exec'
    abbr bo 'bundle outdated'
    abbr bu 'bundle update --all'

    # Add brew cmd abbreviations
    abbr bls 'brew list --versions (brew list --installed-on-request) && brew list --casks --versions'
    abbr bup 'brew update --verbose && brew upgrade --verbose && brew cleanup --verbose'

    # Add ruby cmd abbreviations
    abbr gls 'gem list --local --no-details | grep -v "default:"'
    abbr gup 'gem update --system && gem update && gem cleanup'

    # Add node cmd abbreviations
    abbr nls 'npm ls --global --depth 1'
    abbr nup 'npm install --global npm && npm update --global'

    # Add git args abbreviations
    abbr --command git ad 'add -A && git commit --amend --no-edit'
    abbr --command git am 'commit --amend -m'
    abbr --command git cm 'add -A && git commit -m'
    abbr --command git co checkout
    abbr --command git df 'diff origin/$(git rev-parse --abbrev-ref HEAD)..HEAD'
    abbr --command git dr 'add -A --dry-run'
    abbr --command git fe 'fetch --all && git rebase origin/$(git rev-parse --abbrev-ref HEAD)'
    abbr --command git lg 'log --oneline --graph --decorate --stat'
    abbr --command git ll 'log origin/$(git rev-parse --abbrev-ref HEAD)..HEAD'
    abbr --command git pf 'push -f origin $(git rev-parse --abbrev-ref HEAD)'
    abbr --command git pu 'push -u origin $(git rev-parse --abbrev-ref HEAD)'
    abbr --command git st 'status --verbose'

    # Add create pod config file
    function newpod --description 'creates a new pod config file'
        printf "---\npodname: %s\nruntime: %s\n" >pod.yml $argv[1] $argv[2]
    end
end
