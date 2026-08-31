# Overall System Settings

A repository for development environment configuration files

## Installation

Expects brew, bundle, code, git, iterm2, emacs, vim and fish

- If you are on apple architecture setup environment like so:

```shell
❯ cp -nv ~/dotfiles-public/arm64/gitconfig ~/.gitconfig
❯ cp -nv ~/dotfiles-public/arm64/zprofile ~/.zprofile
❯ cp -nv ~/dotfiles-public/arm64/config.fish ~/.config/fish/config.fish
❯ brew bundle install --file=~/dotfiles-public/arm64/Brewfile
❯ mkdir -pv ~/.bundle
❯ cp -nv ~/dotfiles-public/bundle/config ~/.bundle
```

- Finally install the color theme with raco package manager

- Configure editing from the command line using vim like so:

```shell
❯ mkdir -pv ~/.vim/autoload
❯ mkdir -pv ~/.vim/files/back
❯ mkdir -pv ~/.vim/files/swap
❯ mkdir -pv ~/.vim/files/undo
❯ cp -nv ~/dotfiles-public/arm64/vimrc ~/.vimrc
```

- Bring plug.vim in the autoload folder and do :PlugInstall

- Finally update vs code configuration using these steps:

```shell
❯ cd ~/Library/Application\ Support/Code/User
❯ cp -nv ~/dotfiles-public/code/settings.json ./settings.json
```

- Configure system wide editing with emacs-plus-app like so:

```shell
❯ mkdir -pv ~/.config/emacs
❯ mkdir -pv ~/.config/emacs/files/back
❯ mkdir -pv ~/.config/emacs/files/swap
❯ mkdir -pv ~/.config/emacs/files/undo
❯ cp -nv ~/dotfiles-public/arm64/init.el ~/.config/emacs/init.el
```

- Finally install the color theme from the melpa repository
