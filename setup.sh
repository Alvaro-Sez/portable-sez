#---- Installation ----#
apt update && apt upgrade -y

# utils
apt install -y git curl htop tmux fzf zsh

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
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
# create if not exists
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/alacritty

cp $SCRIPT_DIR/.zshrc $HOME/.zshrc 
cp $SCRIPT_DIR/.ideavimrc $HOME/.ideavimrc 
cp $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf 
cp $SCRIPT_DIR/init.vim $HOME/.config/nvim/init.vim  
cp $SCRIPT_DIR/alacritty.toml $HOME/.config/alacritty/alacritty.toml

# git scripts path
export PATH="$PATH:/$SCRIPT_DIR/gitScripts"

#Install vim pluggins
nvim -es -u $HOME/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"
chsh -s zsh
echo "Configuration applied"

# cleaning path
