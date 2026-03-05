# Skill 配置（中文可读版）

基础信息:
  id: user-manual
  name: user_manual
  display_name: 用户手册
  description: 当需要基于已通过文档输出用户操作手册时，调用此技能。

输入参数:
  type: object
  properties:
    prd_path:
      type: string
      description: PRD 文档路径
    prototype_path:
      type: string
      description: 原型路径
    output_path:
      type: string
      description: 手册输出路径
  required: [prd_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: 最终交付
    工具: user-manual

输出解析:
  success_output:
    结果: 用户手册生成成功
    输出字段: [output_path, covered_scenarios]
  error_output:
    模板: 用户手册生成失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: writer
  允许阶段: [最终交付]
  前置条件:
    - PRD 已通过
  禁止事项:
    - 不得与 PRD 术语和流程不一致

