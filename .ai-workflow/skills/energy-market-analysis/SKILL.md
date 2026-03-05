基础信息:
  id: energy-market-analysis
  name: energy_market_analysis
  display_name: 能源市场专项分析
  description: 当需求涉及政策、电价、交易规则、需求响应时，使用此技能进行专项分析。

输入参数:
  type: object
  properties:
    policy_sources:
      type: array
      description: 政策来源链接或文件列表
    market_scope:
      type: string
      description: 市场分析范围
    business_context:
      type: string
      description: 业务场景描述
    output_path:
      type: string
      description: 输出文件路径
  required:
    - policy_sources
    - market_scope
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: 政策调研
    tool: energy-market-analysis

输出解析:
  success_output:
    result: 专项分析完成
    fields:
      - output_path
      - key_risks
      - action_plan
  error_output:
    template: 专项分析失败：{{error_message}}
