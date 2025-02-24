#!/bin/sh

rm -f .git/hooks/commit-msg .git/hooks/pre-push

git config commit.template .github/commit-template.txt

cp .github/hooks/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg

cp .github/hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push

echo "Git hooks and commit template installed!"
