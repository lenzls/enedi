#! /bin/sh
# inspired by https://stackoverflow.com/a/48591941/376172

npm run build
git stash
git branch --delete --force gh-pages
git checkout --orphan gh-pages
git add --force dist
git commit -m "Rebuild GitHub pages"
git filter-branch -f --prune-empty --subdirectory-filter dist
git push --force origin gh-pages
git co master
echo "Deploy finished. Please visit https://lenzls.github.io/pixUr/"