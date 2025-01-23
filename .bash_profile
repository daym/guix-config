# Honor per-interactive-shell startup file
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#set > /tmp/goo-`/run/current-system/profile/bin/id  -u`-"`date`"

# Not sure where else I would set that in time!
#export WAYLAND_DISPLAY=wayland-1

trap 'echo -ne "\033]2;$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g") | ${USER}@${HOSTNAME}\007"' DEBUG
alias ls='ls -p --color'
alias ll='ls -l'
nd() {
        if [ -d "$1" ]
        then
                echo "warning: directory \"$1\" existed already.">&2
        fi
        mkdir -p "$1" && cd "$1"
}
export -f nd
export LIBVIRT_DEFAULT_URI=qemu:///system
export HISTSIZE=""
export PYTHONIOENCODING=utf-8
#export QT_PLUGIN_PATH="${HOME}/.guix-home/profile/lib/qt5/plugins"
if [ "${TERM}" = "dumb" ]
then
    export PAGER="cat"
else
    export PAGER="less -F"
fi

# weird features above not needed!

# Exec=/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=/app/bin/element --file-forwarding im.riot.Riot --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapture @@u %U @@

#--ignore-certificate-errors
export PATH="${HOME}/.local/bin:${PATH}"
# Tell npm where to store globally installed packages
# FIXME maybe later. npm config set prefix "${HOME}/.local/npm-packages"
#npm config set prefix "${HOME}/.local/node_modules"
#PATH="${HOME}/.local/node_modules/.bin:${PATH}"
export PATH="${HOME}/.local/npm-packages/bin:${HOME}/src/docker-oreboot/docker-oreboot/toolchain/rust/bin:/var/lib/flatpak/exports/bin:${PATH}"

export TERMINAL=foot
export GTK_CSD=0 # useless?
#	https://manpages.ubuntu.com/manpages/bionic/man1/gtk3-nocsd.1.html
#export EDITOR="nano -w"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

#export WII=192.168.10.248

XDG_DATA_DIRS="${HOME}/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_DATA_DIRS

if [ -z "${GIT_EXEC_PATH}" ]
then
	GIT_EXEC_PATH="${GUIX_ENVIRONMENT}/libexec/git-core"
	export GIT_EXEC_PATH
fi
if [ -z "${R_LIBS_SITE}" ]
then
	R_LIBS_SITE="${GUIX_ENVIRONMENT}/site-library"
	export R_LIBS_SITE
fi

if [ "${XDG_SESSION_TYPE}" = "wayland" ]
then
	# export _JAVA_AWT_WM_NONREPARENTING=1
	export QT_QPA_PLATFORM=wayland
	export GDK_BACKEND=wayland # possible: wayland,x11
	export XDG_CURRENT_DESKTOP=sway
	#export WAYLAND_DISPLAY=wayland-1
	#XDG_SESSION_TYPE=wayland
	export MOZ_ENABLE_WAYLAND=1
	export ELECTRON_OZONE_PLATFORM_HINT=auto
	# or --load-extension etc
	# TODO --ozone-hint=auto
	export CHROMIUM_FLAGS="--enable-remote-extensions --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapture --ozone-platform-hint=auto --allow-file-access-from-files"
	# The actual ssh-agent is started by shepherd and/or autostart (see guix home)
fi
export SSH_AUTH_SOCK=/run/user/`id -u`/ssh-agent/socket

# Give me a break.
export GPG_TTY=$(tty)

# Make venv mandatory for using pip
export PIP_REQUIRE_VIRTUALENV=1
# For emacs-lsp-booster
export LSP_USE_PLISTS=true
