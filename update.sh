SCRIPT_DIR="$(dirname "$(realpath "$0")")"

cp $HOME/.zshrc $SCRIPT_DIR/.zshrc
cp $HOME/.ideavimrc $SCRIPT_DIR/.ideavimrc
cp $HOME/.tmux.conf $SCRIPT_DIR/.tmux.conf
cp $HOME/.config/nvim/init.vim  $SCRIPT_DIR/init.vim
cp $HOME/.config/alacritty/alacritty.toml $SCRIPT_DIR/alacritty.toml

cd $SCRIPT_DIR > /dev/null

IS_DIFF=$(git --no-pager diff | wc -c)

if [ "$IS_DIFF" -eq 0 ]; then
    echo "everything up to date."
    exit 1
fi

git diff

read -p "Do you want to commit the changes? (Y/N): " yesorno

if [ "$yesorno" = "Y" ] || [ "$yesorno" = "y" ]; then
    git add .
    DATE=$(date)
    git commit -m "update: $DATE"
    git push 
fi

if [ "$yesorno" = "N" ] || [ "$yesorno" = "n" ]; then
    echo "the changes where not commited."
fi

cd "-" > /dev/null
