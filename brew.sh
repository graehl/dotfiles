#!/usr/bin/env bash

# Install command-line tools using Homebrew.

which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
#brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf

brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2 # image metadata
brew install imagemagick --with-webp
brew install lua
#brew install lynx
brew install p7zip
brew install pigz
brew install pv # pipe viewer
brew install rename
#brew install rhino
#brew install speedtest_cli
brew install ssh-copy-id
#brew install testssl
brew install tree #ls -r
brew install vbindiff #visual binary diff
#brew install webkit2png
#brew install zopfli #extra (slow) .gz compression

brew install git
brew install git-lfs
brew install wget
(
    cd ~
    mkdir bin
    cd ~/bin
    ln -sf ~/u/subst.pl .
    ln -sf ~/u/libgraehl.pl .
    wget https://llvm.org/svn/llvm-project/compiler-rt/trunk/lib/asan/scripts/asan_symbolize.py
    chmod +x asan_symbolize.py
    ln -s /usr/local/Cellar/git/*/etc/bash_completion.d/git-completion.bash bin/
    ln -s /usr/local/Cellar/git/*/etc/bash_completion.d/git-prompt.sh bin/
)

brew install Caskroom/versions/iterm2-beta

brew install ctags

brew cask install java
brew install clang-format
brew install cabextract
(
    brew tap caskroom/fonts
    brew cask install font-inconsolata
    brew cask install font-source-code-pro
)
brew install homebrew/versions/gcc6
brew tap railwaycat/emacsmacport
brew install emacs-mac
brew install ag
ln -sf ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/icloud

(
    cd
    mkdir tmp
    cd tmp
    curl -O http://download.microsoft.com/download/f/5/a/f5a3df76-d856-4a61-a6bd-722f52a5be26/PowerPointViewer.exe
    cabextract PowerPointViewer.exe
    cabextract ppviewer.cab
    open CONSOLA*.TTF
)

brew install python
brew install Homebrew/python/pillow
#pip install pillow
# Remove outdated versions from the cellar.
brew cleanup
(
    cd ~
    mkdir src
    cd ~/src
)
brew install mcpp
echo 'open /System/Library/CoreServices/Applications/Screen\ Sharing.app/'
