# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
alias v="nvim"
alias dotmem="nohup dotMemory > /dev/null 2>&1 &"
alias obsidian="nohup obsidian > /dev/null 2>&1 &"
alias obs="~/Documents/'Obsidian Vault'"
alias c="~/.config"
alias src="source ~/.zshrc"
alias bkup="~/portable-sez/update.sh"
alias clay="~/workspace/clay"
alias ws="~/workspace"
alias ride="rider . > /dev/null 2>&1 &"

function ks() {
    if [[ "$1" == "cd" ]]; then
        local cdpath=$(find "$HOME/workspace/clay/cd/ks-connect/" -mindepth 1 -maxdepth 1 -type d | fzf --height=50% --preview '')
        if [[ -n "$cdpath" ]]; then
            cd "$cdpath" || return 1
        fi
    else
        local path=$(find "$HOME/workspace/clay/ks-connect/" -mindepth 1 -maxdepth 1 -type d | fzf --height=50% --preview '')
        if [[ -n "$path" ]]; then
            cd "$path" || return 1
        fi
    fi
}

#fetch gitlab mrs

function mrs(){
    typeset -A mrs_arr
    local glab_key=$(awk 'NR==15' ~/.nuget/NuGet/NuGet.Config | awk -F\" '{print $4}')
    local glab_url='https://gitlab.com/api/v4/merge_requests?author_id=21561899&state=opened'
    local response=$(curl -s --header "PRIVATE-TOKEN: $glab_key" $glab_url| jq -r '.[] | "\(.title)\t\(.web_url)"' )

    while IFS=$'\t' read -r title web_url; do
        local project=$(echo $web_url | awk -F"/" '{print $7}')
        local key="$project --> $title"
        mrs_arr[$key]="$web_url"
    done < <(printf "%s\n" "$response")

    local selected_title=$(printf "%s\n" "${(@k)mrs_arr}" | fzf --height=50% --preview '')
    if [[ -n "$selected_title" ]]; then
        nohup brave-browser "${mrs_arr[$selected_title]}" > /dev/null 2>&1
    fi
}

# docker aliases
alias dils="docker images"
alias dcls="docker container ls"

# git aliases
alias gslog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gp="git push"
alias gpf="git push -f"
function gc() { git commit -m $@ ;}
function origin() { 
	local repository=$(git remote -v | awk -F: NR==2'{print $2}' | sed 's/ (push)//')
    local domain=$(git remote -v | awk -F@ '{print $2}' | awk -F. '{print $1}' | head -n 1)
	nohup brave-browser "https://$domain.com/$repository" > /dev/null 2>&1 &
}

#azure CLI commands:
alias az-sub="az account list | jq -r '.[] | \"\(.name)\"' | fzf | xargs az account set -n "

#dotnet tools
export PATH="$PATH:/$HOME/.dotnet/tools"
#git Scripts
export PATH="$PATH:/$HOME/portable-sez/gitScripts"
#python pckgs path
export PATH="$PATH:/$HOME/.local/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#bindkey '^ ' autosuggest-accept
bindkey -s '^f' "fzf --print0 --bind 'enter:execute(nvim {})' \n"
bindkey -s '^z' "fg \n"
bindkey -s '^o' '~\n'
#bindkey -s '^t' 'tree -L 2'

#ZSH_THEME="robbyrussell"
ZSH_THEME="cloud"


# rg for fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden \
   --glob '!.git/*' --glob '!*/.git/*' \
   --glob '!venv/*' --glob '!*/venv/*' \
   --glob '!__pycache__/*' --glob '!*/__pycache__/*' \
   --glob '!node_modules/*' --glob '!*/node_modules/*' \
   --glob '!obj/*'  --glob '!*/obj/*' \
   --glob '!bin/*' --glob '!*/bin/*' \
   --glob '!.obsidian/*' --glob '!*/.obsidian/*'"
fi


export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --border --margin=1 --padding=1 \
    --preview 'cat {}'  \
    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899' "


# show only user in terminal
export DEFAULT_USER=$USER

# Standard plugins can be found in $ZSH/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(zsh-autosuggestions)
plugins=(git)
plugins=(fzf)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export PATH=$PATH:/snap/bin

# jq json colors
export JQ_COLORS="2;33:2;33:0;33:0;36:1;32:0;35:1;35:2;34"
#
# less env to show color in less and make searching insensitive
#
export LESS="-Ri"

# clean duplicated paths 
export PATH=$(echo $PATH | tr ':' '\n' | sort | uniq | paste -sd:)
