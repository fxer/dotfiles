# Install packages

apps=(
  ansible
  bash
  bash-completion2
  docker-compose
  docker-credential-helper
  git
  golang
  htop
  imagemagick
  jq
  kubectl
  mtr
  nmap
  postgresql
  python
  ssh-copy-id
  trash
  tree
  wget
  xz
)

brew install "${apps[@]}"

brew cask install macvim              # visual vim (cask updates don't break dock symlinks, like regular brew)
brew cask install google-cloud-sdk    # GCP cli tools
brew cask install postico             # visual postgresql tool
brew cask install virtualbox          # docker, and other, VM host
brew cask install steam               # why not?
brew cask install vlc                 # need to play them vids
brew cask install sourcetree          # who don't like visual git diffs
brew cask install signal              # message safety first
brew cask install slack               # chat chat chat
brew cask install discord             # chat chat chat
brew cask install docker              # Use Docker for Mac, which doesn't require a separate VM like virtualbox
brew cask install minikube            # some light local kubernetes-ing
brew cask install teamviewer          # gotta help family right
brew cask install tor-browser         # convenient way to proxy-browse to test sites
brew cask install yakyak              # best Google Hangouts chat client currently

# Add homebrew bash 4 as valid shell, set as user's shell
if ! grep -q /usr/local/bin/bash /etc/shells; then
   echo /usr/local/bin/bash | sudo tee -a /etc/shells;
   chsh -s /usr/local/bin/bash;
fi;

# Install python helpers
pip3 install virtualenvwrapper
