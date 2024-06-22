# create if not exists
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/alacritty

cp $SCRIPT_DIR/.zshrc $HOME/.zshrc 
cp $SCRIPT_DIR/.ideavimrc $HOME/.ideavimrc 
cp $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf 
cp $SCRIPT_DIR/init.vim $HOME/.config/nvim/init.vim  
cp $SCRIPT_DIR/alacritty.toml $HOME/.config/alacritty/alacritty.toml

#Install vim pluggins
nvim -es -u $HOME/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa"
chsh -s zsh
echo "Configuration applied"

# cleaning path
