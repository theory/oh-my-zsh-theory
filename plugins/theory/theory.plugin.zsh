# In ~/.zshrc:
# ZSH_CUSTOM=$HOME/dev/misc/oh-my-zsh-theory

# Customize PATH.
brew=/opt/homebrew
[ ! -d "$brew" ] && [ -d /usr/local/Homebrew ] && brew=/usr/local

paths=(
    $HOME/go/bin
    $HOME/.pgenv/bin
    $HOME/.pgenv/pgsql/bin
    $HOME/bin
    $brew/opt/python/libexec/bin
    $brew/opt/ruby/bin
    $brew/bin
    $PATH
    /Developer/Tools
)

export PATH=$(IFS=:; printf '%s' "${paths[*]}")
export GPG_TTY=$(tty)
export EDITOR="emacs"
export PGTZ=UTC

# less stuff.
PAGER=less
LESS="-iqRIMSx4 -FX"

# Move git-path prompt to the left.
RPROMPT=""
git_prompt_info() { git_super_status }

# Restore down-casing to option-l:
bindkey "^[l" down-case-word

# Perl stuff
[ -f "$HOME/.plenv/bin/plenv" ] && eval "$($HOME/.plenv/bin/plenv init - zsh)"
function pmv () { perl -M$1 -le "print $1->VERSION"; }
function pmr () { perl -MModule::CoreList -le "print Module::CoreList->first_release(q{$1})"; }

# Rust stuff.
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Homebrew stuff
gettext_init() { export PATH=/usr/local/opt/gettext/bin:$PATH }
ssl_init()     { export PATH=/usr/local/opt/openssl/bin:$PATH }

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
