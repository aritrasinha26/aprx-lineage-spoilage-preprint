# AprX preprint automation: Phase 4

This is a short diagnostic phase.

Why it is needed:
the first PGLS run produced implausibly huge standard errors for an outcome that
only ranges from 0 to 4. Before those values are used in a manuscript, this phase:

1. diagnoses the phylogenetic covariance matrix,
2. normalizes it to a correlation matrix,
3. estimates a Pagel-like lambda by maximum likelihood,
4. refits the main phylogenetic GLS sensitivity analyses,
5. counts the minimum number of independent evolutionary changes for the key traits.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase4.sh
```

This phase should run in seconds to a few minutes because the expensive core tree
has already been built.
