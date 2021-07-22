
set -Ux ENV_DIR $WSL_HOME/etc/fish
set -Ux ENV_USER $ENV_DIR/(string lower $USER).fish
set -Ux ENV_DISTRO $ENV_DIR/(string lower $WSL_DISTRO_NAME).fish
set -Ux ENV_DEFAULT $ENV_DIR/default.sh
set -Ux ENV_SHARED $WSL_HOME/etc/shared/fish
set -Ux CREDENTIALS_FILE $WSL_HOME/etc/credentials

set -Ux PRUNEPATHS "/tmp /var/spool /media /mnt ~/winhome"
set -Ux DISPLAY (ip route list default | awk '{ print $3":0.0" }')

set -Ux fish_user_paths $fish_user_paths ~/.local/bin $WSL_HOME/sbin

source $WSL_HOME/etc/shared/fish/functions.fish

set IDE ""
if test -e "$VSCODE_IPC_HOOK_CLI"
    set IDE "Visual Studio Code"
end
if string match -r -q -i ".*(JetBrains|JediTerm).*" "$TERMINAL_EMULATOR"
    set IDE "JetBrains IDE"
end

if test -z "$IDE"
    clear
    cd
end

set -Ux COLOR0 "\033[0m\e0"
set -Ux COLOR1 "\033[0;33m"
set -Ux COLOR2 "\033[1;33m"

_print "Setting $WSL_DISTRO_NAME Environment..."

next_level

_print "- Common settings..."
next_level
    _alias lstcp "ss -l -4 -t -n -p"
    _alias lsudp "ss -l -4 -u -n -p"
    _print "Loading Fast Node Manager..."
    next_level
        if ! test -d $HOME/.fnm
            next_level
                _print "Instalando FNM"
                curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
                _print "FNM Instalado"
            prior_level
        end
        set -Ux fish_user_paths $fish_user_paths $HOME/.fnm
        fnm env | source 
        if ! test -f $HOME/.config/fish/completions/fnm.fish
            fnm completions --shell (basename $SHELL) > $HOME/.config/fish/completions/fnm.fish
            source $HOME/.config/fish/completions/fnm.fish
        end
        _print "- "(fnm --version)
        _print "- Current node: "(fnm current)
    prior_level
prior_level

_print "- Setting hostname..."
next_level
$WSL_HOME/sbin/wsl-hosts.sh (math $_LEVEL\*4)
prior_level

reload user
reload distro

prior_level

_set_color $COLOR2
figlet -f slant $WSL_DISTRO_NAME
_reset_color
_print "Environment ready."
if ! test -z "$IDE"
    _print "Running from $IDE..."
end
