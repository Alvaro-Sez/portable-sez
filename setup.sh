#---- Installation ----#
apt update && apt upgrade -y

# utils
apt install -y git curl htop tmux fzf zsh jq ripgrep

# installing oh-my-zsh with options
export CHSH='no'
export RUNZSH='no'
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install.sh
chmod +x ./install.sh && ./install.sh && rm install.sh
unset $CHSH
unset $RUNZSH
echo "OhMyZsh Installed"

# installing auto-suggestions zsh pluggin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "autosuggestions Installed"

# installing neovim
curl -sSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
export PATH="$PATH:/opt/nvim-linux64/bin"
echo "NeoVim Installed"

# installing vim-plug
curl -fsSLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Vim-Plug Installed"

# installing alacritty
# packages needed for compiling alacritty
apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
# rust needed for compiling alacritty
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rust-init.sh && chmod +x ./rust-init.sh && ./rust-init.sh -y
rm ./rust-init.sh
export PATH="$PATH:/$HOME/.cargo/bin"
cargo install alacritty
echo "Alacritty Installed"

#---- Configuration ----#
chmod +x ./configure.sh
./configure.sh
# cleaning path
