# Android APK 构建备忘录

## 踩过的坑（不要再犯）

### 1. 不要手动创建 Android 项目文件
用 `npx cap add android` 一次性生成完整项目，不要删了重来。
如果中途失败，先修好配置文件再重跑，别手动补文件。

### 2. PowerShell 写文件会加 BOM
`Set-Content -Encoding utf8` 会在文件开头加一个不可见字符 `﻿`。
Gradle 不认识它，直接报错。
修复：用 `[System.IO.File]::WriteAllText(path, content, [System.Text.UTF8Encoding]::new($false))`

### 3. .gitignore 里的陷阱
Capacitor 自动生成的 `.gitignore` 会屏蔽：
```
capacitor-cordova-android-plugins
```
这个目录是 Gradle 编译必需的，必须从 `.gitignore` 中删掉这行。
提交后 GitHub Actions runner 才有这个目录。

### 4. 不要在 GitHub Actions 里混用 SDK 安装方式
Ubuntu 22.04 runner 预装了 Android SDK 在 `/usr/local/lib/android/sdk`。
用预装的就行，别再用 `setup-android` 第三方 action，版本可能不对应。

## 当前项目构建方式（已验证通过）

### 本地修改后推送自动构建
```powershell
git add -A
git commit -m "更新内容"
git push
```

GitHub Actions 会自动执行 `.github/workflows/build-apk.yml`
→ 构建 APK → 上传到 Artifacts → 下载安装

### APK 下载地址
构建完成后打开：
`https://github.com/jony123-dot/gaokao-planner-app/actions`
点最新绿色勾的 workflow → Artifacts → UniPlanner-APK

## 重新从头搭建的步骤（供其他项目参考）
```bash
# 1. 创建项目
npm init -y
npm install @capacitor/core @capacitor/android

# 2. 确保 www 目录存在
mkdir www
cp index.html manifest.json sw.js www/

# 3. 生成 Android 项目
npx cap add android

# 4. 关键：删掉 .gitignore 中的屏蔽行
#    删除: capacitor-cordova-android-plugins

# 5. 提交到 git
git add -A
git commit -m "init"
git push

# 6. 配置 GitHub Actions（参考 .github/workflows/build-apk.yml）
```
