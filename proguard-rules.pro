name: Android CI

on:
  push:
    branches: ["main"]
  pull_request:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  build:
    name: Build debug APK
    runs-on: ubuntu-24.04
    timeout-minutes: 30

    steps:
      - name: Checkout source
        uses: actions/checkout@v4

      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: "17"
          distribution: "temurin"

      - name: Set up Gradle 8.11.1
        uses: gradle/actions/setup-gradle@v4
        with:
          gradle-version: "8.11.1"

      - name: Remove obsolete member files
        shell: bash
        run: |
          rm -f app/src/main/java/com/petlingo/app/data/MemberStore.kt
          rm -f app/src/main/java/com/petlingo/app/ui/screens/MemberScreen.kt

      - name: Verify source tree
        shell: bash
        run: |
          test -f settings.gradle.kts
          test -f build.gradle.kts
          test -f app/build.gradle.kts
          test -f app/src/main/AndroidManifest.xml

          if grep -R --line-number             --include='*.kt'             -E 'MemberAccount|MemberStore|MemberScreen'             app/src/main/java; then
            echo "Obsolete member code is still referenced."
            exit 1
          fi

      - name: Generate Gradle Wrapper
        shell: bash
        run: gradle wrapper --gradle-version 8.11.1 --distribution-type bin

      - name: Grant execute permission
        shell: bash
        run: chmod +x gradlew

      - name: Build debug APK
        shell: bash
        run: ./gradlew --no-daemon clean assembleDebug --stacktrace

      - name: Upload debug APK
        uses: actions/upload-artifact@v4
        with:
          name: PetLingo-v5.8.2-debug-apk
          path: app/build/outputs/apk/debug/app-debug.apk
          if-no-files-found: error
          retention-days: 14
