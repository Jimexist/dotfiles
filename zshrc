# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z git docker encode64 history rails ruby)

source $ZSH/oh-my-zsh.sh

# use vim
export EDITOR=vim

# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"

# homebrew dir goes first
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH"

if [ "$TERM_PROGRAM"  = 'iTerm.app' ]; then
    tmux has -t hack &> /dev/null
    if [ $? != 0 ]; then
        tmux new -s hack
    elif [ -z $TMUX ]; then
        tmux attach -t hack
    fi
fi

export PATH="$PATH:$HOME/.local/bin"
# export PATH="$(brew --prefix openjdk)/bin:$PATH"
export PATH="$(brew --prefix bison)/bin:$PATH"
export PATH="$(brew --prefix make)/libexec/gnubin:$PATH"
export PATH="$PATH:/opt/X11/bin"
export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin"
export PATH="$PATH:$(brew --prefix binutils)/bin"
export PATH="$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"

export MANPATH="/usr/local/man:$MANPATH"
export JAVA_HOME="$(brew --prefix openjdk)/libexec/openjdk.jdk/Contents/Home"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi # Compilation flags # export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH=" ~/.ssh/id_ed25519"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias l="exa -al --git"
alias b="bat"

export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix go)/libexec"

export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

export DOCKER_HOST="unix:///var/run/docker.sock"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export GPG_TTY=$(tty)


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(starship init zsh)"

function proxy_on() {
    export http_proxy=http://127.0.0.1:54728
    export https_proxy=http://127.0.0.1:54728
    echo -e "Proxy is turned on"
}

function proxy_off(){
    unset http_proxy https_proxy
    echo -e "Proxy is turned off"
}

function jhome() {
  export JAVA_HOME=`/usr/libexec/java_home -v $@`
  echo "JAVA_HOME:" $JAVA_HOME
  echo "java -version:"
  java -version
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

