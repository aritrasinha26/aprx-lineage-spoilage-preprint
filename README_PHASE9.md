# Phase 9: final operon architecture, validation, and publication figures

This is intended to be the last substantial computational phase.

It:
1. restricts the operon analysis to the same serralysin-positive cohorts used in the integrated study:
   - 76 pilot serralysin candidates;
   - 231 external Phase-5 serralysin candidates.
2. reconstructs relative gene order around the serralysin using high-confidence Phase-8 homology calls;
3. inserts a separator when adjacent detected genes are >10 kb apart;
4. compares reconstructed pilot architectures with the published OCR-derived operon types, including targeted type 1 and type 8 checks;
5. regenerates publication figures with fixed categorical marker colors and non-ordinal operon colors;
6. writes a final analysis-freeze checkpoint.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase9.sh
```

Outputs:
- `preprint/results/auto/operon_homology/operon_architectures_final.tsv`
- `preprint/results/auto/operon_homology/published_type_vs_reconstructed_architecture.tsv`
- `preprint/results/auto/operon_homology/type1_type8_targeted_validation.tsv`
- `preprint/figures/publication/*.png`
- `preprint/figures/publication/*.svg`
- `preprint/results/auto/FINAL_ANALYSIS_FREEZE.md`

Important:
The 10 kb separator is an operational visualization threshold, not a biological definition of an operon.
The homology calls remain automated high-confidence assignments rather than manually curated orthology calls.
