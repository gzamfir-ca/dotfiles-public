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
    abbr hls 'brew list --versions (brew list --installed-on-request) && brew list --casks --versions'
    abbr hup 'brew update --verbose && brew upgrade --verbose && brew cleanup --verbose'

    # Add ruby cmd abbreviations
    abbr rls 'gem list --local --no-details | grep -v "default:"'
    abbr rup 'gem update --system && gem update && gem cleanup'

    # Add node cmd abbreviations
    abbr nls 'npm ls --global --depth 1'
    abbr nup 'npm install --global npm && npm update --global'

    # Add most used git commands
    abbr gad 'git add -A && git commit --amend --no-edit'
    abbr gam 'git commit --amend -m'
    abbr gcm 'git add -A && git commit -m'
    abbr gco git checkout
    abbr gdf 'git diff origin/(git rev-parse --abbrev-ref HEAD)..HEAD'
    abbr gdr 'git add -A --dry-run'
    abbr gfe 'git fetch --all && git rebase origin/(git rev-parse --abbrev-ref HEAD)'
    abbr glg 'git log --oneline --graph --decorate --stat'
    abbr gll 'git log origin/(git rev-parse --abbrev-ref HEAD)..HEAD'
    abbr gpf 'git push -f origin (git rev-parse --abbrev-ref HEAD)'
    abbr gpu 'git push -u origin (git rev-parse --abbrev-ref HEAD)'
    abbr gst 'git status --verbose'

    # Add multi ... abbreviation
    function multcd --description 'climb repeatedly one level up'
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr dotdot --regex '^\.\.+$' --function multcd

    # Add create pod config file
    function newpod --description 'creates a new pod config file'
        printf "---\npodname: %s\nruntime: %s\n" >pod.yml $argv[1] $argv[2]
    end

end
