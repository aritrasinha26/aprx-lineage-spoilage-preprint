# AprX preprint automation: Phase 3

This phase builds a bacterial core-marker phylogeny from the 87 genomes and then
uses that tree for phylogenetically controlled sensitivity analyses.

The marker profiles come from the published UBCG marker set distributed in the
bcgTree repository. This pipeline uses the marker HMMs but keeps your existing
MAFFT + IQ-TREE workflow rather than requiring the original UBCG tree builder.

## Install / fetch the marker set

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/setup_phase3.sh
```

## Run

```bash
bash preprint/automation/run_phase3.sh
```

Main outputs:

- `preprint/results/auto/core_phylogeny/core_marker_QC.tsv`
- `preprint/results/auto/core_phylogeny/UBCG_core_concatenated.faa`
- `preprint/results/auto/core_phylogeny/UBCG_core_tree.treefile`
- `preprint/results/auto/phylogenetically_controlled_tests.tsv`
- `preprint/results/auto/core_tree_metadata.tsv`
- `preprint/results/auto/phase3_phylogeny_summary.md`

Important interpretation:
The 0–4 Maier phenotype is ordinal. PGLS here is a phylogenetic sensitivity
analysis that treats it as approximately continuous. It should not be the only
model used in a manuscript.
