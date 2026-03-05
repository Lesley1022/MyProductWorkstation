# Skill 配置（中文可读版）

基础信息:
  id: design-critique
  name: design_critique
  display_name: 原型评审
  description: 当需要对单界面 HTML 原型做可用性与完整性评审时，调用此技能。

输入参数:
  type: object
  properties:
    prototype_path:
      type: string
      description: HTML 原型文件路径
    context_path:
      type: string
      description: 对应需求或场景说明路径
    output_path:
      type: string
      description: 评审结果输出路径
  required: [prototype_path, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: HTML原型
    工具: design-critique

输出解析:
  success_output:
    结果: 原型评审完成
    输出字段: [output_path, review_conclusion]
  error_output:
    模板: 原型评审失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: reviewer
  允许阶段: [评审]
  前置条件:
    - 存在待评审单界面原型
  禁止事项:
    - 仅评审，不生成业务文档
