# Phase 5 marker-mapping patch

The original Phase 5 script assumed that CY091 itself contained the exact sequence
`SVMSY`. That assumption was wrong.

The pilot alignment had already shown that the marker region varies among AprX-like
sequences. This patch instead finds an exact-SVMSY sequence from the validated pilot
candidate set, adds it to the external alignment as a dedicated marker anchor, and
uses the homologous alignment columns to read the external sequences.

After extracting into `~/aprx_project`, do NOT repeat the 433-genome download or BLAST scan.

Run only:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate

python3 preprint/automation/scripts/14_external_marker_alignment.py \
  --project-root ~/aprx_project

python3 preprint/automation/scripts/15_external_validation_summary.py \
  --project-root ~/aprx_project
```

Then show:

```bash
cat preprint/external_validation/external_validation_summary.md

column -t -s $'\t' \
  preprint/external_validation/external_marker_pattern_summary.tsv
```
