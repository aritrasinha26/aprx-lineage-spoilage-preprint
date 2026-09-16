#!/usr/bin/env bash
set -euo pipefail
ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

mkdir -p "$ROOT/preprint/figures/final"

echo "[Phase 7: 1/3] External marker/context statistics..."
"$PY" "$ROOT/preprint/automation/scripts/19_phase7_external_statistics.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/19_phase7_statistics.log"

echo "[Phase 7: 2/3] Generating integrated phylogeny/context figures..."
"$PY" "$ROOT/preprint/automation/scripts/20_make_integrated_figures.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/20_integrated_figures.log"

echo "[Phase 7: 3/3] Writing integrated checkpoint..."
"$PY" "$ROOT/preprint/automation/scripts/21_integrated_checkpoint.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/21_integrated_checkpoint.log"

echo
echo "PHASE 7 DONE"
echo "Checkpoint: $ROOT/preprint/results/auto/integrated_analysis_checkpoint.md"
echo "Figures: $ROOT/preprint/figures/final/"
