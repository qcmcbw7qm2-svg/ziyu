# 定时舆情监控自动化

通过 Claude Code + cron/launchd 实现定时自动舆情扫描和预警。

## 方案

有两种实现方式：

### 方案 A：Claude Code Headless（推荐）

每天定时运行 Claude Code，扫描关键词并输出简报。

**环境要求**：
- Claude Code CLI 已安装
- web-access skill（用于联网搜索）
- cron 或 launchd（macOS 自带）

**配置步骤**：

1. 在项目目录下创建监控关键词文件 `monitoring/keywords.txt`：

```
品牌名/人名 # 核心
品牌名/人名 + 投诉/曝光/避雷 # 负面信号
品牌名/人名 + 最新/新闻 # 最新动态
行业关键词 + 监管/政策 # 行业风险
```

2. 创建监控脚本 `monitoring/scan.sh`：

```bash
#!/bin/bash
cd /path/to/pr-crisis-skill
DATE=$(date +%Y-%m-%d)
claude -p "扫描以下关键词的最新舆情：$(cat monitoring/keywords.txt)。
输出格式：1) 是否有新增负面/风险信号 2) 如果有，严重程度和具体内容 3) 建议行动" \
  --allowedTools "Bash,WebSearch,Read,Write" \
  --output-format stream-json \
  > "monitoring/scan-$DATE.log" 2>&1
```

3. 设置 cron（macOS）：

```bash
# 每天早上 9 点和晚上 21 点各扫一次
0 9 * * * /path/to/pr-crisis-skill/monitoring/scan.sh
0 21 * * * /path/to/pr-crisis-skill/monitoring/scan.sh
```

或使用 launchd（更稳定）：

```xml
<!-- ~/Library/LaunchAgents/com.pr-crisis.scan.plist -->
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
  "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.pr-crisis.scan</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/path/to/pr-crisis-skill/monitoring/scan.sh</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
        <dict>
            <key>Hour</key><integer>9</integer>
            <key>Minute</key><integer>0</integer>
        </dict>
        <dict>
            <key>Hour</key><integer>21</integer>
            <key>Minute</key><integer>0</integer>
        </dict>
    </array>
</dict>
</plist>
```

### 方案 B：纯 Claude Code 对话触发（零配置）

不设定时任务，只在需要时通过对话触发：

```
/scan 品牌名 关键词
```

Claude Code 会通过 web-access skill 搜索各平台并输出简报。适合不需要 24 小时监控的场景，或作为方案 A 的补充。

## 告警规则

扫描结果命中以下任一条件时，发送预警通知：

| 告警级别 | 触发条件 | 通知方式 |
|----------|----------|----------|
| 🟢 常规 | 无异动 | 仅记录日志 |
| 🟡 关注 | 新出现负面讨论 > 3 条 | 记录日志 + 标记关注 |
| 🟠 预警 | 负面讨论增速明显 / 被大V提及 | 推送 IM 通知（飞书/微信） |
| 🔴 告警 | 主流媒体跟进 / 登上热搜 / 出现线下行动号召 | 立即推送 + 启动对应 playbook |

## 与 playbook 的联动

扫描到风险信号后，根据类型自动匹配 playbook：

| 信号类型 | 对应 playbook |
|----------|--------------|
| 产品质量投诉集中出现 | `product-quality.md` |
| 老板/高管言论被挂 | `boss-gaffe.md` |
| 被指恶意竞争/抹黑 | `competitor-smear.md` |
| 客户维权帖爆了 | `customer-complaint.md` |
| 谣言/假消息传播 | `viral-misinfo.md` |
| 监管调查/处罚消息 | `regulatory-trouble.md` |
| 员工丑闻/内部爆料 | `employee-scandal.md` |
| 个人被挂/网暴 | `online-mob.md` |
