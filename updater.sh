#!/bin/bash

subsubversion=$(cat /var/www/html/.subsubversion);

cd /var/www/html;

git add *
git commit -m "v1.1.$subsubversion"

if ! [ "$(git push 2>&1)" = "Everything up-to-date" ]; then
    ((subsubversion++))
    echo $subsubversion > /var/www/html/.subsubversion
    ./tweet.sh $subsubversion
fi
