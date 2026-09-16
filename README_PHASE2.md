# AprX preprint automation: Phase 2

Copy/unzip this bundle into the root of `~/aprx_project`. It adds three scripts to the existing pipeline.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase2.sh
```

What it adds:

1. Lineage-aware analysis of SVMSY/SLMSY/SIMSY and the day-7 phenotype.
2. A sequence-wide site scan restricted to positions that actually vary within species, using species-centred phenotype and within-species permutation.
3. Automatic OCR extraction of the published aprX-lipA2 operon type numbers from Maier Figure 2.
4. Operon-type versus phenotype summaries and a plot.

QC:
`preprint/figures/auto/Figure2_operon_type_QC.png` must be inspected once because the operon-type values are image-derived.
