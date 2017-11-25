## Manual

Morpheur is a synthetizer based on Cabbage2 and Csound. It was developed for creating pad and ambiant sounds but hoping it would be versatile enough to be used as a main synthesizer.
The name comes from its ability to morph sounds. For that it moves the audio signal generated with one waveform to another one.

## How to use

## Interface description: 
### Main menu
The menu interface is located on the left panel.
The "Oscillator" button  gives access to the oscillators panel. Whithin this panel, you will be able to control the oscillators behaviour, with or without morphing, FM modulation, Suboscillators
The "Envelope" button gives access to the audio envelope (i.e ADSR)
The "Filter" button gives access to the filters which can be applied to the audio signal
The "Effect" button gives access to the effects : Reverb, Echo, Ring Modulation, Flanger, Chorus, Binaural effect and sync to the host when Morpheur is used as a VST
The "Save" button will save the preset and add it automaticaly at the end of the "Morpheur15.snaps" file. This file is an xml file which can be edited by hand allowing you to rename your presets.
The "Panic" button will stop any playing sound for a while
The Combobox will load presets 

### Virtual keyboard
This virtual keyboard can be used to play some notes for testing without any real keyboard

### "Oscillator" panel
First, you need to load waveforms into the 3 tables which will be used by the oscillators. To open a waveform file, click on the button "open file", located on the top of each of the graph.
The files must be ".wav" files. This has been tested with 600 points waveshapes ( see README.md). When a file is loaded, it should be displayer in the graph below the button.

The oscillator A and B are used to generate the sound. When morphing is applied, the sound will move gradually from sound A to sound B. 
The oscillator C is only used for frequency modulation and for ring modulation. It is advised to use a "classical" wavshape for this oscillator, i.e. sine, triangle or saw, but of course any shape is possible.


The "SubOsc" knob determines wether you want or not a suboscillator to be applied to the sound. The values can be 0 : no suboscillator, -1 : One octave, -2 : Two octaves below. The amount of lower tune can be mixed by the "Mix" knob. 

The "Morph Freq" knob sets the frequency of the morphing. By default it is set to 0.5, meaning that the sound will move from sound A to sound B in 2 seconds.
When set to 0, the morphing is cancelled, and Morpheur is playing both osc A and osc B audio together. This allows, when using twice a waveshape in Osc A and Osc B, to play simple synth.

The selector "Morph Shape" is selecting the shape of the morphing : Sine, lines or exponential. The "No cycle" allows morphing from sound A to sound B linearly and remains at sound B until the key is released.
IMPORTANT : In that case, the "Morph Freq" knob is determining the duration of the morphing (and not the frequency) 

Freq Mod and Mod Factor determine respectively, the frequency and the amount of modulator OScillator C into the carrier (morphed audio signal from Osc A to Osc B). 
Setting "Freq Mod" knob to 0 (default) cancels the FM.  

### "Envelope" panel



### "Filter" panel


### "Effects" panel

