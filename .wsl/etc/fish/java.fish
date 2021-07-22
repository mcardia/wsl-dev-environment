#Distro environment settings
next_level

set -Ux SDKMAN_DIR /opt/sdkman
set -Ux ECLIPSE_HOME /opt/eclipse
set -Ux IDEAIC_HOME /opt/ideaIC
set -Ux TNS_ADMIN /opt/oracle/wallet
set -Ux ORACLE_HOME /opt/oracle/instantclient_21_1
set -Ux CATALINA_HOME /home/dev/.sdkman/candidates/tomcat/current
set -Ux SDKMAN_DIR /opt/sdkman 

set -Ux fish_user_paths $fish_user_paths $ORACLE_HOME

_aliasx eclipse "$ECLIPSE_HOME/eclipse"
_aliasx ideaIC "$IDEAIC_HOME/bin/idea.sh"
_aliasx sqldeveloper "/opt/oracle/sqldeveloper"

prior_level
_print "$COLOR2- Current Java environment$COLOR0"
next_level
set JAVA_VERSION (java -version 2>&1 | head -n 3 | tail -n 1 | awk '{ print $1" "$2}')" "(java -version 2>&1 | head -n 1 | sed s/[\"]//g | awk '{ print $3}')
set GRADLE_VERSION (gradle -version | head -n 3 | tail -n 1)
set MAVEN_VERSION (mvn -version | head -n 1 | awk '{ print $1" "$2" "$3 }')
_print "- $JAVA_VERSION"
_print "- $GRADLE_VERSION"
_print "- $MAVEN_VERSION"
_print ""
prior_level


