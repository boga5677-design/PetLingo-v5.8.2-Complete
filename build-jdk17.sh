#!/usr/bin/env bash
set -euo pipefail

JAVA_VERSION=$(java -XshowSettings:properties -version 2>&1 |
  awk '/java.specification.version/ {print $3}')

if [ "$JAVA_VERSION" != "17" ]; then
  echo "目前 Java 版本是 $JAVA_VERSION，請切換到 JDK 17。"
  exit 1
fi

if [ ! -f gradle/wrapper/gradle-wrapper.jar ]; then
  if ! command -v gradle >/dev/null 2>&1; then
    echo "找不到 Gradle。請使用 Android Studio 或安裝 Gradle 8.11.1。"
    exit 1
  fi
  gradle wrapper --gradle-version 8.11.1 --distribution-type bin
fi

chmod +x gradlew
./gradlew --no-daemon clean assembleDebug --stacktrace
