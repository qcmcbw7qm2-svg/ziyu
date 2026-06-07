# PR Crisis Management — 公关舆情技能包

当用户遇到公关危机、舆情事件、品牌负面、网络暴力等情况时，启动本技能包。

## 触发场景

### 中文触发词

**紧急求助型**：
「出事了」「被黑了」「被挂了」「被网暴」「被曝光」「被拍了」
「上热搜了」「炸了」「翻车了」「塌房了」「被冲了」
「怎么办」「怎么回应」「怎么处理」「帮我分析一下」

**具体危机类型**（→ 对应 playbook）：
「产品被投诉/曝光/召回」→ product-quality
「老板/创始人/CEO说错话/翻车/被挂」→ boss-gaffe
「竞品/同行抹黑/黑稿/水军/差评」→ competitor-smear
「客户投诉/维权/退货/差评爆了」→ customer-complaint
「员工/前员工爆料/内幕」→ employee-scandal
「被罚款/被约谈/被调查/监管/工商」→ regulatory-trouble
「谣言/假消息/P图/造谣/被传」→ viral-misinfo
「网暴/人肉/被挂/私信攻击/电话骚扰」→ online-mob
「大V/博主/网红挂我/带节奏/引导粉丝」→ creator-mob
「说错话/失言/塌房/脱粉/封杀/道歉信」→ celebrity-gaffe
「门店出事/后厨/卫生/食品安全/吃出异物」→ food-safety

**监控类**：
「扫描/搜一下 XX 的舆情」「有没有新的负面」
「最近 XX 有没有出事」「帮我盯着 XX」

**声明类**：
「写声明」「发道歉」「律师函」「回应口径」「官方回应」

### English / Mixed Triggers

- "crisis", "PR crisis", "brand crisis", "reputation crisis"
- "negative news", "viral negative", "going viral for the wrong reasons"
- "statement", "press release", "apology letter", "public response"
- "what should I say", "how to respond", "damage control"
- "somebody posted about us", "we're getting attacked online"
- "help me handle this situation", "crisis communication"
- "legal threat", "cease and desist", "lawyer letter"

### 触发判定优先级

1. 如果用户描述了具体危机事件 → 立即归类匹配 playbook
2. 如果描述模糊 → 追问确认事件类型和严重程度再归类
3. 如果用户只是在讨论/学习危机公关概念 → 不触发 playbook，用 knowledge/ 回答问题

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
