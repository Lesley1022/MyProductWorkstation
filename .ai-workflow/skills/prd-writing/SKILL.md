# Skill 配置（中文可读版）

基础信息:
  id: prd-writing
  name: prd_writing
  display_name: 生成产品需求文档
  description: 当 HTML 原型、产品架构、需求池已通过审核并需要产出 PRD 时，调用此技能。

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
    output_path:
      type: string
      description: PRD 输出路径
  required: [prototype_path, architecture_path, demand_pool_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: PRD
    工具: prd-writing

输出解析:
  success_output:
    结果: PRD 生成成功
    输出字段: [output_path, acceptance_coverage]
  error_output:
    模板: PRD 生成失败：{{error_message}}
