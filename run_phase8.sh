#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Phase 8: 1/3] Downloading the nine published operon reference proteins..."
"$PY" "$ROOT/preprint/automation/scripts/22_fetch_operon_references.py" \
  --project-root "$ROOT"

echo "[Phase 8: 2/3] Homology-screening pilot and external proteomes..."
"$PY" "$ROOT/preprint/automation/scripts/23_operon_homology_screen.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/23_operon_homology.log"

echo "[Phase 8: 3/3] Summarizing presence and genomic proximity..."
"$PY" "$ROOT/preprint/automation/scripts/24_operon_homology_summary.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/24_operon_homology_summary.log"

echo
echo "PHASE 8 DONE"
echo "Summary: $ROOT/preprint/results/auto/operon_homology/phase8_operon_homology_summary.md"
