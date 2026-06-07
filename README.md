# PR Crisis Management

一套给 Claude Code 用的公关舆情应对技能包。覆盖 8 种危机类型，包含应对方案、文案模板、方法论和自动化监测。

**只要把项目文件放到 `~/.claude/skills/` 下，遇到危机直接对话，Claude Code 自动匹配方案。**

---

## 快速安装

```bash
git clone https://github.com/你的用户名/pr-crisis-skill.git ~/.claude/skills/pr-crisis-management
```

然后在 Claude Code 里说「我被挂了」「出事了怎么办」，Claude 会自动加载技能包。

## 包含什么

### 10 种危机应对方案（playbooks/）

| 类型 | 文件 | 适用场景 |
|------|------|----------|
| 产品质量问题 | `product-quality.md` | 产品出问题被投诉/曝光/监管介入 |
| 老板/高管翻车 | `boss-gaffe.md` | 老板说错话、直播翻车、内部言论外泄 |
| 被竞品抹黑 | `competitor-smear.md` | 竞品恶意攻击、水军刷差评、伪造截图 |
| 客户大规模投诉 | `customer-complaint.md` | 维权帖爆了、评论区被冲、kol 带头声讨 |
| 员工丑闻 | `employee-scandal.md` | 员工行为不端被曝光、内部聊天记录外泄 |
| 监管调查 | `regulatory-trouble.md` | 被罚款、被约谈、被立案调查 |
| 谣言/假消息 | `viral-misinfo.md` | 假消息病毒式传播、被P图造谣 |
| 网络暴力 | `online-mob.md` | 个人被挂、人肉搜索、组织性网暴 |
| 被大V引导网暴 | `creator-mob.md` | 小博主被大V断章取义、偷换概念、粉丝涌入攻击 |
| 创作者失言翻车 | `celebrity-gaffe.md` | 说错话被营销号上纲上线、大面积脱粉、封杀风险 |

每个 playbook 包含：严重程度四级判定 → 冷静期操作 → 信息收集清单 → 定性判断矩阵 → 回应策略 → 执行清单 → 恢复时间表。

### 4 种公关文案模板（templates/）

- 道歉声明（apology）
- 澄清公告（clarification）
- 否认声明（denial）
- 律师函（legal-warning）

半成品模板，留占位符 `【】`，根据具体情况填充。禁用套话，只写人话。

### 舆情监控（monitoring/）

- `sop.md` — 监测操作指南：监测对象、频率、评论区风向分类、升级阈值、记录模板
- `automation.md` — 定时自动化方案：cron/launchd 配置、告警规则、与 playbook 联动

### 方法论（knowledge/）

- `why-crisis-pr-fails.md` — 9 种经典公关败局复盘（奔驰/碧桂园/滴滴/携程等）
- `response-principles.md` — 通用回应原则
- `spread-patterns.md` — 谣言/舆情传播规律

---

## 使用方式

### 方式一：危机应对

发生危机时直接对话：

```
用户：我被黑了，竞品在抖音上发视频说我产品质量有问题

Claude Code 会自动：
1. 扫码匹配 → playbooks/competitor-smear.md
2. 评估严重程度
3. 输出应对方案 + 行动清单
4. 如果需要发声明 → 调用 templates/
```

### 方式二：定时舆情监控

配置后自动运行：

```bash
# 参考 monitoring/automation.md 配置 cron
0 9 * * * bash /path/to/monitoring/scan.sh
```

### 方式三：学习/准备

无事时翻阅 knowledge/ 了解危机公关基本原理，翻 playbooks/ 熟悉应对框架。

---

## 设计原则

1. **针对情绪做设计** — 危机中的人处于高度紧张状态，方案必须清晰、具体、可立刻执行
2. **不写套话** — 所有模板禁止「深感抱歉」「高度重视」类公关八股
3. **按类型分类，不按行业分类** — 危机类型决定了应对框架，行业只是参数
4. **先稳住人，再解决问题** — 冷静期是每个 playbook 的第一步
5. **法律行动 > 公关话术** — 涉及造谣/人肉等，律师函比声明有用

---

## 谁适合用

- 中小企业老板/品牌方（无专职公关团队，出事靠直觉）
- 自媒体/内容创作者（个人品牌即核心资产，被网暴时无后援）
- 初创公司（没钱请公关公司，但出事不能裸奔）
- 公关从业者（作为应对框架参考和案例库）

---

## 贡献

欢迎提 PR 补充新的 playbook 类型、案例（脱敏后）或模板。

## 许可

MIT
