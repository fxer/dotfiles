# Install packages

apps=(
  ansible
  bash
  bash-completion2
  git
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

brew cask install google-cloud-sdk    # GCP cli tools
