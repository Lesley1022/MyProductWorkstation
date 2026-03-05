# .ai-workflow 说明

本目录存放流程配置、Agent、Skill 与校验脚本。

结构：
- `agents/`：角色职责与门禁规则。
- `skills/`：可复用执行能力。
- `workflows/`：阶段流程、引用映射、模板映射。
- `scripts/`：一致性校验脚本。
- `templates/`：流程内部模板（非 `docs/templates`）。

原则：
- 先收集后推进，逐阶段审核。
- 只引用客观事实并可追溯。
- 每次修改后提交 Git。
