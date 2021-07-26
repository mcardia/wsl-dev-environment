
#Distro environment settings
next_level

export SDKMAN_DIR=/opt/sdkman
export ECLIPSE_HOME=/opt/eclipse
export IDEAIC_HOME=/opt/ideaIC
export TNS_ADMIN=/opt/oracle/wallet
export ORACLE_HOME=/opt/oracle/instantclient_21_1
export CATALINA_HOME=/home/dev/.sdkman/candidates/tomcat/current
export PATH=$PATH:$ORACLE_HOME
export SDKMAN_DIR="/opt/sdkman"

_aliasx eclipse "$ECLIPSE_HOME/eclipse"
_aliasx ideaIC "$IDEAIC_HOME/bin/idea.sh"
_aliasx sqldeveloper "/opt/oracle/sqldeveloper"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
_print "Loading SDKMAN!"
[[ -s "/opt/sdkman/bin/sdkman-init.sh" ]] && source "/opt/sdkman/bin/sdkman-init.sh"

prior_level
_print "$COLOR2- Current Java environment$COLOR0"
next_level
local JAVA_VERSION=$(java -version 2>&1 | head -n 3 | tail -n 1 | awk '{ print $1" "$2}')" "$(java -version 2>&1 | head -n 1 | sed s/[\"]//g | awk '{ print $3}')
local GRADLE_VERSION=$(gradle -version | head -n 3 | tail -n 1)
local MAVEN_VERSION=$(mvn -version | head -n 1 | awk '{ print $1" "$2" "$3 }')
_print "- $JAVA_VERSION"
_print "- $GRADLE_VERSION"
_print "- $MAVEN_VERSION"
_print ""
prior_level

#OMB
plugins+=(
  sdkman
)

completions+=(
  gradle
  maven
  sdkman
)