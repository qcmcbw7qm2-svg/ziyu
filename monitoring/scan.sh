#!/bin/bash
# 舆情扫描脚本 — Claude Code headless 模式
# 用法: ./scan.sh "搜索关键词1" "搜索关键词2" ...
# 输出: monitoring/scan-YYYY-MM-DD-HHMM.log

KEYWORDS="${*:-品牌名 投诉 曝光}"
OUTDIR="$(cd "$(dirname "$0")" && pwd)"
TIMESTAMP=$(date +%Y-%m-%d-%H%M)
LOGFILE="$OUTDIR/scan-$TIMESTAMP.log"

run_scan() {
  claude -p "扫描以下关键词的最新舆情：$KEYWORDS。
输出格式：
1. 【新增负面/风险信号】有或者无
2. 【如果有】严重程度（苗头/发酵/爆发/危机）+ 具体内容和传播量
3. 【建议行动】基于 pr-crisis-skill 的 playbook 给出下一步建议" \
    --allowedTools "Bash,WebSearch,Read,Write" \
    --output-format stream-json \
    > "$LOGFILE" 2>&1
}

# 检查 Claude Code 是否可用
if ! command -v claude &> /dev/null; then
  echo "[ERROR] claude CLI not found. Install Claude Code first." | tee "$LOGFILE"
  exit 1
fi

echo "[$(date)] Scanning: $KEYWORDS" | tee "$LOGFILE"
run_scan
echo "[$(date)] Done. Log: $LOGFILE"
