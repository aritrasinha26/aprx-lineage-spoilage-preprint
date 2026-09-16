#!/usr/bin/env bash
set -euo pipefail
ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Operon correction 1/3] Reconstructing operon classes without OCR labels..."
"$PY" "$ROOT/preprint/automation/scripts/29_correct_operon_classes.py" \
  --project-root "$ROOT"

echo "[Operon correction 2/3] Re-running phenotype association..."
"$PY" "$ROOT/preprint/automation/scripts/30_corrected_operon_phenotype.py" \
  --project-root "$ROOT"

echo "[Operon correction 3/3] Writing corrected checkpoint..."
"$PY" "$ROOT/preprint/automation/scripts/31_corrected_operon_checkpoint.py" \
  --project-root "$ROOT"

echo
echo "DONE"
echo "Checkpoint: $ROOT/preprint/results/auto/CORRECTED_OPERON_ANALYSIS.md"
