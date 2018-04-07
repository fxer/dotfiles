# Install packages

apps=(
  ansible
  bash
  bash-completion2
  git
  golang
  htop
  imagemagick
  macvim
  mtr
  nmap
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
brew cask install docker              # docker & docker-compose
brew cask install virtualbox          # docker, and other, VM host
