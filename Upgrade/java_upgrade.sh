#!/bin/bash

# Parameters ===

JAVA_FEATURE_ID="{feautre_id}"
JAVA_REPO_PATH="{repo_path}"
JAVA_INSTALL_DIR=""{install_dir}
IMCL_PATH="{imcl_path}"

echo "Starting upgrade process..."

# === Stop WAS ===
echo "Stopping WAS..."
${WAS_INSTALL_DIR}/profiles/AppSrv01_eMMIS/bin/stopServer.sh server1 -user "$WAS_USER" -password "$WAS_PASSWORD" || echo "WAS may already be stopped"

echo "Listing Java Fix Packs..."
/opt/IBM/InstallationManager/eclipse/tools/imcl listAvailablePackages -repositories "$JAVA_REPO_PATH"


# === Upgrade Java ===
echo "Upgrading Java..."
/opt/IBM/InstallationManager/eclipse/tools/imcl install "$JAVA_FEATURE_ID" \
  -repositories "$JAVA_REPO_PATH" \
  -installationDirectory "$JAVA_INSTALL_DIR" \
  -acceptLicense \
  
