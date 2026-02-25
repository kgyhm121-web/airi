#!/usr/bin/env bash
# =====================================================
# AIRI 本地環境一鍵安裝腳本
# 使用方式: bash setup.sh
# =====================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "╔══════════════════════════════════════╗"
echo "║       🌸 AIRI 本地環境設置腳本        ║"
echo "╚══════════════════════════════════════╝"
echo ""

# ── 檢查 Node.js ───────────────────────────────────
echo -e "${YELLOW}[1/4] 檢查 Node.js 版本...${NC}"
if ! command -v node &> /dev/null; then
  echo -e "${RED}❌ 未找到 Node.js，請先安裝 Node.js 23+${NC}"
  echo "    下載連結: https://nodejs.org/en/download/"
  exit 1
fi

NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt 23 ]; then
  echo -e "${RED}❌ Node.js 版本過低（目前: $(node -v)，需要 23+）${NC}"
  echo "    請升級 Node.js: https://nodejs.org/en/download/"
  exit 1
fi
echo -e "${GREEN}✅ Node.js $(node -v) OK${NC}"

# ── 安裝 / 確認 pnpm ───────────────────────────────
echo ""
echo -e "${YELLOW}[2/4] 設定 pnpm...${NC}"
if ! command -v pnpm &> /dev/null; then
  echo "  pnpm 未找到，嘗試透過 corepack 安裝..."
  corepack enable
  corepack prepare pnpm@10.28.1 --activate
fi

PNPM_VERSION=$(pnpm --version 2>/dev/null || echo "0")
echo -e "${GREEN}✅ pnpm $PNPM_VERSION OK${NC}"

# ── 安裝依賴套件 ────────────────────────────────────
echo ""
echo -e "${YELLOW}[3/4] 安裝依賴套件（可能需要幾分鐘）...${NC}"
pnpm install
echo -e "${GREEN}✅ 依賴套件安裝完成${NC}"

# ── 建置內部套件 ────────────────────────────────────
echo ""
echo -e "${YELLOW}[4/4] 建置內部套件 (packages)...${NC}"
pnpm run build:packages
echo -e "${GREEN}✅ 套件建置完成${NC}"

# ── 完成 ─────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  🎉 安裝完成！請使用以下指令啟動 AIRI：        ║"
echo "║                                              ║"
echo "║  Web 版（瀏覽器）:  pnpm dev                  ║"
echo "║  桌面版（Electron）: pnpm dev:tamagotchi       ║"
echo "║                                              ║"
echo "║  詳細說明請參閱: LOCAL_SETUP.md               ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
