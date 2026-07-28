@echo off
echo === 大学规划智能体 - Android APK 构建脚本 ===
echo.
echo 前置要求:
echo 1. 安装 Android Studio (https://developer.android.com/studio)
echo 2. 在 Android Studio 中安装 Android SDK (API 34)
echo 3. 配置 JAVA_HOME 环境变量 (JDK 17+)
echo.
echo 步骤:
echo 1. 用 Android Studio 打开本目录下的 android 文件夹
echo 2. 等待 Gradle 同步完成
echo 3. 菜单: Build - Generate Signed APK... 
echo    或直接点击 Run 运行到连接的手机
echo 4. 或者运行以下命令构建 APK:
echo.
echo    cd android
echo    .\gradlew assembleRelease
echo.
echo APK 文件生成位置:
echo    android\app\build\outputs\apk\release\app-release.apk
echo.
pause
