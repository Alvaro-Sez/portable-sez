SCRIPT_DIR="$(dirname "$(realpath "$0")")"
#
cp ~/.zshrc $SCRIPT_DIR/.zshrc
cp ~/.ideavimrc $SCRIPT_DIR/.ideavimrc
cp ~/.tmux.conf $SCRIPT_DIR/.tmux.conf
cp ~/.config/nvim/init.vim  $SCRIPT_DIR/init.vim
cp ~/.config/alacritty/alacritty.toml $SCRIPT_DIR/alacritty.toml

cd $SCRIPT_DIR > /dev/null


IS_DIFF=$(git --no-pager diff | wc -c)

if [ "$IS_DIFF" -eq 0 ]; then
    echo "everything up to date."
    exit 1
fi

git diff

read -p "Do you want to commit the changes? (Y/N): " yesorno

if [ "$yesorno" = "Y" ] || [ "$yesorno" = "y" ]; then
    # Place your action for 'Y' here
    git add .
    DATE=$(date)
    git commit -m "update: $DATE"
    git push 
fi

# Check if the string contains 'N'
if [ "$yesorno" = "N" ] || [ "$yesorno" = "n" ]; then
    echo "the changes where not commited."
    # Place your action for 'N' here
fi

cd "-" > /dev/null
