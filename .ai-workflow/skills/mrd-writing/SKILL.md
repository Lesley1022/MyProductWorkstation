# Skill 配置（中文可读版）

基础信息:
  id: mrd-writing
  name: mrd_writing
  display_name: 生成市场需求文档
  description: 当 BRD 已通过审核并需要输出 MRD（市场需求）时，调用此技能。

输入参数:
  type: object
  properties:
    brd_path:
      type: string
      description: BRD 文档路径
    optional_refs:
      type: array
      description: 可选参考文档路径列表
    output_path:
      type: string
      description: MRD 输出路径
  required: [brd_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: MRD
    工具: mrd-writing

输出解析:
  success_output:
    结果: MRD 生成成功
    输出字段: [output_path, core_features]
  error_output:
    模板: MRD 生成失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: writer
  允许阶段: [MRD]
  前置条件:
    - BRD 已通过
  禁止事项:
    - 不得在 BRD 未通过时提前产出 MRD

