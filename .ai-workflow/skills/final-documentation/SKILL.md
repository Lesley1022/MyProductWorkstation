基础信息:
  id: final-documentation
  name: final_documentation
  display_name: 最终交付包
  description: 当需要汇总已通过文档并形成最终交付清单时，使用此技能。

输入参数:
  type: object
  properties:
    approved_docs:
      type: array
      description: 已通过文档路径列表
    output_path:
      type: string
      description: 交付包输出路径
  required:
    - approved_docs
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: 最终交付
    tool: final-documentation

输出解析:
  success_output:
    result: 交付包生成成功
    fields:
      - output_path
      - doc_index
  error_output:
    template: 交付包生成失败：{{error_message}}
