#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Phase 6: 1/3] Building external serralysin reference-aware phylogeny..."
"$PY" "$ROOT/preprint/automation/scripts/16_external_serralysin_phylogeny.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/16_external_serralysin_tree.log"

echo "[Phase 6: 2/3] Reconstructing external genomic neighborhoods..."
"$PY" "$ROOT/preprint/automation/scripts/17_external_genomic_context.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/17_external_context.log"

echo "[Phase 6: 3/3] Integrating external sequence, tree and context evidence..."
"$PY" "$ROOT/preprint/automation/scripts/18_external_integrated_summary.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/18_external_summary.log"

echo
echo "PHASE 6 DONE"
echo "Summary: $ROOT/preprint/external_validation/phase6_external_summary.md"
