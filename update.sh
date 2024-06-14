SCRIPT_DIR="$(dirname "$(realpath "$0")")"
#
cp ~/.zshrc $SCRIPT_DIR/.zshrc
cp ~/.ideavimrc $SCRIPT_DIR/.ideavimrc
cp ~/.tmux.conf $SCRIPT_DIR/.tmux.conf
cp ~/.config/nvim/init.vim  $SCRIPT_DIR/init.vim
cp ~/.config/alacritty/alacritty.toml $SCRIPT_DIR/alacritty.toml

cd $SCRIPT_DIR > /dev/null

git diff
git add .
DATE=$(date)
git commit -m "update: $DATE"

cd "-" > /dev/null
