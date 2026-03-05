param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$failed = $false

$requiredTemplates = @(
  "docs/templates/需求收集整理模板.md",
  "docs/templates/市场分析模板.md",
  "docs/templates/政策调研模板.md",
  "docs/templates/竞品调研模板.md",
  "docs/templates/用户调研模板.md",
  "docs/templates/需求池模板.md",
  "docs/templates/商业需求分析（BRD）模板.md",
  "docs/templates/商业需求分析（MRD）模板.md",
  "docs/templates/产品架构模板.md",
  "docs/templates/产品需求文档（PRD）模板.md"
)

foreach ($path in $requiredTemplates) {
  $full = Join-Path $Root $path
  if (-not (Test-Path $full)) {
    Write-Host "[check_template_compliance] MISSING: $path" -ForegroundColor Red
    $failed = $true
  }
}

if ($failed) {
  Write-Host "[check_template_compliance] FAIL" -ForegroundColor Red
  exit 1
}

Write-Host "[check_template_compliance] PASS" -ForegroundColor Green
