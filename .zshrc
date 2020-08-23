set +x
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
EDITOR="vim"
# Directories to be prepended to $PATH
declare -a dirs_to_prepend
dirs_to_prepend=(
  "/usr/bin"
  "/usr/local/sbin"
  "/usr/local/git/bin"
    "/usr/local/"
  "/usr/local/mysql/bin"
  "/sw/bin/"
  "$HOME/dotfiles/bin"
  "$HOME/bin"
  "$(brew --prefix ruby)/bin"
  "$(brew --prefix coreutils)/libexec/gnubin" # Add brew-installed GNU core utilities bin
  "$(brew --prefix)/share/npm/bin" # Add npm-installed package bin
)

# Explicitly configured $PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

for dir in ${(k)dirs_to_prepend[@]}
do
  if [ -d ${dir} ]; then
    # If these directories exist, then prepend them to existing PATH
    PATH="${dir}:$PATH"
  fi
done

unset dirs_to_prepend


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"

# Z beats cd most of the time
. $HOME/dotfiles/z/z.sh

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/dotfiles/zsh
#source ~/dotfiles/virtualenv-autodetect/virtualenv-autodetect.sh
#source ~/dotfiles/virtualenv-autodetect/virtualenv-autodetect.plugin.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew node npm vi-mode history git-flow zsh-syntax-highlighting gradle git ruby)

# User configuration

# Load the shell dotfiles
for file in $HOME/.{shell_exports,shell_aliases,shell_functions,shell_config}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Automatically list directory contents on `cd`.
# auto-ls () {
#   emulate -L zsh;
#   # explicit sexy ls'ing as aliases arent honored in here.
#   hash gls >/dev/null 2>&1 && CLICOLOR_FORCE=1 gls -aFh --color --group-directories-first || ls
# }
# chpwd_functions=( auto-ls $chpwd_functions )

source $ZSH/oh-my-zsh.sh

# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

# npm tab completion
. <(npm completion)
GITHUB_OAUTH_TOKEN=0aa6e9c031b9cd8ed4d4684f36cb6a796ae7343f
# fortune: brew install fortune ponysay
# fortune

# n is the new NVM
# export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

bindkey -v
bindkey '^[C]' forward-word
bindkey '^[[1;9D' backward-word
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

# COMMENTED BECAUSE VERY SLOW
# export SDKMAN_DIR="/Users/jfinlays/.sdkman"
# [[ -s "/Users/jfinlays/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jfinlays/.sdkman/bin/sdkman-init.sh"

GCLOUD_SERVICE_KEY=$(cat ~/dotfiles/key.json)
GOOGLE_APPLICATION_CREDENTIALS=~/dotfiles/key-owner.json

export GEM_HOME=~/.gems
export PATH="$GEM_HOME/bin:$PATH"
export PROJECT_ID=sable-242108
export PATH

echo "done"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jfinlays/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jfinlays/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jfinlays/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jfinlays/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# alias python=/usr/local/bin/python3.8
