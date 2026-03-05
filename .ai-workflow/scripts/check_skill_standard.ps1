param(
  [string]$Root = "."
)

$ErrorActionPreference = "Stop"
$failed = $false

$requiredFiles = @(
  ".ai-workflow/agents/pm.agent.md",
  ".ai-workflow/agents/researcher.agent.md",
  ".ai-workflow/agents/architect.agent.md",
  ".ai-workflow/agents/designer.agent.md",
  ".ai-workflow/agents/writer.agent.md",
  ".ai-workflow/agents/reviewer.agent.md",
  ".ai-workflow/skills/revision-handler/SKILL.md",
  ".ai-workflow/skills/backlog-prioritization/SKILL.md",
  ".ai-workflow/skills/architecture-design/SKILL.md",
  ".ai-workflow/skills/hi-fi-prototyping/SKILL.md",
  ".ai-workflow/skills/brd-writing/SKILL.md",
  ".ai-workflow/skills/mrd-writing/SKILL.md",
  ".ai-workflow/skills/prd-writing/SKILL.md",
  ".ai-workflow/skills/design-critique/SKILL.md",
  ".ai-workflow/skills/energy-market-analysis/SKILL.md",
  ".ai-workflow/skills/user-feedback-analysis/SKILL.md",
  ".ai-workflow/skills/final-documentation/SKILL.md",
  ".ai-workflow/skills/user-manual/SKILL.md"
)

foreach ($path in $requiredFiles) {
  $full = Join-Path $Root $path
  if (-not (Test-Path $full)) {
    Write-Host "[check_skill_standard] MISSING: $path" -ForegroundColor Red
    $failed = $true
    continue
  }

  $raw = Get-Content $full -Raw
  if ([string]::IsNullOrWhiteSpace($raw)) {
    Write-Host "[check_skill_standard] EMPTY: $path" -ForegroundColor Red
    $failed = $true
  }
}

if ($failed) {
  Write-Host "[check_skill_standard] FAIL" -ForegroundColor Red
  exit 1
}

Write-Host "[check_skill_standard] PASS" -ForegroundColor Green

