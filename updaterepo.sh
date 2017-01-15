#!/bin/bash -x
#
# update.sh
# Copyright (C) 2016 weirdgiraffe <giraffe@cyberzoo.xyz>
#
# Distributed under terms of the MIT license.
#

rm -rf tmp/plugin.video.giraffe.seasonvar
git clone --depth=1 git@github.com:weirdgiraffe/plugin.video.giraffe.seasonvar.git tmp/plugin.video.giraffe.seasonvar
cd tmp/plugin.video.giraffe.seasonvar
git fetch --tags
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
echo checking out ${latestTag}
cp addon.xml ../../addons/plugin.video.giraffe.seasonvar/
cp changelog.txt ../../addons/plugin.video.giraffe.seasonvar/
cp fanart.jpg ../../addons/plugin.video.giraffe.seasonvar/
cp icon.png ../../addons/plugin.video.giraffe.seasonvar/
git archive \
  --format=zip \
  --prefix=plugin.video.giraffe.seasonvar/ \
  --output ../../addons/plugin.video.giraffe.seasonvar/plugin.video.giraffe.seasonvar-${latestTag}.zip \
  HEAD
cd ../../addons/
python genaddons.py
echo "done"



