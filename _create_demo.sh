#! /bin/bash

set -x
set -e

npm run build

PLAYER="demo"

pushd $PLAYER

rm -rf dist && mkdir dist
cp -r ../dist . 

popd

tar --directory=. -cf hls-js-demo-player.tar $PLAYER
gzip hls-js-demo-player.tar