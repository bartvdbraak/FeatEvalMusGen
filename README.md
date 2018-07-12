# FeatEvalMusGen
Our custom scripts for Dataset Preprocessing and recursive Feature Extraction.

# Data Preprocessing 

To preprocess your own dataset for [SampleRNN PyTorch](https://github.com/deepsound-project/samplernn-pytorch "Github Repository of SampleRNN PyTorch"), you can use our `combine-and-split.sh` bash script. Move this this script into `samplern-pytorch/datasets`. Create a folder `preprocess` for your dataset folder(s). For the purposes of showing an example, we will be using a dataset called `piano` with three .WAV files to preprocess.

![This is how the folder would look like after this step](../assets/folder-example-before.png?raw=true "This is how the folder would look like before executing.")

Open up a terminal and navigate to the `datasets` folder, where our script now resides.
```
$ cd Desktop/samplernn-pytorch/datasets/
```
Make sure we are able execute our bash script, by setting the correct permissions.
```
$ sudo chmod +x combine-split-audio.sh 
```
Now we can start preprocessing our dataset by executing as follows. We will be using an audio chunk size of 8 second for the example. 
The script can have the following parameters: `./combine-split-audio.sh <chunk size in seconds> <preprocess path> <(optional) channels:1> <(optional) audio bitrate:16k> <(optional) audio sampling rate:16000>`
```
$ ./combine-split-audio.sh 8 piano
```
When this script has executed correctly, a folder will be created in the `datasets` folder, containing all audio chunks. In this case we used the default parameters (1 channel, 16k bitrate, 16k sampling rate).
![This is how the folder would look like after this step](../assets/folder-example-after.png?raw=true "This is how the folder would look like after.")

# Feature Extraction 

To extract musical features from your audio files, we created a custom script that uses the [`essentia_streaming_extractor_music`](http://essentia.upf.edu/documentation/streaming_extractor_music.html) called `generate-json.sh` to compute JSON-files for each audio file found in a given folder. Move this bash script onto your desktop. We will be using the dataset called `piano` with three .WAV files to extract features from. 

Now, we need Essentias `essentia_streaming_extractor_music`. We can get this as a binary from the bottom of [this page](http://acousticbrainz.org/download). Download one suitable for your Operating System (Windows, Linux or Mac). We downloaded [`mac 64 bit extractor static binary for 10.7 and higher`](http://acousticbrainz.org/static/download/essentia-extractor-v2.1_beta2-2-gbb40004-osx.tar.gz) for this example. Unzip the compressed folder `essentia-extractor-v2.1_beta2-2-gbb40004-osx.tar` and move the binary file `streaming_extractor_music` to your desktop.

Open up a terminal and navigate to the Desktop.

```
$ cd ~/Desktop/
```

Make sure we are able execute our bash script, by setting the correct permissions.
```
$ sudo chmod +x generatejson.sh
```
Now we can start the feature extraction of our dataset by executing as follows. We will be using the audio files in the folder `~/Desktop/samplernn-pytorch/datasets/preprocess/piano`.
The script can have the following parameters: `./generatejson.sh <location streaming_extractor_music> <audio-files folder>`
```
$ ./generatejson.sh ~/Desktop/streaming_extractor_music ~/Desktop/samplernn-pytorch/datasets/preprocess/piano
```
When this script has executed correctly, a folder will be created in folder we specified called `json`, containing all files in JSON-format with all the features, ordered by keys.
![This is how the folder would look like after this step](../assets/folder-example-json.png?raw=true "This is how the folder would look like after.")

