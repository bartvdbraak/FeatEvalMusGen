#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 directory"
    exit
fi

dataset_path=$1

cd "${dataset_path}"
mkdir json

for i in *.mp3 *.wav
do
  essentia_streaming_extractor_music "$i" "json/$i.json"
done
