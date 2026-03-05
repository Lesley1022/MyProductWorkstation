基础信息:
  id: user-manual
  name: user_manual
  display_name: 用户手册
  description: 当需要基于已通过文档输出用户操作手册时，使用此技能。

输入参数:
  type: object
  properties:
    prd_path:
      type: string
      description: PRD文档路径
    prototype_path:
      type: string
      description: 原型路径
    output_path:
      type: string
      description: 手册输出路径
  required:
    - prd_path
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: 最终交付
    tool: user-manual

输出解析:
  success_output:
    result: 用户手册生成成功
    fields:
      - output_path
      - covered_scenarios
  error_output:
    template: 用户手册生成失败：{{error_message}}
