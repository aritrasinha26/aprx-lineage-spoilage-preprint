# Phase 7: integrated statistics and figures

This phase does not download or recompute genomes or trees.

It uses the existing pilot and external results to:
1. formally test the association between the proposed SVMSY marker and
   AprX/AprA reference-proximity class;
2. test broad genomic-context differences between the reference-proximity groups;
3. generate annotated pilot and external phylogeny figures;
4. generate marker and genomic-context summary figures;
5. write an integrated analysis checkpoint for manuscript drafting.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase7.sh
```

Main outputs:

- `preprint/results/auto/phase7_external_statistics.tsv`
- `preprint/results/auto/integrated_analysis_checkpoint.md`
- `preprint/figures/final/Fig_core_tree_marker_phenotype_operon.png`
- `preprint/figures/final/Fig_external_serralysin_tree_marker.png`
- `preprint/figures/final/Fig_external_marker_by_reference_class.png`
- `preprint/figures/final/Fig_external_genomic_context_summary.png`
