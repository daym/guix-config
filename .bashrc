# Bash initialization for interactive non-login shells and
# for remote shells (info "(bash) Bash Startup Files").

# Export 'SHELL' to child processes.  Programs such as 'screen'
# honor it and otherwise use /bin/sh.
export SHELL

if [[ $- != *i* ]]
then
    # We are being invoked from a non-interactive shell.  If this
    # is an SSH session (as in "ssh host command"), source
    # /etc/profile so we get PATH and other essential variables.
    [[ -n "$SSH_CLIENT" ]] && source /etc/profile

    # Don't do anything else.
    return
fi

# Source the system-wide file.
source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    # \[\033[6 q\] is a vertical bar
    PS1='${?#0} \u@\h \w [env]\$ '
else
    PS1='${?#0} \u@\h \w\$ '
fi
alias ls='ls -p --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

export HISTSIZE=""

function current_command {
	local history_line="`history 1 | sed 's/^[ ]*[0-9]*[ ]*//g'`"
	echo "${history_line##*([[:space:])+([[:digit:]])+([[:space:]])}"
}

PS0='\[\e]0;$(current_command)\a\]'
PROMPT_COMMAND='PREV_COMMAND=""; export PREV_COMMAND'

# Moved to .bash_profile
#if [ -z "${GUIX_ENVIRONMENT}" ]
#then
#	# Tell npm where to store globally installed packages
#	# FIXME maybe later. npm config set prefix "${HOME}/.local/npm-packages"
#	#npm config set prefix "${HOME}/.local/node_modules"
#	#PATH="${HOME}/.local/node_modules/.bin:${PATH}"
#	PATH="${HOME}/.local/npm-packages/bin:${HOME}/src/docker-oreboot/docker-oreboot/toolchain/rust/bin:/var/lib/flatpak/exports/bin:${PATH}"
#	export PATH
#fi

shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Make ROCm work on Radeon RX 6650 XT maybe
#HSA_OVERRIDE_GFX_VERSION=10.3.0
#export HSA_OVERRIDE_GFX_VERSION

#function frg {
#    $result = rg --ignore-case --color=always --line-number --no-heading @Args |
#      fzf --ansi `
#          --color 'hl:-1:underline,hl+:-1:underline:reverse' `
#          --delimiter ':' `
#          --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" `
#          --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
#    if ($result) {
#      & ($env:EDITOR).Trim("`"'") $result.Split(': ')[0]
#    }
#}
gblame2 () {

    local file=$(fzf)

    cat "$file" | awk '{printf("%5d %s\n", NR, $0)}' | fzf --layout reverse --preview-window up --preview "echo {} | awk '{print \$1}' | xargs -I _ sh -c \"git log --color -L_,'+1:${file}'\""
}

nnano () {

    # Change the terminal foreground to #FFFFFF
    echo -ne "\033]10;#FFFFFF\007"

    # Change the terminal background to #000000
    echo -ne "\033]11;#000000\007"

    nano "$1"

    # Reset the colors
    echo -ne "\033]10;#000\007"
    echo -ne "\033]11;#FFF\007"

}

# Oxide
TARGET_HOSTSPEC=daym@atrium.eng.oxide.computer
export TARGET_HOSTSPEC

# Make venv mandatory for using pip
#export PIP_REQUIRE_VIRTUALENV=1
#export MOZ_ENABLE_WAYLAND=1
## For emacs-lsp-booster
#export LSP_USE_PLISTS=true
