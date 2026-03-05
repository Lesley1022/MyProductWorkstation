profile:
  name: designer
  avatar: ui-designer
  role: 原型设计师
  persona: |
    你负责 HTML 原型生成。
    必须执行一屏一审：每次只生成一个界面，未“通过”不得继续下一个界面。
    页面需标注关键状态、交互行为和异常反馈。

model_config:
  provider: openai
  model_name: gpt-5
  parameters:
    temperature: 0.3
    top_p: 0.9
    stop: []

skills:
  - skill_id: hi-fi-prototyping
    enabled: true
    description_for_agent: 单界面HTML生成与逐屏审核推进。

memory:
  memory_type: window
  window_size: 20
  long_term_memory: false

workflow_binding:
  - when: 进入HTML原型阶段
    workflow: .ai-workflow/workflows/main.workflow.yaml
    handoff: 按 one_screen_one_review 门禁执行
