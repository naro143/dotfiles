#!/bin/sh
#
# before run this script, following commands are needed.
# xcode-select --install

mkdir ~/backup

printf "\n--- Setup mac os defaults settings ---\n"
defaults write -g KeyRepeat -int 3
defaults write -g InitialKeyRepeat -int 11
defaults write com.apple.finder AppleShowAllFiles TRUE

printf "\n--- Installing HomeBrew ---\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew doctor
printf "\n--- Homebrew installed ---\n"

printf "\n--- Installing git ---\n"
brew install git

printf "\n--- Installing openssl ---\n"
brew install openssl

printf "\n--- Cloning dotfiles ---\n"
git clone https://github.com/naro143/dotfiles ~/dotfiles

printf "\n--- Setup shell... ---\n"
chsh -s /usr/local/bin/zsh

printf "\n--- Starting zsh ---\n"
zsh

[ -f ~/.zshrc ] && mv ~/.zshrc ~/backup/
[ -f ~/.zshenv ] && mv ~/.zshenv ~/backup/
ln -s ~/dotfiles/zsh/.zshrc ~
ln -s ~/dotfiles/zsh/.zshenv ~

printf "\n--- Installing dein ---\n"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
rm ~/installer.sh

printf "\n--- Installing shell packages ---\n"
brew bundle --file="~/dotfiles/brewfiles/shell"

# install trash
curl -O https://raw.githubusercontent.com/h-matsuo/macOS-trash/master/trash; chmod +x trash; mv trash /usr/local/bin


[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/backup/
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/backup/
[ -f ~/.bashrc ] && mv ~/.bashrc ~/backup/
[ -f ~/.vimrc ] && mv ~/.vimrc ~/backup/
[ -d ~/.vim ] && mv ~/.vim ~/backup/
[ -f ~/.config/coc/extensions/package.json ] && mv ~/.config/coc/extensions/package.json ~/backup/
[ -f ~/.tigrc ] && mv ~/.tigrc ~/backup/

ln -s ~/dotfiles/git/.gitignore_global ~
ln -s ~/dotfiles/bash/.bash_profile ~
ln -s ~/dotfiles/bash/.bashrc ~
ln -s ~/dotfiles/tmux/.tmux.conf ~
ln -s ~/dotfiles/vim/.vimrc ~
ln -s ~/dotfiles/vim/.vim ~
#ln -s ~/dotfiles/.xvimrc ~
#ln -s ~/dotfiles/.ideavimrc ~
#ln -s ~/dotfiles/.textlintrc ~
ln -s ~/dotfiles/vim/nvim ~/.config/nvim
ln -s ~/dotfiles/vim/.vim/* ~/.config/nvim/
ln -s ~/dotfiles/vim/coc/package.json ~/.config/coc/extensions/

# others
ln -s ~/dotfiles/tig/.tigrc ~
ln -s ~/dotfiles/efm-langserver/efm-config.yml ~/.config/efm-langserverconfig.yaml
# ln -s ~/dotfiles/yabai/.yabairc ~/.yabairc
# ln -s ~/dotfiles/skhd/.skhdrc ~/.skhdrc
ln -s ~/dotfiles/ripgrep/.rgignore ~/.rgignore

source ~/.zshrc

printf "\n--- Starting tmux ---\n"
tmux
tmux source-file ~/.tmux.conf

printf "\n--- Installing fzf ---\n"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

printf "\n--- Installing languages from homebrew ---\n"
brew bundle --file="~/dotfiles/brewfiles/lang"

# node
# ln -s ~/dotfiles/.eslintrc.json ~
# ln -s ~/dotfiles/tsconfig.json ~

# flutter
ln -s ~/dotfiles/flutter/analysis_options.yaml ~

printf "\n--- Installing apps by Homebrew-Cask.. ---\n"
brew bundle --file="~/dotfiles/brewfiles/cask"

# [ -d ~/.alacritty.yml ] && mv ~/.alacritty.yml ~/backup/
# ln -s ~/dotfiles/alacritty/.alacritty.mac.yml ~/.alacritty.yml

[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/backup/
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/git/.gitconfig-naro143 ~/.gitconfig-naro143

printf "\n--- Installing apps by mas.. ---\n"
brew install mas
brew bundle --file="~/dotfiles/brewfiles/mas"

printf "\n--- Other Settings... ---\n"
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf

printf "\n--- TODO... ---\n"
printf "\n* Setup .gitconfig-naro143\n"
printf "\n* Moving dotfiles repository\n"
printf "\n  * rm ~/dotfiles\n"
printf "\n  * ghq get git@github.com:naro143/dotfiles.git\n"
printf "\n  * ln -s /Users/naro143/ghq/src/github.com/naro143/dotfiles ~/dotfiles\n"

