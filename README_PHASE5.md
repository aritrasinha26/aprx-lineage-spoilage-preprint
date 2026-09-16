# AprX preprint automation: Phase 5 external validation

This phase creates an independent taxonomic validation cohort from the current
NCBI RefSeq catalogue.

It queries annotated Pseudomonas assemblies flagged as type material, excludes
atypical/MAG assemblies, selects one RefSeq assembly per organism name, downloads
protein and GFF3 files, identifies full-length AprX-like serralysin candidates,
aligns them with the curated AprX/AprA references, and measures the five-residue
region corresponding to CY091 SVMSY.

This is an external **taxonomic** validation cohort. It does not provide an
independent spoilage phenotype dataset.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase5.sh
```

Internet access is required for the NCBI query/download. Depending on the number
of current type-material assemblies and connection speed, the download may take
several minutes.

Main outputs:

- `preprint/external_validation/pseudomonas_type_refseq_selected.tsv`
- `preprint/external_validation/external_type_aprx_scan.tsv`
- `preprint/external_validation/external_type_aprx_marker_table.tsv`
- `preprint/external_validation/external_marker_pattern_summary.tsv`
- `preprint/external_validation/external_validation_summary.md`
