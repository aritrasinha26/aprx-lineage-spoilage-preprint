#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Phase 4] Diagnosing and regularizing phylogenetic regression..."
"$PY" "$ROOT/preprint/automation/scripts/11_lambda_pgls_diagnostics.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/11_lambda_pgls_diagnostics.log"

echo
echo "PHASE 4 DONE"
echo "Summary: $ROOT/preprint/results/auto/phase4_phylo_diagnostic_summary.md"
