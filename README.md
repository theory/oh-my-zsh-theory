Theory’s Oh My ZSH Customization
================================

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/dev/misc
cd ~/dev/misc
git clone git@github.com:theory/oh-my-zsh-theory.git
perl -pi -E "s{(?:\#\s*)?(ZSH_CUSTOM)=.*$}{\$1=\\\$HOME/dev/misc/oh-my-zsh-theory}" ~/.zshrc
perl -pi -E 's/plugins=.*/plugins=(git git-prompt theory golang)/' ~/.zshrc
```
