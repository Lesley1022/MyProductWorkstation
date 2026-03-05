# Skill 配置（中文可读版）

基础信息:
  id: final-documentation
  name: final_documentation
  display_name: 最终交付包
  description: 当需要汇总已通过文档并生成最终交付清单时，调用此技能。

输入参数:
  type: object
  properties:
    approved_docs:
      type: array
      description: 已通过文档路径列表
    output_path:
      type: string
      description: 交付包输出路径
  required: [approved_docs, output_path]

执行逻辑:
  type: WORKFLOW
  workflow: .ai-workflow/workflows/main.workflow.yaml
  config:
    阶段: 最终交付
    工具: final-documentation

输出解析:
  success_output:
    结果: 交付包生成成功
    输出字段: [output_path, doc_index]
  error_output:
    模板: 交付包生成失败：{{error_message}}

调用约束:
  总调度Agent: pm
  执行Agent: writer
  允许阶段: [最终交付]
  前置条件:
    - 相关文档均为已通过状态
  禁止事项:
    - 不得引用未通过文档

