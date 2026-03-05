# Skill 配置（中文可读版）

基础信息:
  id: brd-writing
  name: brd_writing
  display_name: 生成商业需求文档
  description: 当需求池已通过审核并需要输出 BRD（商业需求）时，调用此技能。

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
      description: BRD 输出路径
  required: [demand_pool_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: BRD
    工具: brd-writing

输出解析:
  success_output:
    结果: BRD 生成成功
    输出字段: [output_path, decision_suggestion]
  error_output:
    模板: BRD 生成失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: writer
  允许阶段: [BRD]
  前置条件:
    - 需求池已通过
  禁止事项:
    - 未通过 BRD 审核不得进入 MRD

