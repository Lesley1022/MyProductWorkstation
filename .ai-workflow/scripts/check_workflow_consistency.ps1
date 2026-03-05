param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$failed = $false

$workflowPath = Join-Path $Root '.ai-workflow/workflows/main.workflow.yaml'
if (-not (Test-Path $workflowPath)) {
  Write-Host "[check_workflow_consistency] MISSING: .ai-workflow/workflows/main.workflow.yaml" -ForegroundColor Red
  exit 1
}

$workflowRaw = Get-Content $workflowPath -Raw
$requiredStages = @(
  '需求收集整理',
  '市场分析',
  '政策调研',
  '竞品调研',
  '用户调研',
  '需求池',
  'BRD',
  'MRD',
  '产品架构',
  'HTML原型',
  'PRD'
)

foreach ($stage in $requiredStages) {
  if ($workflowRaw -notlike "*name: $stage*") {
    Write-Host "[check_workflow_consistency] MISSING_STAGE: $stage" -ForegroundColor Red
    $failed = $true
  }
}

$refPath = Join-Path $Root '.ai-workflow/workflows/document-reference-map.yaml'
if (-not (Test-Path $refPath)) {
  Write-Host "[check_workflow_consistency] MISSING: .ai-workflow/workflows/document-reference-map.yaml" -ForegroundColor Red
  $failed = $true
}

$templateCfg = Join-Path $Root '.ai-workflow/workflows/template-config.yaml'
if (-not (Test-Path $templateCfg)) {
  Write-Host "[check_workflow_consistency] MISSING: .ai-workflow/workflows/template-config.yaml" -ForegroundColor Red
  $failed = $true
}

if ($failed) {
  Write-Host "[check_workflow_consistency] FAIL" -ForegroundColor Red
  exit 1
}

Write-Host "[check_workflow_consistency] PASS" -ForegroundColor Green

