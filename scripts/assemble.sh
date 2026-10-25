#!/usr/bin/env bash
# Puts this repo's templates and the mission repo's documents together in one
# folder, ready for Jekyll. The documents stay in the mission repo; this repo
# only lays them out.
#
# Usage: scripts/assemble.sh <mission-checkout> <out-dir>
# Use _build (ignored by git) or a folder outside this repo as <out-dir>.
set -euo pipefail

mission=$1
out=$2
here=$(cd "$(dirname "$0")/.." && pwd)

rm -rf "$out"
mkdir -p "$out"

# The templates: everything here except this repo's own README, its tooling,
# and local build folders.
tar -C "$here" -cf - \
  --exclude=./.git --exclude=./.github --exclude=./scripts --exclude=./README.md \
  --exclude=./_build --exclude=./_mission --exclude=./_site --exclude=./.jekyll-cache \
  --exclude=./vendor --exclude=./.bundle \
  . | tar -C "$out" -xf -

# The documents: every Markdown file in the mission repo, at the same path.
git -C "$mission" ls-files -z -- '*.md' | tar -C "$mission" -cf - --null -T - | tar -C "$out" -xf -
