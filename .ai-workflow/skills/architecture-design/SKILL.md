# Skill 配置（中文可读版）

基础信息:
  id: architecture-design
  name: architecture_design
  display_name: 架构设计
  description: 当需要基于需求池、BRD、MRD产出产品架构文档与需求映射时，调用此技能。

输入参数:
  type: object
  properties:
    demand_pool_path:
      type: string
      description: 需求池文档路径
    brd_path:
      type: string
      description: BRD 文档路径
    mrd_path:
      type: string
      description: MRD 文档路径
    output_path:
      type: string
      description: 输出文件路径
  required: [demand_pool_path, brd_path, mrd_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: 产品架构
    工具: architecture-design

输出解析:
  success_output:
    结果: 架构文档生成成功
    输出字段: [output_path, mapping_summary]
  error_output:
    模板: 架构文档生成失败：{{error_message}}
