# site

An alternative build of the Proven Commons website, published at https://proven-commons.github.io/site/ to compare with the site in the [mission](https://github.com/Proven-Commons/mission) repo.

This repo holds only the templates. The text comes from the mission repo. At build time, `.github/workflows/pages.yml` fetches every Markdown file there and lays it out, so the site shows the current documents and never a copy:

- The home page quotes the mission README (the opening and First projects) and the founding brief (the factory, the verified bar, the first wave, and the academy). Only headings and a few short lines are written here, in `index.html`.
- The brief is at `/brief/`. Every other Markdown file in the mission repo becomes a page, such as the review records. A folder's README.md becomes that folder's page.
- If a quoted section is renamed or changes shape, that part of the page shows a link to the source instead of guessing, and the build fails and names it. The build also fails on a broken link between pages. Nothing is published from a failed build.
- While the tar audit (mission#1) is open, the site shows the documents on its branch, which carry the audited status of the tar pilot. Once it is closed, the site shows mission's main branch.

The workflow runs on every push here, every hour (to pick up new documents), and on demand from the Actions tab.

## Preview

Install Ruby 3.3 (the github-pages gem does not install on Ruby 4). Then, from the repo root:

```
git clone https://github.com/Proven-Commons/mission _mission
scripts/assemble.sh _mission _build
bundle install
bundle exec jekyll serve --source _build
```

Open http://localhost:4000/site/.
