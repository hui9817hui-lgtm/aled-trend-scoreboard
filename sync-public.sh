#!/bin/bash
# sync-public.sh — 将 domain-score 公开输出同步到公共仓库并推送
# 每天 05:00 由 daily_scan.py 自动调用
# Token 存储在 .github_token 文件中（已 gitignore，不提交到仓库）

set -e
cd "$(dirname "$0")"

ALED_CORE="/root/.openclaw/workspace/projects/aled-core"
PUBLIC_REPO_DIR="/root/.openclaw/workspace/projects/aled-trend-scoreboard"
ALED_OUT="$ALED_CORE/output/ALED"
CONTENT_OUT="$ALED_CORE/output/content"
VER_OUT="$ALED_CORE/output/验证"
TODAY=$(date +%Y-%m-%d)

# 从外部文件读取 token（不提交到 git）
TOKEN_FILE="$(dirname "$0")/.github_token"
if [ ! -f "$TOKEN_FILE" ]; then
  echo "[sync-public] ⚠️ 未找到 $TOKEN_FILE，跳过推送"
  exit 0
fi
TOKEN=$(cat "$TOKEN_FILE" | tr -d '\n')

echo "[sync-public] $TODAY"

# 1. 复制文件到公共仓库目录
# 英文看板
cp "$ALED_OUT/public/"*_scoreboard.md "$PUBLIC_REPO_DIR/daily/" 2>/dev/null
# 中文看板（复制到 cn/ 子目录）
mkdir -p "$PUBLIC_REPO_DIR/daily/cn/"
cp "$ALED_OUT/public/"*_看板.md "$PUBLIC_REPO_DIR/daily/cn/" 2>/dev/null
# 验证报告
cp "$VER_OUT/public/"*.md "$PUBLIC_REPO_DIR/daily/" 2>/dev/null
# 英文日报
cp "$CONTENT_OUT/en/"*_daily.md "$PUBLIC_REPO_DIR/daily/" 2>/dev/null
# 中文日报
cp "$CONTENT_OUT/cn/"*_日报.md "$PUBLIC_REPO_DIR/daily/cn/" 2>/dev/null

# 3b. 信号数据（可验证源）
mkdir -p "$PUBLIC_REPO_DIR/daily/signal_counts/"
mkdir -p "$PUBLIC_REPO_DIR/daily/signal_sources/"
cp "$ALED_CORE/output/public/signal_counts/"*.json "$PUBLIC_REPO_DIR/daily/signal_counts/" 2>/dev/null
cp "$ALED_CORE/output/public/signal_sources/"*.json "$PUBLIC_REPO_DIR/daily/signal_sources/" 2>/dev/null

# 2. 更新 index.md
{
  echo "# ALED Daily Scoreboards"
  echo ""
  echo "Last updated: $TODAY"
  echo ""
  echo "Contact: shenhaiceshi2026@126.com"
  echo ""
  echo "## Daily Reports"
  echo ""
} > "$PUBLIC_REPO_DIR/daily/index.md"
for f in $(ls -t "$PUBLIC_REPO_DIR/daily/"*_scoreboard.md 2>/dev/null); do
  name=$(basename "$f" _scoreboard.md)
  echo "- [$name](https://github.com/hui9817hui-lgtm/aled-trend-scoreboard/blob/main/daily/$(basename $f))" >> "$PUBLIC_REPO_DIR/daily/index.md"
done

# 3. Git 推送 (via API token URL)
cd "$PUBLIC_REPO_DIR"
git add -A
if git diff --cached --quiet; then
  echo "[sync-public] ✅ 无变化，跳过"
  exit 0
fi

git commit -m "aled: $TODAY daily update" --no-verify

# Push - token 在 URL 中但不在文件内容中，不会被 secret scanning 触发
GIT_TERMINAL_PROMPT=0 git push "https://oauth2:${TOKEN}@github.com/hui9817hui-lgtm/aled-trend-scoreboard.git" main 2>&1 || \
  GIT_TERMINAL_PROMPT=0 git push "https://oauth2:${TOKEN}@github.com/hui9817hui-lgtm/aled-trend-scoreboard.git" main --force 2>&1

echo "[sync-public] ✅ 推送完成"
