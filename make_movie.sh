#!/bin/sh
declare -i i=1
for f in images/*.jpg
do
  mv $f images/`printf %03d $i`.jpg
  i=i+1
done
ffmpeg -i images/%03d.jpg -vcodec mjpeg -sameq out.avi
