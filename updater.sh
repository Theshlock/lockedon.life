#!/bin/bash

subsubversion=$(cat /home/lockton_sam/.subsubversion);

cd /var/www/html;

git add *
git commit -m "auto backup v1.1.$subsubversion"

if ! [ "$(git push 2>&1)" = "Everything up-to-date" ]; then
    ((subsubversion++))
    echo $subsubversion > /home/lockton_sam/.subsubversion
    ./tweetcommand.sh $subsubversion
fi
