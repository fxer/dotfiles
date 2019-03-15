# Install and configure zsh

apps=(
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
)

brew install "${apps[@]}"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerlevel9k oh-my-zsh theme
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k

# patched terminal font for powerlevel9k
# https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/L/Regular
cp "../files/*.ttf" $HOME/Library/Fonts
