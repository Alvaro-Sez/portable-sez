# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
alias v="nvim"
alias dotmem="nohup dotMemory > /dev/null 2>&1 &"
alias jm="nohup jmeter > /dev/null 2>&1 &"
alias c="~/.config"
alias src="source ~/.zshrc"
alias bkup="~/portable-sez/update.sh"
alias clay="~/workspace/clay"
alias conn="~/workspace/clay/ks-connect"
alias conncd="~/workspace/clay/cd/ks-connect"
alias ws="~/workspace"

# docker aliases
alias dils="docker images"
alias dcls="docker container ls"

# git aliases
alias gslog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
#alias checkout='git checkout $(git branch | fzf)'
#alias git-compare='git log --oneline | fzf --height=50% | awk "{print \$1}" | xargs -I "{}" git diff {}~ {}'

alias gs="git status"
alias gd="git diff"
alias ga="git add ."
alias gp="git push"
function gls(){
	git ls-tree -r $(git rev-parse --abbrev-ref HEAD) --name-only
}

function gc() { git commit -m $@ ;}

function origin() { 
	local repository=$(git remote -v | awk -F: NR==2'{print $2}' | sed 's/ (push)//')
    local domain=$(git remote -v | awk -F@ '{print $2}' | awk -F. '{print $1}' | head -n 1)
	nohup brave-browser "https://$domain.com/$repository" > /dev/null 2>&1 &
}


export PATH="$PATH:/$HOME/.dotnet/tools"
export PATH="$PATH:/$HOME/portable-sez/gitScripts"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
bindkey '^ ' autosuggest-accept
bindkey -s '^f' "fzf --print0  --bind 'enter:execute(nvim {})' \n"
     \
#bindkey -s '^f' 'fzf --print0 | xargs -0 -r -o nvim\n'
bindkey -s '^o' '~\n'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# enabling rg to work with fzf
#

if type rg &> /dev/null; then
  #export FZF_DEFAULT_COMMAND="rg --files --hidden"
  #export FZF_DEFAULT_COMMAND="find -L -type f -not -iwholename '*.git*'"
fi

# export FZF_DEFAULT_COMMAND="find -L -type f -not -iwholename '*.git*' -o -type d"
export FZF_DEFAULT_COMMAND="find . -type f -not -path '*/.git*/*'"

export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --border --margin=1 --padding=1 \
    --preview 'cat {}'  \
    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899' "
# violet: #9400D3
# grey with blue tones: #778899


 
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

export PATH=$(echo $PATH | tr ':' '\n' | sort | uniq | paste -sd:)
