# Skill 配置（中文可读版）

基础信息:
  id: prd-writing
  name: prd_writing
  display_name: 生成产品需求文档
  description: 当 HTML 原型、产品架构、需求池已通过审核并需要产出 PRD，且需符合 DAO OS 通用规则时，调用此技能。

输入参数:
  type: object
  properties:
    prototype_path:
      type: string
      description: HTML 原型路径
    architecture_path:
      type: string
      description: 产品架构文档路径
    demand_pool_path:
      type: string
      description: 需求池文档路径
    general_rule_path:
      type: string
      description: DAO OS 通用规则文档路径，默认 docs/通用设计规范.md
    output_path:
      type: string
      description: PRD 输出路径
  required: [prototype_path, architecture_path, demand_pool_path, general_rule_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: PRD
    工具: prd-writing
    强制规则文档: docs/通用设计规范.md
    提审前检查: DAO_OS_通用规则符合性

输出解析:
  success_output:
    结果: PRD 生成成功
    输出字段: [output_path, acceptance_coverage, rule_check_summary]
  error_output:
    模板: PRD 生成失败：{{error_message}}
