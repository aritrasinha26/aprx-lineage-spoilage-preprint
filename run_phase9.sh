#!/usr/bin/env bash
set -euo pipefail
ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Phase 9: 1/4] Reconstructing ordered operon architectures..."
"$PY" "$ROOT/preprint/automation/scripts/25_reconstruct_operon_architectures.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/25_operon_architectures.log"

echo "[Phase 9: 2/4] Comparing reconstructed architectures with published pilot operon types..."
"$PY" "$ROOT/preprint/automation/scripts/26_validate_operon_architectures.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/26_operon_validation.log"

echo "[Phase 9: 3/4] Regenerating publication-quality figures..."
"$PY" "$ROOT/preprint/automation/scripts/27_make_publication_figures.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/27_publication_figures.log"

echo "[Phase 9: 4/4] Freezing computational results..."
"$PY" "$ROOT/preprint/automation/scripts/28_freeze_analysis.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/28_analysis_freeze.log"

echo
echo "PHASE 9 DONE"
echo "Freeze checkpoint: $ROOT/preprint/results/auto/FINAL_ANALYSIS_FREEZE.md"
echo "Publication figures: $ROOT/preprint/figures/publication/"
