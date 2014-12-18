if hash brew 2>/dev/null; then
    echo "homebrew is already installed"
    echo "Aborting..."
    exit 1
fi
# install homebrew:
echo "installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew doctor

# install programs with brew
brew install ack
brew install bash
brew install bash-completion
brew install coreutils
brew install ctags-exuberant
brew install ffmpeg
brew install findutils
brew install git
brew install irssi
brew install languagetool
brew install macvim --override-system-vim
brew install multimarkdown
brew install pandoc
brew install postgresql
brew install python
brew install tree
brew install unrar

# install programs with cask
brew tap phinze/cask
brew install brew-cask
brew cask doctor

brew cask install dropbox
brew cask install iterm2
brew cask install google-chrome
brew cask install google-drive
brew cask install qlmarkdown
brew cask install spectacle
brew cask install transmission
brew cask install vlc
brew cask install karabiner

brew cask cleanup
brew cleanup
