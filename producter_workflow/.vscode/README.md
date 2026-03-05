虚拟电厂运营商 AI 产品经理工作流项目简介本项目是一个面向虚拟电厂运营商领域的智能产品管理助手，通过多 Agent 协作，自动化生成从需求收集到数据埋点的全套产品文档，并输出高保真 HTML 原型和可供开发落地的详细 PRD 文档。所有产出物严格遵循 DAO OS 通用规则，确保界面规范统一、数据安全合规。

目录结构textproducer_workflow/├── agents/ # Agent 描述文件│ ├── orchestrator_agent.md # 主管 Agent│ ├── research_agent.md # 调研分析 Agent│ ├── document_writer_agent.md # 文档撰写 Agent│ ├── design_agent.md # 设计 Agent│ ├── data_agent.md # 数据埋点 Agent│ └── review_agent.md # 审核 Agent│├── skills/ # Skill 定义文件（按 Agent 组织）│ ├── research/ # 调研分析 Agent 的 Skill│ │ ├── collect_initial_requirements.md│ │ ├── market_analysis.md│ │ ├── policy_research.md│ │ ├── competitor_analysis.md│ │ ├── user_research.md│ │ └── create_requirement_pool.md│ ││ ├── document_writer/ # 文档撰写 Agent 的 Skill│ │ ├── write_brd.md│ │ ├── write_mrd.md│ │ └── write_prd.md│ ││ ├── design/ # 设计 Agent 的 Skill│ │ ├── create_business_flow_and_use_case.md│ │ ├── create_product_architecture.md│ │ ├── create_information_architecture_and_function_list.md│ │ ├── generate_html_prototype.md│ │ └── write_html_interaction_description.md│ ││ ├── data/ # 数据埋点 Agent 的 Skill│ │ └── design_data_tracking.md│ ││ └── review/ # 审核 Agent 的 Skill│ ├── review_document.md│ ├── tech_review.md│ └── check_design_compliance.md│├── templates/ # 所有文档模板（共14个）│ ├── 需求收集模板.md│ ├── 市场分析模板.md│ ├── 政策调研模板.md│ ├── 竞品分析模板.md│ ├── 用户调研模板.md│ ├── BRD模板.md│ ├── MRD模板.md│ ├── 业务流程图与用例图模板.md│ ├── 需求池模板.md│ ├── 产品架构图模板.md│ ├── 信息架构与功能列表模板.md│ ├── HTML交互说明模板.md│ ├── PRD模板.md│ └── 数据埋点模板.md│├── docs/ # 输出文档存储目录（自动生成）│ └── {platform_id}/{project_id}/{version}/│ ├── 需求收集_YYYYMMDD_vX.Y.Z.md│ ├── ...（依次生成所有文档）│ └── 数据埋点_YYYYMMDD_vX.Y.Z.md│├── rules/ # 规则文档│ └── DAO_OS通用规则.md # 界面交互、数据脱敏等规范│├── .vscode/ # IDE 配置（可选）├── mcp.json # MCP 服务器配置（可选）└── README.md # 项目说明注：以上为完整预期目录结构。使用前请确保 agents、skills、templates、rules 目录下已包含所有必需文件，缺失文件可从最终版文档中补充。

核心组件

1.  主管 Agent (orchestrator_agent.md)负责整体工作流的调度，与用户交互，协调其他 Agent 按顺序生成文档。

管理项目上下文（平台标识、项目标识、版本号、通用规则文档）。

处理用户确认/拒绝、变更回溯、版本控制，并实现 HTML 界面逐个审批。

2.  调研分析 Agent (research_agent.md)执行需求收集、市场分析、政策调研、竞品分析、用户调研、需求池管理等任务。

调用对应 Skill 生成调研类文档，并在需求收集阶段基于用户输入生成待确认问题。

3.  文档撰写 Agent (document_writer_agent.md)撰写 BRD、MRD、PRD。

PRD 中自动引用 HTML 原型截图，并包含技术规格（接口、数据模型、脱敏实现等），确保开发可直接落地。

4.  设计 Agent (design_agent.md)生成业务流程图、用例图、产品架构图、信息架构/功能列表。

生成高保真 HTML 原型（基于 Tailwind CSS，遵循 DAO OS 通用规则）。

编写 HTML 交互说明文档，标注每个交互点遵循的规则条款。

5.  数据埋点 Agent (data_agent.md)设计数据埋点方案，生成埋点文档。

确保埋点覆盖操作日志要求，并对明文查看等敏感操作单独记录。

6.  审核 Agent (review_agent.md)对每个文档进行内部评审，检查完整性、一致性、规则符合性。

提供技术预审和设计合规性检查（check_design_compliance），确保 HTML 原型严格遵循 DAO OS 规则。

工作流程初始化：用户输入产品版本、所属项目、涉及平台，并选择通用规则文档。

需求收集：主管 Agent 调用调研 Agent 生成需求收集草稿，并向用户提问确认待填字段。

顺序生成文档：按以下步骤依次执行，每个文档生成后均需经过内部评审和用户审核：

市场分析

政策调研

竞品分析

用户调研

BRD

MRD

业务流程图/用例图

需求池

产品架构图

信息架构/功能列表

HTML 文件（包含界面逐个审批）

HTML 交互说明

PRD

数据埋点

版本控制：每个文档初次生成版本为 vX.Y.Z.0，修改后修订号递增。文档头部自动插入修订历史。

变更回溯：若用户修改意见影响前置文档，主管 Agent 自动回溯重新生成受影响文档。

文档存储规则路径：docs/{平台标识}/{项目标识}/{版本号}/

平台标识：如 taiqi_xiaoyuanzhidian（拼音或英文缩写）

项目标识：如 dao_os_trade

版本号：如 V2.1.0.c

文件名：{模板名}_{YYYYMMDD}_v{主版本}.{修订版本}.md（HTML 文件为 .html）

如何使用前置条件需要接入 AI 模型（如 OpenAI GPT 系列）并配置 API 密钥。

需要安装 Node.js 环境（用于 HTML 原型预览，可选）。

需要将 templates/ 目录下的模板按需调整（如有特殊业务字段）。

（可选）根据 mcp.json 配置集成 Playwright、Figma 等外部工具。

启动方式运行主管 Agent 脚本（具体实现方式由开发团队决定，例如命令行交互或 Web 服务）。

根据提示输入项目信息：

产品版本（如 V2.1.0.c）

所属项目（如 DAO OS 2.0 - 交易链路）

涉及平台（如 太极、小原知电）

选择通用规则文档（默认使用 rules/DAO_OS通用规则.md）。

输入初步需求描述（可选）。

后续按照提示与 AI 交互，确认待填项、审核文档。

输出产物所有文档将保存在 docs/ 目录下，每个步骤的文档均会生成独立的 Markdown 文件，HTML 原型为可直接运行的 .html 文件。最终可打包交付给开发、测试团队。

模板与规则14 个标准模板模板名称 作用需求收集模板 记录项目基础信息和待确认项市场分析模板 分析市场规模、趋势、机会政策调研模板 梳理法规、政策影响及应对竞品分析模板 对比竞品，寻找差异化用户调研模板 定义用户角色、旅程、需求BRD 模板 论证商业价值、目标、风险MRD 模板 明确市场定位、功能概要业务流程图与用例图模板 展示业务流程和系统用例需求池模板 汇总需求并排定优先级产品架构图模板 设计系统模块、技术选型信息架构与功能列表模板 细化页面结构和功能点HTML 交互说明模板 描述原型交互细节及规则遵循PRD 模板 详细功能需求、非功能需求、技术规格数据埋点模板 定义埋点事件、属性、上报策略DAO OS 通用规则rules/DAO_OS通用规则.md 包含以下关键规范：

查询条件：文本框长度、日期格式、提示等。

功能按钮：导入/导出/新增/删除等操作的交互、校验、提示。

列表：序号、操作人/时间、空值、排序、分页、权限。

具体界面：表单元素（文本框、下拉框、金额、手机号、邮箱等）、保存/提交、操作日志。

数据脱敏：姓名、证件号码、银行卡号、手机号、邮箱、地址的脱敏规则。

所有生成的原型和 PRD 必须严格遵循该规则，审核 Agent 会进行自动检查。

注意事项用户对待确认项的拒绝将标记为“待确认”，后续步骤中若信息补充可自动填充。

HTML 文件生成后进入“界面审批”模式：先概览所有界面缩略图，再逐个界面确认，用户可勾选预置意见标签或输入自定义意见。

若修改意见影响前置文档，系统会提示重新生成相关文档并重新审核，确保一致性。

版本号管理：主版本号从用户输入中提取，修订版本号每次修改递增。

请确保 templates/ 目录下包含全部 14 个模板文件，skills/ 下每个子目录包含所有必需的 Skill 文件。

贡献与维护如需新增 Agent 或 Skill，请在对应目录下创建文件，并更新主管 Agent 的调度逻辑。

模板更新时，注意同步修改相关 Skill 中的加载语句，建议采用配置化管理模板文件名。

规则文档可根据业务发展迭代，但需确保向后兼容。

许可证本项目为内部使用，未经许可不得分发。