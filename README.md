# PetLingo v5.8.2 Complete

這是成人版 PetLingo 的完整 Android Studio 原始碼專案。

## 功能

- TOEIC 單字庫與片語
- 英翻中、中翻英、收藏單字測驗
- 10／20／40 題模式
- 極簡題目格式
- 聽力測驗與英文重播
- 閱讀測驗
- 多益模擬題
- 口說練習與文字相似度評分
- 即時答對／答錯提示
- 正確答案與解析
- 每題作答時間
- 錯題本
- 歷次學習紀錄
- 答題分析
- 每日 20 題任務
- 收藏、成就與設定
- 本機資料保存
- 三隻寵物主視覺與桌面圖示
- 成人版 applicationId：`com.petlingo.learning`

會員登入已完整移除，本版沒有宣稱支援雲端同步。

## GitHub 上傳方式

不要把本專案直接覆蓋到仍含舊檔案的 Repository。建議先清空 Repository，再把本資料夾內的內容上傳到根目錄。

GitHub Actions 會：

1. 清除殘留的 `MemberStore.kt` 與 `MemberScreen.kt`
2. 檢查會員舊碼是否仍被引用
3. 使用 JDK 17 與 Gradle 8.11.1
4. 產生標準 Gradle Wrapper
5. 編譯 Debug APK
6. 上傳 APK 到 Actions Artifacts

## 本機建置

### Windows

```powershell
./bootstrap-and-build.ps1
```

### macOS／Linux

```bash
./bootstrap-and-build.sh
```

也可直接用 Android Studio 開啟專案根目錄。

## APK 位置

```text
app/build/outputs/apk/debug/app-debug.apk
```
