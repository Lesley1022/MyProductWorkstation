# Skill: create_business_flow_and_use_case

## 所属Agent
设计Agent (Design Agent)

## 描述
生成业务流程图和用例图，以文本描述或Mermaid格式输出。帮助团队理解业务流程和系统边界。

## 输入参数
| 参数名 | 类型 | 必填 | 描述 |
|--------|------|------|------|
| `project_id` | string | 是 | 项目标识 |
| `platform_id` | string | 是 | 平台标识 |
| `version` | string | 是 | 版本号 |
| `common_rules` | object | 否 | DAO OS通用规则文档 |
| `previous_docs` | array | 是 | 已生成的文档列表，至少包含需求池、MRD |
| `pending_confirms` | array | 是 | 待确认项列表 |

## 输出参数
| 参数名 | 类型 | 描述 |
|--------|------|------|
| `document_content` | string | 按照“业务流程图/用例图模板”生成的文档内容，包含文字描述和Mermaid代码块 |

## 内部逻辑
1. 加载“业务流程图与用例图模板”文件。。
2. 从需求池和MRD中提取关键业务流程和参与者（如运营商、电网、终端用户）。
3. 使用Mermaid语法生成用例图，展示参与者和用例之间的关系。
4. 对核心业务流程（如资源聚合、需求响应执行）绘制业务流程图（Mermaid流程图）。
5. 配以文字说明，解释每个步骤和决策点。
6. 返回文档内容。

## 注意事项
- Mermaid代码需确保语法正确，可在支持Mermaid的编辑器中预览。
- 流程图应清晰反映业务流转，避免过于复杂。