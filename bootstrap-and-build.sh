#!/usr/bin/env bash
set -euo pipefail

rm -f app/src/main/java/com/petlingo/app/data/MemberStore.kt
rm -f app/src/main/java/com/petlingo/app/ui/screens/MemberScreen.kt

if grep -R --line-number --include='*.kt'   -E 'MemberAccount|MemberStore|MemberScreen' app/src/main/java; then
  echo "仍有舊會員程式碼，請依上方路徑清除。"
  exit 1
fi

if [ ! -f gradle/wrapper/gradle-wrapper.jar ]; then
  if ! command -v gradle >/dev/null 2>&1; then
    echo "找不到 Gradle。請使用 Android Studio 開啟專案，或安裝 Gradle 8.11.1。"
    exit 1
  fi
  gradle wrapper --gradle-version 8.11.1 --distribution-type bin
fi

chmod +x gradlew
./gradlew --no-daemon clean assembleDebug --stacktrace
