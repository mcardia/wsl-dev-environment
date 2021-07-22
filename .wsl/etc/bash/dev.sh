
#User environment settings
next_level

alias sudo="sudo -E"
alias updatedb="sudo updatedb"
alias apt="sudo apt"
alias upgrade="apt -y update && apt -y upgrade && apt -y dist-upgrade && apt -y autoremove && apt -y clean"

_alias sqlcmd "docker exec -it $SQLSERVER_NAME /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SQLSERVER_PASS" "docker $SQLSERVER_NAME:/opt/mssql-tools/bin/sqlcmd"
_alias sqlsh  "docker exec -u 0 -it $SQLSERVER_NAME bash" "docker $SQLSERVER_NAME:/bin/bash"
#_alias msdump "docker exec -u 0 -it $SQLSERVER_NAME /usr/local/bin/mssql-scripter -S localhost -U sa -P $SQLSERVER_PASS  --schema-and-data -d" "docker $SQLSERVER_NAME:/usr/local/bin/mssql-scripter"

prior_level