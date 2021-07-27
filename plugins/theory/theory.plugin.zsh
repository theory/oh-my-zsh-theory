# In ~/.zshrc:
# ZSH_CUSTOM=$HOME/dev/misc/oh-my-zsh-theory

export PATH=$HOME/.plenv/shims:$HOME/.plenv/bin:$HOME/.cargo/bin:$HOME/.pgenv/bin:$HOME/.pgenv/pgsql/bin:$HOME/bin:/usr/local/opt/python/libexec/bin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Developer/Tools:/Applications/Emacs.app/Contents/MacOS

# Move git-path prompt to the left.
RPROMPT=""
git_prompt_info() { git_super_status }

# Restore down-casing to option-l:
bindkey "^[l" down-case-word

# Perl stuff
eval "$(plenv init - zsh)"
function pmv () { perl -M$1 -le "print $1->VERSION"; }
function pmr () { perl -MModule::CoreList -le "print Module::CoreList->first_release(q{$1})"; }

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
