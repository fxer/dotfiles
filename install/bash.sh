# Install and configure Bash

apps=(
  bash
  bash-completion2
  kube-ps1
)

brew install "${apps[@]}"

# Add homebrew Bash as valid shell, set as user's shell
if ! grep -q /usr/local/bin/bash /etc/shells; then
   echo /usr/local/bin/bash | sudo tee -a /etc/shells;
   chsh -s /usr/local/bin/bash;
fi;
