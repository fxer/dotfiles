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

# allow mtr to run without sudo
mtrlocation=$(brew info mtr | grep Cellar | sed -e 's/ (.*//') #  e.g. `/Users/paulirish/.homebrew/Cellar/mtr/0.86`
sudo chmod 4755 $mtrlocation/sbin/mtr
sudo chown root $mtrlocation/sbin/mtr
