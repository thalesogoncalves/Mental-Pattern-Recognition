# Mental-Pattern-Recognition

[//]: # ![](https://github.com/thalesogoncalves/Mental-Pattern-Recognition/blob/main/Files/Application%20Example.gif)

[comment]: <> (This is a comment, it will not be included)

1. Adding a GIF from an external URL to markdown.

<img width="400" height="250" alt="color picker" src="https://github.com/thalesogoncalves/Mental-Pattern-Recognition/blob/main/Files/Application%20Example.gif" />

2. Adding a local GIF file to markdown.

<img width="400" height="250" src="Files/Application%20Example.gif" alt="color picker" />


A Framework for classifying mental patterns based on Signal Processing and Machine Learning techniques.
Specifically, we pre-process the electroencephalogram (EEG) signals via a sequence of filterings over both time and space for different EEG channels. Then, we generate the spectral components of the brain using Power Spectrum Density (PSD) and we build a feature vector projecting the frequency information by Principal Component Analysis (PCA). Those feature vectors are used to train a Multi-Layer Perceptron (MLP) Neural Network to classify the mental patterns and control an user interface scheme.

<p align="center">
<img src="Files/mental_control_scheme.png" width=500>
</p>
