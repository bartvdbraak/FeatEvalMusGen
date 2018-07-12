#!/usr/bin/env bash
set -x

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <location streaming_extractor_music> <audio-files folder>"
    echo "Example: $0 ~/Desktop/streaming_extractor_music ~/Desktop/samplernn-pytorch/datasets/preprocess/piano"
    exit
fi

extractorcmd=$1
folder_path=$2

cd "${folder_path}"
mkdir json

for i in *.mp3 *.wav
do
  $extractorcmd "$i" "json/$i.json"
done
