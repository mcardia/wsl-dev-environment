
function _print
    set TEXT $argv[1]
    if [ "$TEXT" = "-n" ]
        set TEXT $argv[2]
    end
    if not set -q _LEVEL
        set _LEVEL 0
    end
    set PAD (math $_LEVEL\*4)
    printf '%b%b' (string repeat -n $PAD " ") $TEXT
    if [ "$argv[1]" != "-n" ]
        printf '\\n'
    end    
end

function _set_color
    _print -n $argv[1]
end

function _reset_color
    _print -n $COLOR0
end

function _level
    if not set -q _LEVEL
        set _LEVEL 0
    end
    set _LEVEL (math 1\*$argv[1]+$_LEVEL)
    if test "$_LEVEL" -lt 0
        set _LEVEL 0
    end
    set -gx _LEVEL $_LEVEL
end

function next_level
    _level 1
end

function prior_level
    _level -1
end

function _source
    if test -f $argv[1]
        source $argv[1]
    end
end

function _alias
    set DESC $argv[2]
    if not test -z "$argv[3]"
        set DESC $argv[3]
    end
    _print "Setting alias for $COLOR2$argv[1]$COLOR0 => $COLOR1$DESC$COLOR0..."
    alias $argv[1]="$argv[2]"
end

function _aliasx
    set DIR (dirname $argv[2])
    set EXE (basename $argv[2])
    rm -f /tmp/$EXE.log
    _alias $argv[1] "cd $DIR ;and screen -d -m -S $EXE $argv[2]" $argv[2]
end

function reload
    switch $argv[1]
        case user
            _print "- Settings for user $COLOR1$USER$COLOR0..."
            _source $ENV_USER
        case distro
            _print "- Settings for distro $COLOR1$WSL_DISTRO_NAME$COLOR0..."
            _source $ENV_DISTRO
        case '*'
            _print "- Settings..."
            _source $ENV_DIR/fish/default.fish
    end
end
