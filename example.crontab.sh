#!/usr/bin/env bash

echo "coucou" >> /dev/stdout
echo "$(whoami)@$HOSTNAME $(TZ="Europe/Paris" date +'%Y-%m-%d %H:%M %Z %A') | $DIR" >> /tmp/$(whoami)@$HOSTNAME.tools.gitpush.log

# Full path of this script
THIS=`readlink -f "${BASH_SOURCE[0]}"`
# This directory path
DIR=`dirname "${THIS}"`
# install and update crontab atv_cron
commandsearch="$DIR"
command="cd $DIR ; ./$(basename $THIS)"
job="*/1 * * * * $command"
cat <(fgrep -i -v "$commandsearch" <(crontab -l)) <(echo "$job") | crontab -

