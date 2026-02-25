# 🚀 AIRI 本地運行指南

本文件說明如何在你的電腦上完整運行 AIRI 專案。

---

## ✅ 系統需求

| 工具 | 版本需求 |
|------|---------|
| **Node.js** | 23 或以上（建議 24+） |
| **pnpm** | 10.28.1（由 corepack 管理） |
| **Git** | 任意版本 |

> Windows 用戶還需要 Visual Studio Build Tools（含 C++ 工具組與 Windows SDK）

---

## 📦 第一次安裝步驟

### 1. 安裝 Node.js 23+

- **Windows / macOS**: 前往 https://nodejs.org/en/download/ 下載安裝
- **macOS（Homebrew）**: `brew install node`
- **Linux（NodeSource）**: 參考 https://github.com/nodesource/distributions

### 2. 安裝 pnpm（透過 corepack）

```bash
# 啟用 corepack（Node.js 內建）
corepack enable

# 安裝並啟用指定版本的 pnpm
corepack prepare pnpm@10.28.1 --activate

# 確認安裝成功
pnpm --version
# 應輸出: 10.28.1
```

### 3. Clone 專案

```bash
git clone https://github.com/kgyhm121-web/airi.git
cd airi
```

### 4. 安裝所有依賴套件

```bash
pnpm install
```

> ⚠️ 首次安裝會下載大量套件，需要幾分鐘，請耐心等待。

### 5. 建置內部套件（packages）

```bash
pnpm run build:packages
```

---

## 🌐 啟動 Web 版本（Stage Web）

這是可以在**瀏覽器**中直接使用的版本，**不需要任何額外安裝**，最簡單快速。

```bash
pnpm dev
```

啟動後開啟瀏覽器，前往：
```
http://localhost:5173
```

---

## 🖥️ 啟動桌面版本（Stage Tamagotchi / Electron）

桌面版為 Electron App，需要額外依賴。

```bash
pnpm dev:tamagotchi
```

> Windows 用戶需確認已安裝 Visual Studio Build Tools。

---

## 🔑 設定 LLM API

AIRI 啟動後，需在設定頁面填入 LLM API 金鑰才能使用 AI 功能。

支援多種 LLM 服務（選一個即可）：

| 服務 | 說明 |
|------|------|
| **OpenAI** | 需要 API Key，前往 https://platform.openai.com |
| **Anthropic Claude** | 需要 API Key，前往 https://anthropic.com |
| **Ollama** | 完全免費本地運行，前往 https://ollama.com |
| **DeepSeek** | 低成本 API，前往 https://deepseek.com |
| **Google Gemini** | 有免費方案，前往 https://ai.google.dev |

### 使用 Ollama（免費本地 LLM）

1. 安裝 Ollama：https://ollama.com
2. 拉取模型：
   ```bash
   ollama pull llama3.2
   # 或
   ollama pull qwen2.5
   ```
3. 在 AIRI 設定中，選擇 **Ollama** 作為 LLM 提供者
4. 設定端點：`http://localhost:11434`

---

## 🗣️ 設定語音合成（TTS，選用）

AIRI 目前支援：
- **ElevenLabs**（雲端，需要 API Key）
- 更多 TTS 選項可在設定中找到

---

## 🎤 設定語音辨識（STT，選用）

STT（語音轉文字）可讓你直接對 AIRI 說話。  
在 AIRI 的設定中可以開啟並設定 STT 服務。

---

## 🔧 常用指令速查

```bash
# 安裝依賴
pnpm install

# 建置所有內部套件
pnpm run build:packages

# 啟動 Web 版（瀏覽器版）
pnpm dev

# 啟動桌面版（Electron）
pnpm dev:tamagotchi

# 執行單元測試
pnpm test:run

# 程式碼 Lint 檢查
pnpm lint

# 修復 Lint 問題
pnpm lint:fix
```

---

## ❓ 常見問題

### Q: `pnpm: command not found`
**A**: 請確認 corepack 已啟用：
```bash
corepack enable
corepack prepare pnpm@10.28.1 --activate
```

### Q: 安裝時出現 node 版本錯誤
**A**: 本專案需要 Node.js **23 以上**。請升級你的 Node.js：
```bash
# 使用 nvm 管理 Node 版本（推薦）
nvm install 24
nvm use 24
```

### Q: Windows 上 Electron 版本無法啟動
**A**: 確認已安裝：
1. Visual Studio 2022（含 C++ 桌面開發工具）
2. Windows SDK

### Q: 開啟後畫面空白
**A**: 請確認：
1. `pnpm run build:packages` 已成功執行
2. 瀏覽器支援 WebGPU（Chrome 113+ 或 Edge 113+）

---

## 🔗 相關連結

- 📖 官方文件：https://airi.moeru.ai/docs/
- 💬 Discord：https://discord.gg/TgQ3Cu2F7A
- 🐛 回報問題：https://github.com/moeru-ai/airi/issues
- 🌐 線上 Demo：https://airi.moeru.ai
