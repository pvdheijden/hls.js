#! /bin/bash

set -x
set -e

npm run build

PLAYER="demo"

pushd $PLAYER

rm -rf dist && mkdir dist
cp -r ../dist . 
sed -i 's|../dist|dist|' index.html

rm -rf tests && mkdir tests
cp -r ../tests/test-streams.js ./tests/test-streams.js 
sed -i 's|../tests|tests|' main.js

popd

tar --directory=. -cf hls-js-demo-player.tar $PLAYER
gzip hls-js-demo-player.tar