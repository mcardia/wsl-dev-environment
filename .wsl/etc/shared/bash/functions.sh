
_print() {
    local TEXT=$1
    if [ "$TEXT" = "-n" ]; then
        TEXT=$2
    fi
    if [[ -z $_LEVEL ]]; then
        _LEVEL=0
    fi
    local PAD=$(($_LEVEL * 4))
    printf "%-${PAD}s${TEXT}"
    if [ "$1" != "-n" ]; then
        printf "\n"
    fi
}

_set_color() {
    _print -n $1
}
_reset_color() {
    _print -n $COLOR0
}

_level() {
    if [[ -z $_LEVEL ]]; then
        _LEVEL=0
    fi
    _LEVEL=$(($_LEVEL + $((1 * $1))))
    [ $_LEVEL -lt 0 ] && _LEVEL=0
    export _LEVEL
}

next_level() {
    _level 1
}

prior_level() {
    _level -1
}

_source() {
    [ -f $1 ] && . $1
}

_alias() {
    local DESC=$2
    if [ ! -z "$3" ]; then
        DESC=$3
    fi
    _print "Setting alias for ${COLOR2}$1${COLOR0} => ${COLOR1}${DESC}${COLOR0}..."
    alias $1="$2"
}

_aliasx() {
    local DIR=$(dirname $2)
    local EXE=$(basename $2)
    _alias $1 "cd $DIR && screen -d -m -S $EXE $2" $2
}

reload() {
    case $1 in
        user)
            _print "- Settings for user ${COLOR1}${USER}${COLOR0}..."
            _source $ENV_USER
            ;;
        distro)
            _print "- Settings for distro ${COLOR1}${WSL_DISTRO_NAME}${COLOR0}..."
            _source $ENV_DISTRO
            ;;
        *)
            _print "- Settings..."
            _source $ENV_DEFAULT
            ;;
    esac
}
