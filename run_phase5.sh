#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"
EXT="$ROOT/preprint/external_validation"
PY="${PYTHON:-python3}"

mkdir -p "$EXT"

echo "[Phase 5: 1/6] Querying current NCBI RefSeq type-material Pseudomonas genomes..."
datasets summary genome taxon Pseudomonas \
  --assembly-source RefSeq \
  --annotated \
  --from-type \
  --exclude-atypical \
  --mag exclude \
  --as-json-lines \
  > "$EXT/pseudomonas_type_refseq.jsonl"

echo "[Phase 5: 2/6] Converting NCBI metadata to TSV..."
dataformat tsv genome \
  --inputfile "$EXT/pseudomonas_type_refseq.jsonl" \
  --fields accession,organism-name,organism-infraspecific-strain,assminfo-level,assminfo-refseq-category,assmstats-number-of-contigs,assmstats-contig-n50,type_material-label,type_material-display_text \
  > "$EXT/pseudomonas_type_refseq_metadata.tsv"

echo "[Phase 5: 3/6] Selecting one type-material RefSeq assembly per organism..."
"$PY" "$ROOT/preprint/automation/scripts/12_select_external_type_genomes.py" \
  --project-root "$ROOT"

echo "[Phase 5: 4/6] Downloading protein + GFF3 packages..."
rm -f "$EXT/pseudomonas_type_refseq_genomes.zip"
datasets download genome accession \
  --inputfile "$EXT/pseudomonas_type_refseq_accessions.txt" \
  --include protein,gff3 \
  --filename "$EXT/pseudomonas_type_refseq_genomes.zip" \
  --no-progressbar

rm -rf "$EXT/type_refseq_genomes"
mkdir -p "$EXT/type_refseq_genomes"
unzip -q "$EXT/pseudomonas_type_refseq_genomes.zip" \
  -d "$EXT/type_refseq_genomes"

echo "[Phase 5: 5/6] Scanning external proteomes for AprX-like serralysins..."
"$PY" "$ROOT/preprint/automation/scripts/13_scan_external_aprx.py" \
  --project-root "$ROOT"

echo "[Phase 5: 6/6] Aligning candidates and testing the proposed marker region..."
"$PY" "$ROOT/preprint/automation/scripts/14_external_marker_alignment.py" \
  --project-root "$ROOT"

"$PY" "$ROOT/preprint/automation/scripts/15_external_validation_summary.py" \
  --project-root "$ROOT" \
  2>&1 | tee "$ROOT/preprint/logs/auto/15_external_validation.log"

echo
echo "PHASE 5 DONE"
echo "Summary: $EXT/external_validation_summary.md"
