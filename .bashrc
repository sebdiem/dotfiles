#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------

export PS1='\n$(tput setaf 7)$(venv_prefix)$(tput setaf 172)\u$(tput setaf 7)@$(tput setaf 3)\h$(tput setaf 7): $(tput setaf 2)\w $(tput setaf 4)$(git branch 2>/dev/null | grep -e "\* " | sed "s/^..\(.*\)/ \(\1\)/" | sed "s/feature/F/") $(tput setaf 7)\n\$ '

# function used by the prompt
venv_prefix () {
    # This function assumes that the virtual env is located at the root of the project you are working on
    if [ -s "$VIRTUAL_ENV" ] ; then
        venv=`python -c "import os, sys; sys.stdout.write(os.environ['VIRTUAL_ENV'].split('/')[-2])"`
        echo "($venv) "
    else
        echo ""
    fi
}

# do not use the virtualenv modified prompt (we have our own)
export VIRTUAL_ENV_DISABLE_PROMPT="1"

#   Set PATH
#   ------------------------------------------------------------
export PATH=~/bin:/usr/local:/usr/local/bin:$PATH
PYTHONPATH="${PATH}"
export PYTHONPATH

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

export CLICOLOR=1                           # Enable colors with e.g. ls:
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias grep='grep --color=auto'              # grep with colors
alias egrep='egrep --color=auto'            # egrep with colors
alias fgrep='fgrep --color=auto'            # fgrep with colors
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
alias mktags='ctags -R --exclude=.git --exclude=*.js --exclude=*.sql --exclude=*.pxd'

# Make a virtualenv:
mkvirtualenv() {
    mkdir ~/Projects/$1
    cd ~/Projects/$1
    virtualenv venv
}

# used to go to project root and activate the right venv
workon () {
    cd ~/Projects/$1
    . venv/bin/activate
}


#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -iname "                 # qfind:    Quickly search for file
ffs () { /usr/bin/find . -iname "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -iname '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi


#   ---------------------------
#   7.  SYSTEM OPERATIONS & INFORMATION
#   ---------------------------
defaults write NSGlobalDomain KeyRepeat -int 0
