# Local preview of the website, with the same gem version the workflow
# builds with (see .github/workflows/pages.yml). From the repo root:
#
#   git clone https://github.com/Proven-Commons/mission _mission
#   scripts/assemble.sh _mission _build
#   bundle install
#   bundle exec jekyll serve --source _build
#
# Then open http://localhost:4000/site/
source "https://rubygems.org"

# github-pages 232 does not install on Ruby 4. GitHub builds with Ruby 3.3.
ruby ">= 3.1", "< 4.0"

gem "github-pages", "232", group: :jekyll_plugins
