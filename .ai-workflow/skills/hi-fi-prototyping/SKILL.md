# Skill 配置（中文可读版）

基础信息:
  id: hi-fi-prototyping
  name: hi_fi_prototyping
  display_name: 高保真 HTML 原型
  description: 当需要按“一屏一审”规则生成 HTML 原型界面时，调用此技能。

输入参数:
  type: object
  properties:
    architecture_path:
      type: string
      description: 产品架构文档路径
    mrd_path:
      type: string
      description: MRD 文档路径
    screen_name:
      type: string
      description: 当前界面名称
    output_path:
      type: string
      description: HTML 输出路径
  required: [architecture_path, mrd_path, screen_name, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: HTML原型
    模式: one_screen_one_review
    工具: hi-fi-prototyping

输出解析:
  success_output:
    结果: 单界面原型生成成功
    输出字段: [output_path, screen_name]
  error_output:
    模板: 原型生成失败：{{error_message}}
