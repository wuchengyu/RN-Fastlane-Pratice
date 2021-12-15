#!/bin/sh

#  prebuild.sh
#  RNFastlanePratice
#
#  Created by Jamie on 2021/12/15.
#  

set -x
exec > "${PROJECT_DIR}/prebuild.log" 2>&1

echo "Using config ${CONFIGURATION}"

# 複製設定檔
echo ".env.${CONFIGURATION}" > /tmp/envfile

# 將環境變數丟出來
source "$PROJECT_DIR/../.env"
source "$PROJECT_DIR/../.env.${CONFIGURATION}"

REACT_NATIVE_CONFIG_PATH="${SRCROOT}/../node_modules/react-native-config/ios/ReactNativeConfig"
$REACT_NATIVE_CONFIG_PATH/BuildXCConfig.rb "${SRCROOT}/.." "${SRCROOT}/tmp.xcconfig"

HOST_PATH="$SRCROOT/.."
$REACT_NATIVE_CONFIG_PATH/BuildDotenvConfig.rb "$HOST_PATH" $REACT_NATIVE_CONFIG_PATH
