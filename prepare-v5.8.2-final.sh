#!/usr/bin/env bash
set -euo pipefail

rm -f app/src/main/java/com/petlingo/app/data/MemberStore.kt
rm -f app/src/main/java/com/petlingo/app/ui/screens/MemberScreen.kt

if grep -R --line-number -E "MemberAccount|MemberStore|MemberScreen" app/src/main/java; then
  echo "仍有舊會員程式碼，請依上方路徑移除。"
  exit 1
fi

chmod +x gradlew
./gradlew assembleDebug --stacktrace
