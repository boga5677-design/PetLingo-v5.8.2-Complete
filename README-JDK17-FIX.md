# JDK 17 修正版

本專案固定使用：

- JDK 17
- Gradle 8.11.1
- Android Gradle Plugin 8.7.3
- Kotlin 2.0.21

## GitHub 上傳前

請先刪除 Repository 中 `.github/workflows/` 內的所有舊工作流程，再上傳本專案的：

```text
.github/workflows/android.yml
```

若舊工作流程仍存在並執行 `./gradlew build`，且設定 Java 11 或 Gradle 9.6.1，仍會重現錯誤。

## Windows 本機建置

```powershell
./build-jdk17.ps1
```

## macOS / Linux 本機建置

```bash
./build-jdk17.sh
```
