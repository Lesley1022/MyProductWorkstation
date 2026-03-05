基础信息:
  id: mrd-writing
  name: mrd_writing
  display_name: 生成市场需求文档
  description: 当BRD已通过审核并需要产出MRD（市场需求）时，使用此技能。

输入参数:
  type: object
  properties:
    brd_path:
      type: string
      description: BRD文档路径
    optional_refs:
      type: array
      description: 可选参考文档路径列表
    output_path:
      type: string
      description: MRD输出路径
  required:
    - brd_path
    - output_path

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    stage: MRD
    tool: mrd-writing

输出解析:
  success_output:
    result: MRD生成成功
    fields:
      - output_path
      - core_features
  error_output:
    template: MRD生成失败：{{error_message}}
