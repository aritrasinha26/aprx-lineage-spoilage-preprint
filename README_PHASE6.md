# AprX preprint automation: Phase 6

Phase 6 does not download new genomes.

It uses the 231 external full-length serralysin candidates already generated in
Phase 5 and adds:

1. an external serralysin protein phylogeny with the curated AprX and P. aeruginosa
   AprA references;
2. nearest-reference phylogenetic distances for every external candidate;
3. reconstruction of each candidate's ±20 kb genomic neighborhood from the
   downloaded GFF3 annotation;
4. integration of marker pattern, phylogenetic proximity and secretion/operon
   context.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase6.sh
```

The IQ-TREE step is the slowest part. For ~237 proteins of ~500 aa it is usually
far smaller than the 87-genome core phylogeny.

Main output:

```bash
cat preprint/external_validation/phase6_external_summary.md
```

Important: `AprX-reference-proximal` is a descriptive reference-proximity class,
not a definitive gene-name assignment.
