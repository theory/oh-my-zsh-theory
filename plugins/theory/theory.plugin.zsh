# shellcheck disable=SC2148
# In ~/.zshrc:
# ZSH_CUSTOM=$HOME/dev/misc/oh-my-zsh-theory

# Customize PATH.
brew=/opt/homebrew
[ ! -d "$brew" ] && [ -d /usr/local/Homebrew ] && brew=/usr/local

path=(
    "$HOME/.plenv/bin"
    "$HOME/go/bin"
    "$HOME/.pgenv/bin"
    "$HOME/.pgenv/pgsql/bin"
    "$HOME/bin"
    "$HOME/.local/bin" # tembo
    "$HOME/.krew/bin"
    "$HOME/.goenv/shims"
    "$HOME/.pyenv/shims"
    "$brew/opt/python/libexec/bin"
    "$brew/opt/ruby/bin"
    "$brew/bin"
    "$brew/sbin"
    "$brew/opt/sqlite/bin"
    "$brew/opt/llvm/bin"
    "$brew/opt/curl/bin"
    "$("$brew/bin/brew" --prefix libpq)/bin"        # must come after pgenv and $brew/bin
    "$("$brew/bin/brew" --prefix mysql-client)/bin" # must come after $brew/bin
    "${path[@]}"
    /Developer/Tools
)

GPG_TTY=$(tty)
export PATH GPG_TTY
export EDITOR="code -w"
export PGTZ=UTC

# Don't share history across sessions (keep up arrow current session only).
# https://superuser.com/a/1017151
unsetopt share_history

# Start the starship prompt.
eval "$(starship init zsh)"

# Start direnv.
eval "$(direnv hook zsh)"

# Start atuin.
eval "$(atuin init zsh --disable-up-arrow)"

# less stuff.
export PAGER=less
export LESS="-iqRIMSx4 -FX"

# Move git-path prompt to the left. (disabled in favor of starship)
# RPROMPT=""
# git_prompt_info() { git_super_status }

# Restore down-casing to option-l:
bindkey "^[l" down-case-word

# Perl stuff
[ -f "$HOME/.plenv/bin/plenv" ] && eval "$($HOME/.plenv/bin/plenv init - zsh)"
function pmv () { perl -M$1 -le "print $1->VERSION"; }
function pmr () { perl -MModule::CoreList -le "print Module::CoreList->first_release(q{$1})"; }

# Ruby stuff.
[ -d "$HOME/.rbenv" ] && eval "$(rbenv init - --no-rehash zsh)"

function cpanm () {
    # Point MakeMaker and Module:Build and Homewbrew include.
    env PERL_MM_OPT="INC=-I$brew/include" PERL_MB_OPT="--include_dirs=$brew/include" command cpanm "$@"
}

# Rust stuff.
# shellcheck source=/dev/null
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Homebrew stuff
gettext_init() {
    export PATH=$brew/opt/gettext/bin:$PATH
}
# ssl_init() {
#     v=$1 # @1.1, @3, or empty for latest
#     export PATH=$brew/opt/openssl$v/bin:$PATH
#     export OPENSSL_PREFIX=$brew/opt/openssl$v
#     export LDFLAGS=-L$brew/opt/openssl$v/lib
#     export CPPFLAGS=-I$brew/opt/openss$v/include
# }

# Xcode stuff
xcode-reinstall() {
    sudo rm -rf "$(xcode-select -p)"
    xcode-select --install
}

# Go stuff.
export GOENV_ROOT="$HOME/.goenv"
eval "$(goenv init -)"

# env GVM_NO_UPDATE_PROFILE=1 zsh < <(curl -s -S -L
# https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer) 
# shellcheck source=/dev/null
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Node stuff
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Handy aliases
alias ts="date -u '+%Y-%m-%dT%H:%M:%SZ'"
alias timestamp="ts | tr -d '\n' | pbcopy"
alias rd="rmdir"
alias md="mkdir"
alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias ip="ifconfig | grep inet | grep netmask"
alias k=kubectl
alias damd="docker buildx build --platform=linux/amd64"
alias cdr='cd $(git rev-parse --show-toplevel)'
