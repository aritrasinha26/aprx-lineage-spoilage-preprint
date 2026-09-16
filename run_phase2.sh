#!/usr/bin/env bash
set -euo pipefail
ROOT="${APRX_PROJECT:-$(pwd)}"
PY="${PYTHON:-python3}"

echo "[Phase 2: 1/3] Lineage-aware AprX marker/site analysis"
"$PY" "$ROOT/preprint/automation/scripts/06_lineage_aware_analysis.py" \
  --project-root "$ROOT" --permutations 2000 \
  2>&1 | tee "$ROOT/preprint/logs/auto/06_lineage_aware.log"

echo "[Phase 2: 2/3] Extracting Maier Figure 2 operon types"
"$PY" "$ROOT/preprint/automation/scripts/07_extract_figure2_operon_types.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/07_operon_type_ocr.log"

echo "[Phase 2: 3/3] Operon-type phenotype analysis"
"$PY" "$ROOT/preprint/automation/scripts/08_operon_type_analysis.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/08_operon_analysis.log"

echo
echo "PHASE 2 DONE"
echo "Inspect: preprint/figures/auto/Figure2_operon_type_QC.png"
echo "Results: preprint/results/auto/species_motif_phenotype_summary.tsv"
echo "         preprint/results/auto/motif_variant_phenotype_summary.tsv"
echo "         preprint/results/auto/within_species_variable_site_tests.tsv"
echo "         preprint/results/auto/operon_type_phenotype_summary.tsv"
