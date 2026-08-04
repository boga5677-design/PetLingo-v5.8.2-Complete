$ErrorActionPreference = "Stop"

Remove-Item "app/src/main/java/com/petlingo/app/data/MemberStore.kt" -Force -ErrorAction SilentlyContinue
Remove-Item "app/src/main/java/com/petlingo/app/ui/screens/MemberScreen.kt" -Force -ErrorAction SilentlyContinue

$matches = Get-ChildItem "app/src/main/java" -Recurse -Filter *.kt |
    Select-String -Pattern "MemberAccount|MemberStore|MemberScreen"

if ($matches) {
    $matches | Format-Table
    throw "仍有舊會員程式碼，請依上方路徑移除。"
}

.\gradlew.bat assembleDebug --stacktrace
