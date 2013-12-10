#!/bin/sh
cd $(dirname $0)

if [ ! -d "$ANDROID_HOME" ]; then
  echo "ANDROID_HOME is not available"
  exit
fi

cd ../complete
./gradlew clean assembleDefaultFlavorDebug
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf Rest/build

cd ../initial
./gradlew clean assembleDefaultFlavorDebug
ret=$?
if [ $ret -ne 0 ]; then
  exit $ret
fi
rm -rf Rest/build

exit $ret
