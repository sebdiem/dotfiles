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

brew install bash
brew install bash-completion
brew install ffmpeg
brew install git
brew install languagetool
brew install macvim --override-system-vim
brew install multimarkdown
brew install pandoc
brew install postgresql
brew install python
brew install unrar
