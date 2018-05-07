#!/usr/bin/env bash

function build {
  rm -rf _site/
  jekyll build --config _config.yaml,$1
}


function upload {
  rsync -vrz \
    -e "ssh -p 7822 -i ~/.ssh/sigcse-key" _site/ \
    sigcse@sigcse.hosting.acm.org:/home/sigcse/www/$1
}

function linkcheck {
  ./_tools/linkcheck.bash $1
}

# First, remove the old site.
if [ -d _site ];
then
  echo "REMOVING THE OLD SITE."
  rm -rf _site/
fi

if [ "$1" == "live" ] || [ "$1" == "all" ];
then
  build _config_live.yaml
  linkcheck live
  upload sigcse2018/
fi

# If they want to upload the staging site, lets do that.
if [ "$1" == "staging" ] || [ "$1" == "all" ];
then
  build _config_staging.yaml
  linkcheck staging
  upload sigcse2018/.staging
fi
