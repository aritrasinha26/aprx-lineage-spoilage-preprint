# Phase 8: homology-based aprX-lipA2 operon reconstruction

This phase fixes the annotation-string limitation of the earlier genomic-context scan.

Maier et al. screened the aprX-lipA2 system using nine reference proteins with
GenBank accessions AGL85002.1–AGL85010.1. This phase retrieves those same protein
sequences and screens both:

- the 87-genome phenotype/pilot cohort;
- the 433-genome external type-material cohort.

For every genome it records the best BLASTp hit to each reference, alignment
statistics, reciprocal best reference, GFF position, whether the homologue occurs
anywhere in the genome, and whether it lies within 50 kb of the serralysin locus.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_phase8.sh
```

Internet is needed only for the initial retrieval of the nine NCBI protein sequences.
The existing genome downloads are reused.

The accessions map to the reference locus in Pseudomonas protegens CHA0. The
AGL85004.1/AGL85003.1 proteins were historically annotated PspA/PspB and correspond
to the putative autotransporter components later discussed as PrtA/PrtB-like proteins.
The AGL85010.1 serralysin is annotated AprA in CHA0 but has been used in the AprX
operon literature as the serralysin reference sequence. The pipeline therefore uses
descriptive labels `prtA_like`, `prtB_like`, and `aprX_like_serralysin` rather than
silently changing the source annotation.
