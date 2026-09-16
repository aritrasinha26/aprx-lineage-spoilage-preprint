# Operon correction after targeted type-8 QC

The type-8 diagnostic showed two things:

1. Most P. lundensis strains contain a local serralysin/lipA2 region but their
   strong PrtA-like and PrtB-like homologues are on a different contig, consistent
   with a distal PrtAB component.
2. Their short AprI/Inh-family proteins were visible and annotated but failed the
   earlier global E-value threshold used for all proteins.
3. Two OCR-derived "type 8" assignments were biologically inconsistent:
   one P. lactis strain carried local PrtA/PrtB, while the P. veronii strain lacked
   strong PrtA/PrtB homologues. This indicates row-level OCR assignment error.

Therefore this correction stops using OCR-derived individual operon type as the
primary inferential variable. It reconstructs architecture directly from homology
and genomic position.

Run:

```bash
cd ~/aprx_project
source preprint/.venv/bin/activate
bash preprint/automation/run_operon_correction.sh
```

Then show:

```bash
cat preprint/results/auto/CORRECTED_OPERON_ANALYSIS.md
```
