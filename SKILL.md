# PR Crisis Management — 公关舆情技能包

当用户遇到公关危机、舆情事件、品牌负面、网络暴力等情况时，启动本技能包。

## 触发场景

- 用户说「出事了」「被黑了」「被挂了」「被网暴」「被曝光」
- 用户提供负面舆情截图/链接，要求分析应对
- 用户要求做舆情监控、定时扫描
- 用户提到「危机公关」「发声明」「回应舆论」
- 关键词：舆情、危机、网暴、负面、曝光、道歉、声明、起诉

## 工作流

### 第一步：定性

判定事件类型，从 `playbooks/` 中选择对应的应对方案：

| 情况 | Playbook |
|------|----------|
| 产品质量被质疑/曝光 | `playbooks/product-quality.md` |
| 老板/高管言论翻车 | `playbooks/boss-gaffe.md` |
| 被竞品恶意抹黑 | `playbooks/competitor-smear.md` |
| 客户/用户大规模投诉 | `playbooks/customer-complaint.md` |
| 员工丑闻/内部爆料 | `playbooks/employee-scandal.md` |
| 监管调查/处罚 | `playbooks/regulatory-trouble.md` |
| 谣言/假消息传播 | `playbooks/viral-misinfo.md` |
| 个人被网暴/人肉 | `playbooks/online-mob.md` |
| 被大V引导粉丝攻击 | `playbooks/creator-mob.md` |
| 创作者/主播失言翻车 | `playbooks/celebrity-gaffe.md` |
| 餐饮食品安全 | `playbooks/food-safety.md` |

### 第二步：评估严重程度

按照对应 playbook 中的四级标准（🔵苗头 → 🟡发酵 → 🟠爆发 → 🔴危机）判定当前级别。

### 第三步：生成应对方案

基于 playbook 的框架，结合具体情况输出：

1. **当前状态判断**：什么级别、什么性质
2. **即时行动清单**：接下来 1 小时内该做什么
3. **回应策略**：要不要回应、什么时候回、什么口径
4. **文案草稿**：如果需要发声明/道歉/律师函，使用 `templates/` 中的模板
5. **后续节奏**：24h/48h/7 天的行动时间表

### 第四步：启动舆情监控（按需）

如果用户需要持续监控，使用 `monitoring/sop.md` 设置监测方案，使用 `monitoring/automation.md` 配置定时任务。

## 文案原则

- 不写套话（禁用「深感抱歉」「深刻反思」「高度重视」类模板话术）
- 认事实不认情绪
- 不同危机类型匹配不同文案策略
- 模板是半成品，留占位符 `【】`，使用时填充具体信息
- 面对消费者时，情绪管理比事实分析更优先
- 涉及人身安全时，法律行动优先于公关行动

## 知识库

- `knowledge/why-crisis-pr-fails.md` — 9 种经典危机公关败局，每次做策略前过一遍避免踩坑
- `knowledge/response-principles.md` — 通用回应原则
- `knowledge/spread-patterns.md` — 谣言/舆情传播规律

## 重要提醒

- 用户可能处于高度紧张/愤怒/恐惧状态，先稳住情绪再谈策略
- 不主动建议「删帖」「压热搜」等有风险的灰色操作
- 涉及法律问题，最终决策应由律师确认
