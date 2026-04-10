# viyoriya
# add export ZDOTDIR="$HOME/.config/zsh" to /etc/zsh/zshenv else .zprofile wont work

#export TZ='Europe/London'

export GPG_TTY=$(tty)
#export GPG_TTY=$TTY

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/.password-store
export PASSWORD_STORE_CLIP_TIME=15
export PASSWORD_STORE_X_SELECTION="clipboard"

export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE="$XDG_CONFIG_HOME"/zsh/.zsh_history
export ZSH_CACHE_DIR="$XDG_CACHE_HOME"/zsh

#============================= for TTY ================================
export PS1="%F{blue}%~%B%F{red} >>%F{reset}%b "
#======================================================================
export ZPS1="%F{blue}%~%B%F{red} >>%F{reset}%b "

export EDITOR=hx
export VISUAL=hx

export GREP_COLOR="mt=1;32"

export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"

export QT_FONT_DPI=96
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

export CM_HISTLENGTH=50
export CM_DIR="$XDG_CONFIG_HOME"/clipmenu/

export BAT_THEME="OneHalfDark"

#export FZF_CTRL_T_COMMAND='nvim "${FZF_DEFAULT_COMMAND}"'
#export FZF_DEFAULT_OPTS='-i -e --multi --cycle --height=40% --layout=reverse --border=sharp --inline-info --ansi'

export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS='-i -e --multi --cycle --height=40% --layout=reverse --border=sharp --inline-info --ansi --color=hl:#00ff00,hl+:#00ff00,pointer:#ffffff,info:#00ff00,marker:#00ff00,header:#00ff00,bg+:6,fg+:15'

export YAZI_CONFIG_HOME="$XDG_CONFIG_HOME"/yazi

export FFF_HIDDEN=0
export FFF_FAV1=~/
export FFF_FILE_FORMAT=" %f"
export FFF_STAT_CMD="ls" #"stat"
#export FFF_KEY_ATTRIBUTES="x"

#======================================================================
#==================    Tech    ========================================
#======================================================================

export JAVA_HOME=/usr/lib/jvm/default
export M2_HOME=/opt/apache-maven-3.9.10
export KAFKA_HOME=/opt/kafka_2.13-4.0.0
export SPARK_HOME=/opt/spark-4.0.0-bin-hadoop3
export GO_HOME=/usr/lib/go
export RUSTUP_HOME="$XDG_CONFIG_HOME"/rust/.rustup
export CARGO_HOME="$XDG_CONFIG_HOME"/rust/.cargo
export LM_STUDIO_HOME="$XDG_CONFIG_HOME"/.lmstudio

# === npm ==================================
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/.npmrc
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm

# === go  ==============================
export GOPATH="$XDG_CONFIG_HOME"/go
export GOTELEMETRY=off

export LOCAL_BIN_PATH=~/.local

export PATH=$PATH:$LOCAL_BIN_PATH/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$KAFKA_HOME/bin
export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$SPARK_HOME/sbin
export PATH=$PATH:$GO_HOME/bin
export PATH=$PATH:$CARGO_HOME/bin
export PATH=$PATH:$XDG_DATA_HOME/npm/bin
export PATH=$PATH:$LM_STUDIO_HOME/bin

#export PATH="$(npm config get prefix)/bin:$PATH"
