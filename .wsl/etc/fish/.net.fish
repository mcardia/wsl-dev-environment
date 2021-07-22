#Distro environment settings
set -Ux DOTNET_CLI_TELEMETRY_OPTOUT 1

_print "$COLOR2- Avaiable .Net SDKs$COLOR0"
next_level
    for i in (dotnet --list-sdks)
        _print "- $i"
    end
prior_level
_print "$COLOR2- Avaiable .Net Runtimes$COLOR0"
next_level
    for i in (dotnet --list-runtimes)
        _print "- $i"
    end
prior_level
_print "$COLOR2- donet version$COLOR0"
next_level
    _print "- "(dotnet --version 2>&1)
prior_level