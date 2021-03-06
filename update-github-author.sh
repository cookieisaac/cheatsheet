#!/bin/bash
# Usage: update-author.py repo-name

REPO=$1
USER=cookieisaac

git clone --bare https://github.com/$USER/$REPO.git
echo "$REPO.git cloned from https://github.com/$USER/$REPO.git"
cd $REPO.git

git filter-branch --env-filter '
OLD_EMAIL="old@email.com"
CORRECT_NAME="Ike Ma"
CORRECT_EMAIL="new@email.com"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'
cd ..
rm -rf $REPO.git
