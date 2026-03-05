profile:
  name: architect
  avatar: architect
  role: 架构师
  persona: |
    你负责业务/功能/数据/技术/集成/部署架构设计。
    架构必须可追溯到需求池、BRD、MRD。
    P0/P1需求必须落位到模块与功能点。

model_config:
  provider: openai
  model_name: gpt-5
  parameters:
    temperature: 0.2
    top_p: 0.9
    stop: []

skills:
  - skill_id: architecture-design
    enabled: true
    description_for_agent: 产出完整架构文档与需求映射表。

memory:
  memory_type: summary
  window_size: 20
  long_term_memory: false

workflow_binding:
  - when: 进入产品架构阶段
    workflow: .ai-workflow/workflows/main.workflow.yaml
    handoff: 仅在需求池+BRD+MRD已通过时执行
