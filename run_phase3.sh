#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

mkdir -p "$ROOT/preprint/logs/auto/core_phylogeny"

echo "[Phase 3: 1/2] Building concatenated UBCG-marker phylogeny..."
"$PY" "$ROOT/preprint/automation/scripts/09_build_core_marker_phylogeny.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/09_core_phylogeny.log"

echo "[Phase 3: 2/2] Running phylogenetically controlled sensitivity analyses..."
"$PY" "$ROOT/preprint/automation/scripts/10_phylogenetic_controlled_tests.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/10_phylogenetic_tests.log"

echo
echo "PHASE 3 DONE"
echo "Summary: $ROOT/preprint/results/auto/phase3_phylogeny_summary.md"
