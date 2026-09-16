# AprX preprint code bundle

This is a GitHub-ready local bundle for the AprX/serralysin preprint workflow developed during the project.
It assembles the automation scripts and later patch files into one repository-style structure.

## What is included

- The initial pilot-cohort automation pipeline
- Phase 2 lineage-aware updates
- Phase 3 core-genome phylogeny scripts
- Phase 4 phylogenetic diagnostics
- Phase 5 external type-genome validation scripts
- Phase 6 external phylogeny and genomic-context scripts
- Phase 7 integrated figures and checkpoint scripts
- Phase 8 homology-based operon reconstruction scripts
- Phase 9 publication-figure and final architecture scripts
- Operon OCR patch and corrected operon-analysis patch

## Important note

This bundle contains code and workflow documents. It does not include the full raw genome datasets, all intermediate outputs, or the full user-side project directory.
Before pushing to GitHub, review paths, add your final data-availability links, and choose a license.

## Suggested repository structure

- `preprint/automation/requirements.txt` for Python dependencies
- `preprint/automation/run_preprint_pipeline.sh` and `run_phase*.sh` for staged execution
- `preprint/automation/scripts/` for analysis scripts
- top-level `README.md` for project overview

## Suggested next steps before publishing

1. Add a concise project abstract.
2. Add a LICENSE file of your choice.
3. Add links to archived data and the preprint PDF.
4. Add a small example dataset or a description of expected input files.
5. Check every script path against your local repository.

## Minimal run order

Run the main pilot workflow first, then phase 2 through phase 9, and finally the corrected operon workflow if you want the final corrected architecture-based inference.
