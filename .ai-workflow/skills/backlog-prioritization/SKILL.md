基础信息:
  id: backlog-prioritization
  name: backlog_prioritization
  display_name: 需求池优先级排序
  description: 当需要对需求池进行优先级分层和排序时，使用此技能。

输入参数:
  type: object
  properties:
    demand_pool_path:
      type: string
      description: 需求池文档路径
    rules:
      type: string
      description: 排序规则说明（价值/成本/紧急度）
    output_path:
      type: string
      description: 输出文件路径
  required:
    - demand_pool_path
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: 需求池
    tool: backlog-prioritization

输出解析:
  success_output:
    result: 需求排序完成
    fields:
      - output_path
      - priority_distribution
  error_output:
    template: 需求排序失败：{{error_message}}
