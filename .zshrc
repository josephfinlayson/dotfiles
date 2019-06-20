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
    "$HOME/Library/Python/2.7/bin"
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

# fortune: brew install fortune ponysay
# fortune

# n is the new NVM
# export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export ANDROID_HOME=~/Library/Android/sdk
PATH=${PATH}:${ANDROID_HOME}/tools
PATH=${PATH}:${ANDROID_HOME}/platform-tools

bindkey -v
bindkey '^[C]' forward-word
bindkey '^[[1;9D' backward-word
echo "done"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

# COMMENTED BECAUSE VERY SLOW
# export SDKMAN_DIR="/Users/jfinlays/.sdkman"
# [[ -s "/Users/jfinlays/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/jfinlays/.sdkman/bin/sdkman-init.sh"

GCLOUD_SERVICE_KEY='{
  "type": "service_account",
  "project_id": "sable-242108",
  "private_key_id": "a8e04db010385203c31ef6d2c7cfaccde3ded985",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDcsyXweMB9MqGE\n99//nCxsKbkSRm8tVbBgZTVAh59AUDr71O7/J+7agVc7U7e0l1MtdoldDYmZ3X6m\nO/0nnB4pzzkuPJU4kLBbkDeRiNCEvDTA1HpmbOAtehPL6UQBmTO67AljRWrZNKYd\nBcD7kqQ9jxGWh2i5O/F1uLT05by/6wEj3gCJrRlrkw4co8YA9Ilt3iQRn5cKsius\nzqINyhPD6+yy8gH/FNtPgOUcqFYYwVmrtSlXxqUNqZObu5fMai3yhpEl48WWMkjK\n7RFWX/+E9oDZDbacjLjKx4igYVidGnEVk6HfYSflZRnsWmZViZ5gg3Iq/c00gBFB\nf2ArGjWVAgMBAAECggEAHLRblmELiXJo3z5NZCr1UiTDvT9A8ttcGHrWssEQ8uXx\nzf2TZMdWVxVkeZhkDSPIveHWxYNfEWPlYYyYMACA9yd3Ge7nlOxTVmK1qi2VD/aE\nlqHsFjSfRvruO+K9JXITcC0xSWKRc5UCl/AUJK7ywqOVgjJev1zZr68phgKitS6H\nJNpNuCfD8HZXJrgxWlnpRuOMLMP2vny8wPoOmnfBD6SgYDX6786Pis3S8Dx+NfEG\ntrJqz2OsmTgoqd+6j+n54qk5bUjNPyMiRjq2CxOhtB/UMbYrtbTKOSpHdk8oJpWQ\nzj3ZaP431HYxg/gCOFv+BkZM/U+C4QoUGgbFkGt/fwKBgQD758EGyXUz6X7mnXZe\nl7M5SFcYJ/iiU/J/jpVtDA+1nRCr8JZ+S8rxp1eRtLfMnP1lNQTZmvWkjkt+ukfB\nglrlkMm6RiBehvEFqmhYnIJzb+v9ZALP3zIlC2Kzk6+UyPNPzCpfb3TXtNTC4eDR\nK42Y4BOeJT9bjdn81TlG7PNojwKBgQDgSYoqPG6dVgBS5K9fGHeeo9VaD3CpAYws\nOrDaVH6SAfHaQUXpNbGoYh4SLTTN/Jd9o7/9HINvmrrxhnwEobDseGjbtEXkVLSx\ngQa895V5OoB102gcydzdQsUit+lT+NJ6paOijIauLxdry03LEq6g+g62UOcO+DdA\njc4RN9UpmwKBgQDLbqfmET/DgqfnGfcEAULN2evsKCuU/HJ0LPPjsr/lDUjvckY3\nDIKCkYAYvXdJmObSmvSlv4ztLbUuTMWyMtGxXzJqakOt0xBGYQ4PsaVwEEzmv6O9\nuCRI4l79YyGC6J4GLX1ywRH9OZ4xHDVw9tlNQnjVWINILtCCbLfq3WTdZQKBgQCo\njFs6NkPiFNkVcimgSyDJpNEWZvgA6drO+iQhTtH3I2L+44KIKQOjSGjUvAgsrB+k\nGUSUD7NuUVcfXjMgv+nXKv2R7b2AQ2+u3QmVRHGdsqsK4J4i1EgYNq8y0gaURi7W\nYFfCNdyYVWdCaHvDmfyFmKUpuU6KX1oWNvqe0dhs9QKBgCNJaApvUzKaTM6cbt1Y\n2sHUI8DdJqM1X2wOlOQ0VbUbU7GVme5H53HElt3xcYpbs9dUklhM7GV5FNH2mnpv\nNwN5qABHvoc2xSPoGJJLQGndxEBLtk4GSVfEj7S3cF0JzRNBN7b4NVqZIfhllPKc\nQpgIKWvV2q3tKTi596E4ksyI\n-----END PRIVATE KEY-----\n",
  "client_email": "circleci-service-account@sable-242108.iam.gserviceaccount.com",
  "client_id": "101561000440386927235",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/circleci-service-account%40sable-242108.iam.gserviceaccount.com"
}'

export GEM_HOME=~/.gems
export PATH="$GEM_HOME/bin:$PATH"


export PROJECT_ID=sable-242108

export PATH
