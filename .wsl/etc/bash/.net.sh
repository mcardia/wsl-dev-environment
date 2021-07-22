#Distro environment settings
export DOTNET_CLI_TELEMETRY_OPTOUT=1
IFS_=$IFS
IFS=$'\n'
_print "$COLOR2- Avaiable .Net SDKs$COLOR0"
next_level
    for i in `dotnet --list-sdks`; do
        _print "- $i"
    done
prior_level
_print "$COLOR2- Avaiable .Net Runtimes$COLOR0"
next_level
    for i in `dotnet --list-runtimes`; do
        _print "- $i"
    done
prior_level
_print "$COLOR2- donet version$COLOR0"
next_level
    _print "- "`dotnet --version 2>&1`
prior_level
IFS=$IFS_