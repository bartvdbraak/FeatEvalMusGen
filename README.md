# FeatEvalMusGen
Our custom scripts for Dataset Preprocessing, recursive Feature Extraction and Data Plotting

# Data Preprocessing 

To preprocess your own dataset for [SampleRNN PyTorch](https://github.com/deepsound-project/samplernn-pytorch "Github Repository of SampleRNN PyTorch"), you can use our combine-and-split.sh bash script. Include this script in `samplern-pytorch/datasets`. Create a folder `preprocess` for your dataset folder(s). For the purposes of showing an example, we will be using a dataset called `piano` with three .WAV files to preprocess.

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


