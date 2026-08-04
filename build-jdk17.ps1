$ErrorActionPreference = "Stop"

$versionOutput = & java -XshowSettings:properties -version 2>&1
$versionLine = $versionOutput | Select-String "java.specification.version"
$javaVersion = ($versionLine.ToString() -split "=")[1].Trim()

if ($javaVersion -ne "17") {
    throw "目前 Java 版本是 $javaVersion，請切換到 JDK 17。"
}

if (-not (Test-Path "gradle/wrapper/gradle-wrapper.jar")) {
    $gradle = Get-Command gradle -ErrorAction SilentlyContinue
    if (-not $gradle) {
        throw "找不到 Gradle。請使用 Android Studio 或安裝 Gradle 8.11.1。"
    }
    gradle wrapper --gradle-version 8.11.1 --distribution-type bin
}

.\gradlew.bat --no-daemon clean assembleDebug --stacktrace
