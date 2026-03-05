基础信息:
  id: brd-writing
  name: brd_writing
  display_name: 生成商业需求文档
  description: 当需求池已通过审核并需要产出BRD（商业需求）时，使用此技能。

输入参数:
  type: object
  properties:
    demand_pool_path:
      type: string
      description: 需求池文档路径
    optional_refs:
      type: array
      description: 可选参考文档路径列表
    output_path:
      type: string
      description: BRD输出路径
  required:
    - demand_pool_path
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: BRD
    tool: brd-writing

输出解析:
  success_output:
    result: BRD生成成功
    fields:
      - output_path
      - decision_suggestion
  error_output:
    template: BRD生成失败：{{error_message}}
