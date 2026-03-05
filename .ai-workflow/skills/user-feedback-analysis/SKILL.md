基础信息:
  id: user-feedback-analysis
  name: user_feedback_analysis
  display_name: 用户反馈分析
  description: 当需要整理访谈、问卷、工单等用户反馈并提炼洞察时，使用此技能。

输入参数:
  type: object
  properties:
    raw_inputs:
      type: array
      description: 原始反馈材料路径列表
    output_path:
      type: string
      description: 分析输出路径
  required:
    - raw_inputs
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: 用户调研
    tool: user-feedback-analysis

输出解析:
  success_output:
    result: 用户反馈分析完成
    fields:
      - output_path
      - evidence_index
      - insights
  error_output:
    template: 用户反馈分析失败：{{error_message}}
