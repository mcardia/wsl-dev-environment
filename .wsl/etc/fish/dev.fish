
#User environment settings
next_level

alias sudo="sudo -E"
alias updatedb="sudo updatedb"
alias apt="sudo apt"
alias upgrade="apt -y update ;and apt -y upgrade ;and apt -y dist-upgrade ;and apt -y autoremove ;and apt -y clean"

_alias sqlcmd "docker exec -it $SQLSERVER_NAME /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SQLSERVER_PASS" "docker exec -it ... sqlcmd"
_alias sqlsh "docker exec -u 0 -it $SQLSERVER_NAME bash" "docker exec -it ... bash"
#_alias msdump "docker exec -u 0 -it $SQLSERVER_NAME /usr/local/bin/mssql-scripter -S localhost -U sa -P $SQLSERVER_PASS  --schema-and-data -d"

prior_level
