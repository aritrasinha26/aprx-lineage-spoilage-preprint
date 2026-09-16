#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
AUTO="$ROOT/preprint/automation"
PY="${PYTHON:-python3}"

mkdir -p "$ROOT/preprint/results/auto" \
         "$ROOT/preprint/figures/auto" \
         "$ROOT/preprint/logs/auto"

echo "[1/5] Extracting Maier 2020 Figure 2 phenotypes..."
"$PY" "$AUTO/scripts/01_extract_figure2_phenotypes.py" --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/01_extract_phenotypes.log"

echo "[2/5] Scanning AprX sequence features..."
"$PY" "$AUTO/scripts/02_scan_aprx_sequence_features.py" --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/02_sequence_features.log"

echo "[3/5] Merging genomic + phenotype data..."
"$PY" "$AUTO/scripts/03_merge_analysis_dataset.py" --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/03_merge_dataset.log"

echo "[4/5] Running statistics and making figures..."
"$PY" "$AUTO/scripts/04_analyse_and_plot.py" --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/04_analysis.log"

echo "[5/5] Building machine-generated result summary..."
"$PY" "$AUTO/scripts/05_make_results_summary.py" --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/05_summary.log"

echo
echo "DONE"
echo "Main dataset: $ROOT/preprint/results/auto/AprX_analysis_dataset.tsv"
echo "Statistics:   $ROOT/preprint/results/auto/statistical_results.tsv"
echo "Summary:      $ROOT/preprint/results/auto/results_summary.md"
echo "Figures:      $ROOT/preprint/figures/auto/"
echo
echo "QC REQUIRED: inspect Figure2_phenotype_QC.png and Figure2_unmatched_strains.tsv once."
