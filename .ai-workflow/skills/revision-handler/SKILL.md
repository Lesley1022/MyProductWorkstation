# Skill 配置（中文可读版）

基础信息:
  id: revision-handler
  name: revision_handler
  display_name: 变更处理
  description: 当收到“修改”反馈时，调用此技能分析影响范围并安排回归顺序。

输入参数:
  type: object
  properties:
    change_request:
      type: string
      description: 用户修改意见
    current_stage:
      type: string
      description: 当前阶段名称
    approved_docs:
      type: array
      description: 已通过文档路径列表
    output_path:
      type: string
      description: 变更影响矩阵输出路径
  required: [change_request, current_stage, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: 变更回归
    工具: revision-handler

输出解析:
  success_output:
    结果: 变更分析完成
    输出字段: [output_path, affected_stages, rollback_plan]
  error_output:
    模板: 变更分析失败：{{error_message}}
