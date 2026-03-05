基础信息:
  id: design-critique
  name: design_critique
  display_name: 原型评审
  description: 当需要对单界面HTML原型进行可用性与完整性评审时，使用此技能。

输入参数:
  type: object
  properties:
    prototype_path:
      type: string
      description: HTML原型文件路径
    context_path:
      type: string
      description: 对应需求或场景说明路径
    output_path:
      type: string
      description: 评审结果输出路径
  required:
    - prototype_path
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: HTML原型
    tool: design-critique

输出解析:
  success_output:
    result: 原型评审完成
    fields:
      - output_path
      - review_conclusion
  error_output:
    template: 原型评审失败：{{error_message}}
