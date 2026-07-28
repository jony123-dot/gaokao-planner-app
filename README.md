# 大学规划智能体

帮助高中生发现目标大学和专业，生成个性化备考路线图。

## 在线体验

将本项目部署到 GitHub Pages 或任意静态服务器即可使用。

### 快速部署到 GitHub Pages

1. 在 GitHub 创建新仓库
2. 上传本目录所有文件
3. 仓库 Settings → Pages → Source 选 "Deploy from branch" → main → / (root)
4. 等待 2 分钟，访问 `https://你的用户名.github.io/仓库名`

## 构建 Android APK

### 方式一：GitHub Actions（推荐，无需本地安装）

推送代码到 GitHub 后，Actions 会自动构建 APK：

1. 创建 GitHub 仓库并推送代码
2. 进入仓库 Actions 页面，点击 "Build Android APK" 工作流
3. 点击 "Run workflow" → 等待几分钟
4. 构建完成后在 workflow 页面下载 APK 文件（UniPlanner-APK）

### 方式二：本地 Android Studio

1. 安装 Android Studio
2. 打开 `android` 文件夹
3. 等待 Gradle 同步完成
4. 菜单 Build → Build APK

## 技术说明

- 纯前端应用（HTML/CSS/JS），无后端依赖
- PWA 支持：可添加到手机主屏幕
- 内置 22 所 985 大学数据（含江西录取分数线参考）
- 专业匹配算法（兴趣 + 优势学科 + 选考科目）
- 五阶段目标分解路线图

## 项目结构

```
├── index.html          # 主应用
├── manifest.json       # PWA 配置
├── sw.js               # Service Worker（离线支持）
├── icons/              # 应用图标
├── capacitor.config.json  # Capacitor 配置
├── package.json        # Node.js 依赖
├── android/            # Android 原生项目（Capacitor）
└── .github/workflows/  # GitHub Actions 自动构建
```
