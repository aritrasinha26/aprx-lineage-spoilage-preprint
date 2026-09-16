# Operon OCR patch

This replaces the Phase 2 operon-type OCR script.

The original script cropped the wrong x-coordinate region of Maier Figure 2.
The printed type numbers are around x = 855–875 in the 974 px-wide figure.

After extracting this ZIP into `~/aprx_project`, run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate

python3 preprint/automation/scripts/07_extract_figure2_operon_types.py \
  --project-root ~/aprx_project

python3 preprint/automation/scripts/08_operon_type_analysis.py \
  --project-root ~/aprx_project
```

Then inspect:

```text
preprint/figures/auto/Figure2_operon_type_QC.png
preprint/figures/auto/Figure2_operon_type_column_processed.png
```
