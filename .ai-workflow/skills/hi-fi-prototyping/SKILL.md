基础信息:
  id: hi-fi-prototyping
  name: hi_fi_prototyping
  display_name: 高保真HTML原型
  description: 当需要按“一屏一审”规则生成HTML原型界面时，使用此技能。

输入参数:
  type: object
  properties:
    architecture_path:
      type: string
      description: 产品架构文档路径
    mrd_path:
      type: string
      description: MRD文档路径
    screen_name:
      type: string
      description: 当前要生成的界面名称
    output_path:
      type: string
      description: HTML输出路径
  required:
    - architecture_path
    - mrd_path
    - screen_name
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: HTML原型
    mode: one_screen_one_review
    tool: hi-fi-prototyping

输出解析:
  success_output:
    result: 单界面原型生成成功
    fields:
      - output_path
      - screen_name
  error_output:
    template: 原型生成失败：{{error_message}}
