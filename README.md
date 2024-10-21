# Dotfiles public repository

### Purpose

- Hosts various development environment configuration files

### Usage

- Expects brew, bundle, code, git, iterm2, rsync, vim, zshell

- If you are on apple architecture setup environment like so:

```
❯ ln -sfn ~/dotfiles-public/arm64/gitconfig ~/.gitconfig
❯ ln -sfn ~/dotfiles-public/arm64/zprofile ~/.zprofile
❯ ln -sfn ~/dotfiles-public/arm64/zshrc ~/.zshrc
❯ brew bundle install --file=~/dotfiles-public/arm64/Brewfile
```
- Configure editing from the command line using vim like so:

```
❯ mkdir -pv ~/.vim/autoload
❯ mkdir -pv ~/.vim/files/back
❯ mkdir -pv ~/.vim/files/swap
❯ ln -sfn ~/dotfiles-public/arm64/vimrc ~/.vimrc
```

then download the plug.vim in the autoload folder and do :PlugInstall

- Install & configure custom command line utilities like so:

```
❯ cd /usr/local/bin
❯ ln -sfn ~/dotfiles-public/bin/zsync ./zsync
```

- Finally install & configure code using the following steps:

```
❯ cd ~/Library/Application\ Support/Code/User
❯ ln -sfn ~/dotfiles-public/code/settings.json ./settings.json
❯ code --install-extension <extension_name>
```
