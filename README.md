# Mental-Pattern-Recognition

<p align="center">
<img height="350" src="Files/Application%20Example.gif" alt="color picker" />
<img src="Files/mental_control_scheme.png" height=350>
</p>

A Framework for classifying mental patterns based on Signal Processing and Machine Learning techniques.
Specifically, we pre-process the electroencephalogram (EEG) signals via a sequence of filterings over both time and space for different EEG channels. Then, we generate the spectral components of the brain using Power Spectrum Density (PSD) and we build a feature vector projecting the frequency information by Principal Component Analysis (PCA). Those feature vectors are used to train a Multi-Layer Perceptron (MLP) Neural Network to classify the mental patterns and control an user interface scheme.

<div align="center">

| If the user imagines... | Then, the arrow... |
|-------------------------|--------------------|
| Left arm moving         | Turns left         |
| Right leg moving        | Turns right        |
| None of the above       | Moves forward      |

</div>
