#!/bin/bash
# sync-public.sh — 将 domain-score 的公开输出同步到公共仓库并推送
# 每天 05:00 cron 中由 daily_scan.py 调用

set -e
cd "$(dirname "$0")"

DOMAIN_SCORE="/root/.openclaw/workspace/projects/domain-score"
PUBLIC_REPO="/root/.openclaw/workspace/projects/aled-trend-scoreboard"
PUBLIC_ALED="$DOMAIN_SCORE/output/ALED"
PUBLIC_CONTENT="$DOMAIN_SCORE/output/content"
PUBLIC_VER="$DOMAIN_SCORE/output/验证"
TODAY=$(date +%Y-%m-%d)

echo "[sync-public] $TODAY"

# 1. 复制公共评分看板 + 英文报告
cp "$PUBLIC_ALED/public/"*.md "$PUBLIC_REPO/daily/" 2>/dev/null
cp "$PUBLIC_ALED/en/"*_report.json "$PUBLIC_REPO/daily/en/" 2>/dev/null

# 2. 复制验证报告
cp "$PUBLIC_VER/public/"*.md "$PUBLIC_REPO/daily/" 2>/dev/null

# 3. 复制内容管道产出
cp "$PUBLIC_CONTENT/en/"*_daily.md "$PUBLIC_REPO/daily/" 2>/dev/null

# 4. 更新 README 中的最近更新日期
sed -i "s/^Last updated: .*/Last updated: $TODAY/" "$PUBLIC_REPO/README.md" 2>/dev/null || true

# 5. git push
cd "$PUBLIC_REPO"
git add -A
git diff --cached --quiet || git commit -m "aled: $TODAY daily update"
git push origin main 2>&1 || git push --set-upstream origin main 2>&1

echo "[sync-public] ✅ 推送完成"
