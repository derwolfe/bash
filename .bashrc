# on osx, this requires
# brew, git already have to be installed
# 1. brew install bash-completions


# source external scripts
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion/git-completion.bash ]; then
. $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion/git-prompt.bash ]; then
. $(brew --prefix)/etc/bash_completion.d/git-prompt.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion/lein-completion.bash ]; then
. $(brew --prefix)/etc/bash_completion.d/lein-completion.bash
fi

# functions
em (){
	emacsclient -n $1
}

bup (){
	brew update && brew doctor && brew upgrade --all
}

# prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\u@\h \w$(__git_ps1 " (%s)") -> '

# path
export PYENV_ROOT="$HOME/.pyenv"

export HOMEBREW="/usr/local/bin:/usr/local/sbin"

export GOPATH="/users/chris/Code/gowork/"
export GOBIN="/users/chris/Code/gowork/bin"

export PATH="$PYENV_ROOT/bin:$HOMEBREW:$GOBIN:$GOPATH$PATH"

# put the pyenv invocations as near the bottom of the script as possible
eval "$(pyenv init -)"
