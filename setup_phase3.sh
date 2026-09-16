#!/usr/bin/env bash
set -euo pipefail

ROOT="${APRX_PROJECT:-$(pwd)}"

echo "Installing small system dependencies..."
sudo apt update
sudo apt install -y hmmer git

mkdir -p "$ROOT/preprint/tools"

if [ ! -d "$ROOT/preprint/tools/bcgTree/.git" ]; then
    echo "Downloading bcgTree to obtain the published UBCG HMM marker set..."
    git clone --depth 1 https://github.com/molbiodiv/bcgTree.git \
      "$ROOT/preprint/tools/bcgTree"
else
    echo "bcgTree already present."
fi

HMM="$ROOT/preprint/tools/bcgTree/data/ubcg.hmm"
if [ ! -s "$HMM" ]; then
    echo "ERROR: UBCG HMM file not found at $HMM"
    exit 1
fi

echo
echo "Found marker HMM database:"
ls -lh "$HMM"

echo
echo "Checking required executables..."
command -v hmmsearch
command -v mafft

if command -v iqtree2 >/dev/null 2>&1; then
    echo "IQ-TREE: $(command -v iqtree2)"
elif command -v iqtree >/dev/null 2>&1; then
    echo "IQ-TREE: $(command -v iqtree)"
else
    echo "ERROR: iqtree2/iqtree not found."
    exit 1
fi

echo "Phase 3 setup complete."
