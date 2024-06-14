SCRIPT_DIR="$(dirname "$(realpath "$0")")"
#
cp ~/.zshrc $SCRIPT_DIR/.zshrc
cp ~/.ideavimrc $SCRIPT_DIR/.ideavimrc
cp ~/.tmux.conf $SCRIPT_DIR/.tmux.conf
cp ~/.config/nvim/init.vim  $SCRIPT_DIR/init.vim
cp ~/.config/alacritty/alacritty.toml $SCRIPT_DIR/alacritty.toml

echo "everything up to date"

cd $SCRIPT_DIR > /dev/null

git add .
git commit -m "updating config"

cd "-" > /dev/null
