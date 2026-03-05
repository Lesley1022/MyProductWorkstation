# Skill 配置（中文可读版）

基础信息:
  id: user-feedback-analysis
  name: user_feedback_analysis
  display_name: 用户反馈分析
  description: 当需要整理访谈、问卷、工单等用户反馈并提炼洞察时，调用此技能。

输入参数:
  type: object
  properties:
    raw_inputs:
      type: array
      description: 原始反馈材料路径列表
    output_path:
      type: string
      description: 分析结果输出路径
  required: [raw_inputs, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: 用户调研
    工具: user-feedback-analysis

输出解析:
  success_output:
    结果: 用户反馈分析完成
    输出字段: [output_path, evidence_index, insights]
  error_output:
    模板: 用户反馈分析失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: researcher
  允许阶段: [市场分析, 竞品调研, 用户调研]
  前置条件:
    - 已有用户反馈或访谈材料
  禁止事项:
    - 不得无证据产出结论

