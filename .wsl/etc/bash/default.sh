
export ENV_DIR=${WSL_HOME}/etc/bash
export ENV_USER=${ENV_DIR}/${USER:l}.sh
export ENV_DISTRO=${ENV_DIR}/${WSL_DISTRO_NAME:l}.sh
export ENV_DEFAULT=${ENV_DIR}/default.sh
export ENV_SHARED=${WSL_HOME}/etc/shared/bash
export CREDENTIALS_FILE=${WSL_HOME}/etc/credentials

export PRUNEPATHS="/tmp /var/spool /media /mnt ~/winhome"
export PATH=$PATH:~/.local/bin:${WSL_HOME}/sbin
export DISPLAY=$(ip route list default | awk '{ print $3":0.0" }')

source ${ENV_SHARED}/oh-my-bash.sh
source ${ENV_SHARED}/functions.sh

if [[ ! -e "$VSCODE_IPC_HOOK_CLI" ]]; then
    clear
    cd
fi

IDE=""
if [[ -e "$VSCODE_IPC_HOOK_CLI" ]]; then
    IDE="Visual Studio Code"
fi
if [[ "$TERMINAL_EMULATOR" =~ .*(JetBrains|JediTerm).* ]]; then
    IDE="JetBrains IDE"
fi

if [ -z "$IDE" ]; then
    clear
    cd
fi

export COLOR0="\e[0m"
export COLOR1="\e[33m"
export COLOR2="\e[93m"

_print "Setting dev Environment..."

next_level

_print "- Common settings..."
next_level
    _alias lstcp "ss -l -4 -t -n -p"
    _alias lsudp "ss -l -4 -u -n -p"
    
    _print "Loading Fast Node Manager..."
    next_level
    if [ ! -d $HOME/.fnm ]; then
        _print "Instalando FNM"
        curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
        _print "FNM Instalado"
    fi
    export PATH=$PATH:$HOME/.fnm
    eval "`$HOME/.fnm/fnm env`"
    eval "`fnm completions --shell bash`"
    _print "- `fnm --version`"
    _print "- Current Node: `fnm current`"
    prior_level
prior_level

_print "- Setting hostname..."
next_level
$WSL_HOME/sbin/wsl-hosts.sh $(($_LEVEL * 4))
prior_level

reload user
reload distro

prior_level

_set_color $COLOR2
figlet -f slant $WSL_DISTRO_NAME
_reset_color
_print "Environment ready."
if [ ! -z "$IDE" ]; then
    _print "Running from $IDE..."
fi
