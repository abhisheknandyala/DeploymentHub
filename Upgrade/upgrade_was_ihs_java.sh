#!/bin/bash

# Parameters passed in
WAS_USER=$1
WAS_PASSWORD=$2
WAS_FEATURE_ID=$3
WAS_REPO_PATH=$4
WAS_INSTALL_DIR=$5

IHS_FEATURE_ID=$6
IHS_REPO_PATH=$7
IHS_INSTALL_DIR=$8

JAVA_FEATURE_ID=$9
JAVA_REPO_PATH=${10}
JAVA_INSTALL_DIR=${11}

# Export memory limit if needed
export JAVA_OPTS="-Xmx512m"

# Stop WAS and IHS
$WAS_INSTALL_DIR/profiles/AppSrv01_eMMIS/bin/stopServer.sh server1 -user "$WAS_USER" -password "$WAS_PASSWORD" || echo "WAS may already be stopped"
$IHS_INSTALL_DIR/bin/apachectl stop || echo "IHS may already be stopped"

# Upgrade WAS
/opt/IBM/InstallationManager/eclipse/tools/imcl install $WAS_FEATURE_ID \
  -repositories $WAS_REPO_PATH \
  -installationDirectory $WAS_INSTALL_DIR \
  -acceptLicense -log /tmp/was_upgrade.log

# Upgrade IHS
/opt/IBM/InstallationManager/eclipse/tools/imcl install $IHS_FEATURE_ID \
  -repositories $IHS_REPO_PATH \
  -installationDirectory $IHS_INSTALL_DIR \
  -acceptLicense -log /tmp/ihs_upgrade.log

# Upgrade Java
/opt/IBM/InstallationManager/eclipse/tools/imcl install $JAVA_FEATURE_ID \
  -repositories $JAVA_REPO_PATH \
  -installationDirectory $JAVA_INSTALL_DIR \
  -acceptLicense -log /tmp/java_upgrade.log
