
<Cabbage>

#define PROPERTY_SLIDER_OSCA colour(3, 1, 108, 255) colour(3, 1, 108, 255) fontcolour("white") outlinecolour(39, 6, 142, 255) textcolour(6, 1, 65, 255) trackercolour(255, 40, 53, 255)
#define PROPERTY_CHKBOX_OSCA colour:1(255, 40, 53, 255) colour:1(255, 40, 53, 255) fontcolour:0(0, 0, 0, 255) fontcolour:1(0, 0, 0, 255)
#define PROPERTY_BUT_OSCA colour:0(57, 127, 243, 255) colour:0(57, 127, 243, 255) colour:1(34, 49, 190, 255) fontcolour("white")
#define PROPERTY_SLIDER_OSCA2 colour(3, 1, 108, 255) colour(3, 1, 108, 255) fontcolour("black") outlinecolour(39, 6, 142, 255) textcolour(6, 1, 65, 255) trackercolour(255, 40, 53, 255)


form caption("Morpheur15") size(840, 340), colour(58, 110, 210), pluginID("Mor1")

keyboard bounds(1,281, 839, 58) mouseoeverkeycolour(255, 255, 0, 128)
;-----------------------------------
;- Region: Menu GUI
;----------------------------------
groupbox bounds(0, 0, 140, 280) identchannel("GB_Menu") text("Menu") colour(178, 186, 230, 255) fontcolour:0(0, 0, 0, 255) outlinecolour(9, 16, 91, 255)
  {
  button bounds(10, 30, 120, 30) channel("But_Call_MainOsc") value(1) text("Oscillator") radiogroup(1) $PROPERTY_BUT_OSCA
  button bounds(10, 70, 120, 30) channel("But_Call_ADSR")  text("Envelope") radiogroup(1) $PROPERTY_BUT_OSCA
  button bounds(10, 110, 120, 30) channel("But_Call_Filters")  text("Filters") radiogroup(1) $PROPERTY_BUT_OSCA
  button bounds(10, 150, 120, 30) channel("But_Call_Effects")  text("Effects") radiogroup(1) $PROPERTY_BUT_OSCA
  filebutton bounds(10, 200, 55, 30) channel("Save_filebutton") value(0) text("Save", "Save") mode("snapshot") $PROPERTY_BUT_OSCA
  combobox bounds(10, 235, 120, 30) channel("PresetCombo") identchannel("R_PresetCombo") value(0) populate("*.snaps")
  button bounds(70, 190, 55, 40) channel("But_Call_Panic")  text("PANIC") latched(0) $PROPERTY_BUT_OSCA
}


;-----------------------------------
;- Region: Main Oscillator GUI
;----------------------------------
groupbox bounds(140, 0, 700, 280) identchannel("GB_MainOSc") text("Main Oscilators") visible(1) colour(178, 186, 230, 255) fontcolour:0(0, 0, 0, 255) outlinecolour(9, 16, 91, 255)
  {
  filebutton bounds(10, 20, 80, 20) channel("filenameOscA") value(0) text("Open File", "Open File") populate("", "") shape("ellipse")
  soundfiler bounds(10, 43, 230, 100) channel("beg", "len") identchannel("filerOscA") colour(50, 214, 214, 255) fontcolour:0(160, 160, 160, 255) fontcolour:1(160, 160, 160, 255) tablenumber(901) zoom(-1)
  filebutton bounds(10, 150, 80, 20) channel("filenameOscB") value(0) text("Open File", "Open File") populate("", "") shape("ellipse")
  soundfiler bounds(10, 172, 230, 100) channel("beg", "len") identchannel("filerOscB") colour(50, 214, 214, 255) fontcolour:0(160, 160, 160, 255) fontcolour:1(160, 160, 160, 255) tablenumber(902) zoom(-1)
  ;UNCOMMENT following line to show CSound output for debbuging
 ; csoundoutput bounds(10, 43, 230, 100)    ;

  ;-----------------------------------
  ;- Region:    ___1-SubOscilOscillator GUI
  ;  SubOscillator
  rslider bounds(240, 30, 90, 100) channel("Slider_SubOsc_Octave") range(-2, 0, 0, 1, 1) text("SubOsc")  max(0) min(-2) increment(1) valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  rslider bounds(330, 30, 90, 100) channel("Slider_SubOsc_Mix") range(0, 1, 0, 1, .01) text("Mix") value(0.5) max(1) min(0) increment(.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region:    ___2-Morphing Frequence
  encoder bounds(250, 150, 100, 120) channel("Enc_Freq_Morph") value(0.5) text("Morph Freq")   max(5) min(0.000) increment(0.001) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  checkbox bounds(350, 190, 120, 12) channel("ChkBox_Sin") value(1) text("Sine curve")   radiogroup(2) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(350, 210, 120, 12) channel("ChkBox_Seg")   text("Line segments")     radiogroup(2) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(350, 230, 120, 12) channel("ChkBox_Exp")   text("Exponential seg")     radiogroup(2) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(350, 250, 120, 12) channel("ChkBox_Line")   text("No Cycle")     radiogroup(2) shape("circle") $PROPERTY_CHKBOX_OSCA

  ;-----------------------------------
  ;- Region:    ___3-FM Oscillator
  filebutton bounds(460, 20, 80, 20) channel("filenameOscC") value(0) text("Open File", "Open File") populate("", "") shape("ellipse")
  soundfiler bounds(460, 43, 230, 100) channel("beg", "len") identchannel("filerOscC") colour(50, 214, 214, 255) fontcolour:0(160, 160, 160, 255) fontcolour:1(160, 160, 160, 255) tablenumber(903) zoom(-1)
  encoder bounds(480, 150, 100, 120) channel("Enc_FM_Freq_Mod") value(0) text("Freq Mod")  max(5) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(580, 150, 100, 120) channel("Enc_FM_Amp_Mod") value(1) text("Mod factor")  max(25) min(0.1) increment(0.1) valuetextbox(1) $PROPERTY_SLIDER_OSCA

  label bounds(100, 22, 100, 16)  text("Oscillator A") fontcolour:0(0, 0, 0, 255)
  label bounds(100, 152, 100, 16) text("Oscillator B") fontcolour:0(0, 0, 0, 255)
  label bounds(550, 22, 100, 16)  text("Oscillator FM") fontcolour:0(0, 0, 0, 255)
  label bounds(340, 165, 100, 14) text("Morph. shape") fontcolour:0(0, 0, 0, 255)
}


;-----------------------------------
;- Region: Volume Enveloppe GUI
;----------------------------------
groupbox bounds(140, 0, 700, 280) identchannel("GB_ADSR") text("Envelope") visible(0) colour(178, 186, 230, 255) fontcolour:0(0, 0, 0, 255) outlinecolour(9, 16, 91, 255)
  {
  encoder bounds(0, 20, 100, 120) channel("Enc_ADSR_Attack") identchannel("R_Enc_ADSR_Attack") value(0.01) text("Attack")  max(2) min(0.001) increment(0.001) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(100, 20, 100, 120) channel("Enc_ADSR_Decay") identchannel("R_Enc_ADSR_Decay")  value(0.01) text("Decay")  max(2) min(0.001) increment(0.001) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(200, 20, 100, 120) channel("Enc_ADSR_Sustain") identchannel("R_Enc_ADSR_Sustain") value(0.85) text("Sustain")  max(1) min(0.0) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(300, 20, 100, 120) channel("Enc_ADSR_Release") identchannel("R_Enc_ADSR_Release") value(0.01) text("Release")  max(3) min(0.00) increment(0.001) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  checkbox bounds(400, 60, 120, 12) channel("ChkBox_ADSR_AD")  text("AD")   radiogroup(3) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(400, 80, 120, 12) channel("ChkBox_ADSR_ADSR")  value(1) text("ADSR")     radiogroup(3) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(400, 100, 120, 12) channel("ChkBox_ADSR_EXPADSR")   text("Exp. ADSR")     radiogroup(3) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(400, 120, 120, 12) channel("ChkBox_ADSR_REV")   text("Reverse ADSR")     radiogroup(3) shape("circle") $PROPERTY_CHKBOX_OSCA
}


;-----------------------------------
;- Region: Filters GUI
;----------------------------------

groupbox bounds(140, 0, 700, 280) identchannel("GB_Filters") text("Filters") visible(0) colour(178, 186, 230, 255) fontcolour:0(0, 0, 0, 255) outlinecolour(9, 16, 91, 255)
  {
  checkbox bounds(20, 3, 70, 13) channel("ChkBox_Filter_On") text("On/Off") shape("circle") $PROPERTY_CHKBOX_OSCA

  ;-----------------------------------
  ;- Region: ___1-Encoders
  rslider bounds(0, 20, 90, 100) channel("Enc_Filter_Mix") range(0,1,0.5,1,0.01) text("Mix") valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  encoder bounds(90, 20, 90, 100) channel("Enc_Filter_CutOff") identchannel("R_Enc_Filter_CutOff") value(500) text("Cut Off")  max(3500) min(20) increment(5) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(180, 20, 90, 100) channel("Enc_Filter_Reson") identchannel("R_Enc_Filter_Reson") value(0.0) text("Resonance")  max(1) min(0.0) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder bounds(270, 20, 90, 100) channel("Enc_Filter_Distor")  identchannel("R_Enc_Filter_Distor") value(0.01) text("Distorsion")  max(1) min(0.00) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA

  ;-----------------------------------
  ;- Region: ___2-CheckBoxes
  checkbox bounds(370, 30, 100, 12) channel("ChkBox_Filter_Moogl")  text("Moogladder")  value(1) radiogroup(4) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(370, 50, 100, 12) channel("ChkBox_Filter_LPF18")   text("LPF18")   radiogroup(4) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(370, 70, 80, 12) channel("ChkBox_Filter_BQRez")   text("BQRez")    radiogroup(4) shape("circle") $PROPERTY_CHKBOX_OSCA
  combobox bounds(370, 90, 90, 14) channel("Combo_Filter_BQRez") identchannel("R_Combo_Filter_BQRez") items("Low-Pass", "High-Pass", "Band-pass", "Band-Reject", "All-Pass")
  checkbox bounds(490, 30, 70, 12) channel("ChkBox_Filter_Tone")      text("Tone")     radiogroup(4) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(490, 50, 70, 12) channel("ChkBox_Filter_aTone")     text("aTone")     radiogroup(4) shape("circle") $PROPERTY_CHKBOX_OSCA
  hslider bounds(550, 30, 140, 15) channel("Slider_Filter_Tonelayer") range(1,10,1,1,1)  valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  hslider bounds(550, 50, 140, 15) channel("Slider_Filter_aTonelayer") range(1,10,1,1,1)  valuetextbox(1) $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region: ___3-Pitch Follow
  checkbox bounds(5, 145, 100, 12) channel("ChkBox_Filter_PitchFollowOn")   text("Pitch Follow")     shape("circle") $PROPERTY_CHKBOX_OSCA
  encoder  bounds(-5, 165, 90, 70)   channel("Enc_Filter_Follow")      identchannel("R_Enc_Filter_Follow")   value(0)   max(2400) min(-2400) increment(10) valuetextbox(1) $PROPERTY_SLIDER_OSCA

  ;-----------------------------------
  ;- Region: ___4-Cut-Off LFO
  image    bounds(100, 130, 190, 130)  colour(216, 191, 216, 255)
  label    bounds(160, 135, 80, 14) text("Cut-Off LFO") fontcolour(0, 0, 0, 255)
  checkbox bounds(105, 135, 12, 12) channel("ChkBox_Filter_CutOff_LFO_On") value(0)     shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(110, 170, 80, 12) channel("ChkBox_Filter_CutOff_Line")   text("Line") value(1)  radiogroup(5) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(110, 190, 80, 12) channel("ChkBox_Filter_CutOff_Sine")   text("Sine")   radiogroup(5) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(110, 210, 80, 12) channel("ChkBox_Filter_CutOff_Seg")   text("Seg")    radiogroup(5) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(110, 230, 80, 12) channel("ChkBox_Filter_CutOff_Exp")   text("Exp")    radiogroup(5) shape("circle") $PROPERTY_CHKBOX_OSCA
  encoder  bounds(150, 150, 90, 90) channel("Enc_Filter_CutOff_Amp") identchannel("R_Enc_Filter_CutOff_Amp") text("Amp")  value(0.01)   max(2) min(0) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder  bounds(210, 150, 90, 90) channel("Enc_Filter_CutOff_Freq") identchannel("R_Enc_Filter_CutOff_Freq") text("Freq")  value(0.01)   max(4) min(0.01) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA

  ;-----------------------------------
  ;- Region: ___5-Resonnance LFO
  image    bounds(300, 130, 190, 130)  colour(216, 191, 216, 255)
  label    bounds(300, 135, 200, 14) text("Resonance LFO") fontcolour(0, 0, 0, 255)
  checkbox bounds(305, 135, 12, 12) channel("ChkBox_Filter_Reson_LFO_On") value(0)    shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(310, 170, 80, 12) channel("ChkBox_Filter_Reson_Line")   text("Line")   value(1)   radiogroup(6) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(310, 190, 80, 12) channel("ChkBox_Filter_Reson_Sine")   text("Sine")   radiogroup(6) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(310, 210, 80, 12) channel("ChkBox_Filter_Reson_Seg")   text("Seg")    radiogroup(6) shape("circle") $PROPERTY_CHKBOX_OSCA
  checkbox bounds(310, 230, 80, 12) channel("ChkBox_Filter_Reson_Exp")   text("Exp")    radiogroup(6) shape("circle") $PROPERTY_CHKBOX_OSCA
  encoder  bounds(350, 150, 90, 90) channel("Enc_Filter_Reson_Amp") identchannel("R_Enc_Filter_Reson_Amp") text("Amp")  value(0.01)   max(1) min(0) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder  bounds(410, 150, 90, 90) channel("Enc_Filter_Reson_Freq") identchannel("R_Enc_Filter_Reson_Freq") text("Freq")  value(0.01)   max(4) min(0.01) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA

  ;-----------------------------------
  ;- Region: ___6-Filter ADSR
  image    bounds(500, 130, 190, 130)  colour(216, 191, 216, 255)
  label    bounds(500, 135, 200, 14) text("F. Audio ADSR") fontcolour(0, 0, 0, 255)
  checkbox bounds(505, 135, 50, 14) channel("ChkBox_Filter_Env_On")   text("On")  value(0)  shape("circle") $PROPERTY_CHKBOX_OSCA
  encoder  bounds(480, 160, 85, 80) channel("Enc_Filter_Env_Att") identchannel("R_Enc_Filter_Env_Att") text("Att")  value(0.5)   max(4) min(0.01) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder  bounds(530, 160, 85, 80) channel("Enc_Filter_Env_Dec") identchannel("R_Enc_Filter_Env_Dec") text("Dec")  value(0.5)   max(4) min(0.01) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder  bounds(580, 160, 85, 80) channel("Enc_Filter_Env_Sus") identchannel("R_Enc_Filter_Env_Sus") text("Sus")  value(.9)   max(1) min(0) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  encoder  bounds(630, 160, 85, 80) channel("Enc_Filter_Env_Rel") identchannel("R_Enc_Filter_Env_Rel") text("Rel")  value(0.7)   max(4) min(0.01) increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA

}


;-----------------------------------
;- Region: Effect GUI
;-----------------------------------
groupbox bounds(140, 0, 700, 280) identchannel("GB_Effects") text("Effects") visible(0) colour(178, 186, 230, 255) fontcolour:0(0, 0, 0, 255) outlinecolour(9, 16, 91, 255)
  {

  ;-----------------------------------
  ;- Region: ___1-Reverb
  image    bounds(5, 20, 160, 100)  colour(216, 191, 216, 255)
  label bounds(5, 25, 160, 14) text("Reverb") fontcolour(0, 0, 0, 255)
  checkbox bounds(10, 25, 12, 12) channel("Reverb_On") shape("circle") $PROPERTY_CHKBOX_GENE
  rslider bounds(0, 40, 70, 75) channel("Reverb_Room") range(0,1,0.8,1,0.01)  text("Room")  valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  rslider bounds(50, 40, 70, 75) channel("Reverb_Damp") range(0,1,0.8,1,0.01)  text("Damp")  valuetextbox(1)  $PROPERTY_SLIDER_OSCA2
  rslider bounds(100, 40, 70, 75) channel("Reverb_Mix") range(0,1,0.5,1,0.01) text("Mix")  valuetextbox(1) $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region: ___2-Echo
  image    bounds(170, 20, 120, 100)  colour(216, 191, 216, 255)
  label bounds(170, 25, 120, 14) text("Echo") fontcolour(0, 0, 0, 255)
  checkbox bounds(175, 25, 12, 12) channel("Echo_On") shape("circle") $PROPERTY_CHKBOX_GENE
  rslider bounds(170, 40, 70, 75) channel("Echo_Delay") min(0.5) max(6) value(1.5) text("Delay") increment(0.1) valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  rslider bounds(220, 40, 70, 75) channel("Echo_Loop") min(0.01) max(6) value(0.1) text("After")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region: ___3-Ring modulation
  image    bounds(295, 20, 180, 100)  colour(216, 191, 216, 255)
  label bounds(295, 25, 160, 14) text("Ring Mod") fontcolour(0, 0, 0, 255)
  checkbox bounds(300, 25, 12, 12) channel("Ring_On")  shape("circle") $PROPERTY_CHKBOX_GENE
  rslider bounds(290, 40, 70, 75) channel("Ring_Amp") range(0, 2, 2, 1, 0.01) text("Amp") increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  encoder bounds(340, 40,  100,75)  channel("Ring_Freq") value(385) increment(1) text("Freq")  max(1500) min(0.1) valuetextbox(1) $PROPERTY_SLIDER_OSCA
  rslider bounds(410, 40, 70, 75) channel("Ring_Offset") range(0, 1, 1, 1, 0.01) text("Offset") increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region: ___4-Flanger
  image    bounds(480, 20, 180, 100)  colour(216, 191, 216, 255)
  label bounds(485, 25, 180, 14) text("Flanger") fontcolour(0, 0, 0, 255)
  checkbox bounds(485, 25, 12, 12) channel("Flanger_On")  shape("circle") $PROPERTY_CHKBOX_GENE
  rslider bounds(480, 40, 70, 75) channel("Flanger_Depth") min(0) max(200) value(20) text("Depth") increment(0.01) valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  rslider bounds(540, 40, 70, 75) channel("Flanger_Freq") min(0.0) max(200) value(20) text("Freq")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2
  rslider bounds(600, 40, 70, 75) channel("Flanger_FeedBack") min(0.0) max(1) value(0.5) text("FeedBck")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2

  ;-----------------------------------
  ;- Region: ___4-Chorus
  image    bounds(420, 130, 240, 100)  colour(216, 191, 216, 255)
  label bounds(425, 135, 240, 14) text("Chorus") fontcolour(0, 0, 0, 255)
  checkbox bounds(425, 135, 12, 12) channel("Chorus_On")  shape("circle") $PROPERTY_CHKBOX_GENE
  rslider bounds(420, 150, 70, 75) channel("Chorus_Rate") min(0.0) max(1) value(0.2) text("Rate")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2
  rslider bounds(480, 150, 70, 75) channel("Chorus_Depth") min(5) max(50) value(14) text("Depth") increment(0.1) valuetextbox(1) $PROPERTY_SLIDER_OSCA2
  rslider bounds(540, 150, 70, 75) channel("Chorus_Offset") min(0.0) max(50) value(20) text("Offset")  increment(1) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2
  rslider bounds(600, 150, 70, 75) channel("Chorus_Mix") min(0.0) max(1) value(0.8) text("Mix")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2


  ;-----------------------------------
  ;- Region: ___5-Gain
  image    bounds(5, 130, 90, 100)  colour(216, 191, 216, 255)
  rslider bounds(10, 140, 70, 75) channel("MainGain") min(0.0) max(1) value(0.5) text("Main Gain")  increment(0.01) valuetextbox(1)  $PROPERTY_SLIDER_OSCA2
 
  ;-----------------------------------
  ;- Region: ___6-Host Slave
  image    bounds(100, 130, 90, 100)  colour(216, 191, 216, 255)
  label bounds(100, 135, 90, 14) text("Host") fontcolour(0, 0, 0, 255)
  checkbox bounds(105,150, 60, 12) channel("HostSlave_On") text("Slave") shape("circle") $PROPERTY_CHKBOX_GENE textcolour(0, 0, 0, 255) fontcolour(0, 0, 0, 255)
  numberbox bounds(110, 163, 70, 30) channel("HostBPMValue")  text("BPM")  textcolour(0, 0, 0, 255) min(0) max(360)
  numberbox bounds(110, 195, 70, 30) channel("HostMorphValue")  text("Frq Morph")  textcolour(0, 0, 0, 255) min(0) max(360)
 
  ;-----------------------------------
  ;- Region: ___7-BinAural
  image    bounds(195, 130, 125, 100)  colour(216, 191, 216, 255)
  label bounds(200, 135, 135, 14) text("BinAural") fontcolour(0, 0, 0, 255)
  checkbox bounds(200,135, 12, 12)  channel("ChkBox_Binaural")  shape("circle") $PROPERTY_CHKBOX_GENE textcolour(0, 0, 0, 255) fontcolour(0, 0, 0, 255)
  encoder bounds(180, 145, 100,75) channel("Enc_Azimut") text("Azimut") valuetextbox(1) min(-90) max(180) increnent(1) value(0) $PROPERTY_SLIDER_OSCA
  encoder bounds(230, 145,  100,75) channel("Enc_Elev") text("Elevation") valuetextbox(1) min(-40) max(90) increnent(1) value(0) $PROPERTY_SLIDER_OSCA

}

</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -+rtmidi=NULL -M0 -m0d ; --midi-key-cps=4 --midi-velocity-amp=5   ; -d 
</CsOptions>
<CsInstruments>
; Initialize the global variables.
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

;**********************************************
;- Region: Init Variables
;**********************************************

gk_SubOsc_Octave  init 0
gk_SubOsc_Mix init 0.5

giTableOscA init 0
giTableOscB init 0
giTableOscC init 0

giTriangle	ftgen	0, 0, 8193, 7, 0.5, 2048, 1, 4096, 0, 2048, 0.5			; triangle wave
giSine		ftgen	0, 0, 4097, 10, 1						; sine wave


/* The following file are available in Csound Documentation,
just copy paste them into where Morpheur Synth is
and provide the path */
/*gSstereoL sprintf "%s/%s", chnget:S("CSD_PATH"), "hrtf-44100-left.dat"
gSstereoR sprintf "%s/%s", chnget:S("CSD_PATH"), "hrtf-44100-right.dat"*/

chnset 0, "ChannelTableOscA"
chnset 0, "ChannelTableOscB"
chnset 0, "ChannelTableOscB"
gkFlag_ActiveGB_OSC init 1
gkFlag_ActiveGB_ENV init  0
gkFlag_ActiveGB_FILT init 0
gkFlag_ActiveGB_EFFECT init 0
gkPreset_FLag init 0


#include "./UDO/Midi_trigger.udo"
#include "./UDO/LoadFile2Table.udo"
#include "./UDO/SubOscil.udo"
#include "./UDO/Envelope.udo"
#include "./UDO/Morphing.udo"
#include "./UDO/Filters.udo"
#include "./UDO/Flanger.udo"
#include "./UDO/Chorus.udo"
#include "./UDO/FM.udo"




instr InitData
  ; SPresetPath init "AKWF_sin_0001.wav"
  gSstereoL = "./Data/hrtf-44100-left.dat"
  gSstereoR = "./Data/hrtf-44100-right.dat"
 
  if chnget("IS_A_PLUGIN") != 1 then 
   ; kval = chnget:k("PresetCombo")
 SfilepathOscA = "AKWF_saw.wav"
  chnset SfilepathOscA,"filenameOscA"
  LoadSoundfile "filenameOscA", "filerOscA", "ChannelTableOscA"
  ; gSfilepathOscA sprintf "%s/%s", chnget:S("CSD_PATH"), "AKWF_saw.wav"
  SfilepathOscB = "AKWF_tri.wav"
  chnset SfilepathOscB,"filenameOscB"
  LoadSoundfile "filenameOscB", "filerOscB", "ChannelTableOscB"
  SfilepathOscC = "AKWF_sin.wav"
  chnset SfilepathOscC,"filenameOscC"
  LoadSoundfile "filenameOscC", "filerOscC", "ChannelTableOscC"
 
      gkFlag_ActiveGB_OSC = 1
      gkFlag_ActiveGB_ENV = 1
      gkFlag_ActiveGB_FILT = 1
      gkFlag_ActiveGB_EFFECT = 1
  chnset k(0), "PresetCombo"
  endif
endin



   
     
;**********************************************
;- Region: INSTR  MANAGUI GUI
;**********************************************


instr ManageGUI
 
  ;init the controller  -  Works with my ALESIS VI49
  kCtrler20 init 0
  kCtrler21 init 0
  kCtrler22 init 0
  ;All controler receive values between 0 and 127, but ALESIS v49 is configured to send values between 0 and 100  => easier operation
  ; The following must be adapted accordingly to your controller messages
  kCtrler20 ctrl7 1,20,0, 127
  kCtrler21 ctrl7 1,21,0, 127
  kCtrler22 ctrl7 1,22,0, 127
  kCtrler23 ctrl7 1,23,0, 127
  kCtrler24 ctrl7 1,24,0, 127
  kCtrler25 ctrl7 1,25,0, 127
  kCtrler26 ctrl7 1,26,0, 127
  kCtrler27 ctrl7 1,27,0, 127
  kCtrler28 ctrl7 1,28,0, 127
  kCtrler29 ctrl7 1,29,0, 127
  kCtrler30 ctrl7 1,30,0, 127
  kCtrler31 ctrl7 1,31,0, 127




  ;**********************************************
  ;- Region: _Menu Button
  ;**********************************************
  ; Manage the menu button and show the groupbox linked to the selected menu button
  if changed:k(chnget:k("But_Call_MainOsc"))==1 ||changed:k(chnget:k("But_Call_ADSR"))==1 ||\
      changed:k(chnget:k("But_Call_Filters"))==1 ||changed:k(chnget:k("But_Call_Effects"))==1 then
      if chnget:k("But_Call_MainOsc")==1 then
          chnset "visible(0)","GB_ADSR"
          chnset "visible(0)","GB_Filters"
          chnset "visible(0)","GB_Effects"
          chnset "visible(1)","GB_MainOSc"
          gkFlag_ActiveGB_OSC = 1
          gkFlag_ActiveGB_ENV = 0
          gkFlag_ActiveGB_FILT = 0
          gkFlag_ActiveGB_EFFECT = 0
      endif
      if chnget:k("But_Call_ADSR")==1 then
          chnset "visible(0)","GB_Filters"
          chnset "visible(0)","GB_Effects"
          chnset "visible(0)","GB_MainOSc"
          chnset "visible(1)","GB_ADSR"
          gkFlag_ActiveGB_OSC = 0
          gkFlag_ActiveGB_ENV = 1
          gkFlag_ActiveGB_FILT = 0
          gkFlag_ActiveGB_EFFECT = 0
      endif
      if chnget:k("But_Call_Filters")==1 then
          chnset "visible(0)","GB_ADSR"
          chnset "visible(0)","GB_Effects"
          chnset "visible(0)","GB_MainOSc"
          chnset "visible(1)","GB_Filters"
          gkFlag_ActiveGB_OSC = 0
          gkFlag_ActiveGB_ENV = 0
          gkFlag_ActiveGB_FILT = 1
          gkFlag_ActiveGB_EFFECT = 0
      endif
      if chnget:k("But_Call_Effects")==1 then
          chnset "visible(0)","GB_ADSR"
          chnset "visible(0)","GB_Filters"
          chnset "visible(0)","GB_MainOSc"
          chnset "visible(1)","GB_Effects"
          gkFlag_ActiveGB_OSC = 0
          gkFlag_ActiveGB_ENV = 0
          gkFlag_ActiveGB_FILT = 0
          gkFlag_ActiveGB_EFFECT = 1
      endif
  endif

  ;**********************************************
  ;- Region: _Panic Button
  ;**********************************************
  if changed:k(chnget:k("But_Call_Panic"))==1 then
      if chnget:k("But_Call_Panic")==1 then
          ; DO THE PANIC PROCEDURE
        kReverb_active active "Reverb",0,1  ; check if instrument reverb is active
        if kReverb_active >0 then           ; if the reverb instr has more than 0 instance 
          chnclear "Reverb_SendL"           ; clear channels
          chnclear "Reverb_SendR"
          turnoff2 "Reverb",0,0
        endif
        kEcho_active active "Echo",0,1                        ; check if instrument reverb is active
        if kEcho_active>0 then 
          chnclear "Echo_SendL"
          chnclear "Echo_SendR"
		      turnoff2 "Echo",0,0
        endif  
        k801_active active 801,0,1     
        if k801_active >0 then
          turnoff2 801,0,0
        endif
      endif
  endif

  ;**********************************************
  ;- Region: _Save Button
  ;**********************************************
  if changed:k(chnget:S("Save_filebutton"))==1 then
      ; DO THE SAVE PROCEDURE
      ; if any
  endif


  ;**********************************************
  ;- Region: _Preset ComboBox
  ;**********************************************
  if changed:k(chnget:k("PresetCombo"))==1 then
      ; DO THE PRESET PROCEDURE
      ; if any
      gkFlag_ActiveGB_OSC = 1
      gkFlag_ActiveGB_ENV = 1
      gkFlag_ActiveGB_FILT = 1
      gkFlag_ActiveGB_EFFECT = 1
      ; Set a Flag which will be set to 0 after all GB have been updated, see  at the end of instr "ManageGB"
      gkPreset_FLag=1
    ;  chnset k(1), "But_Call_MainOsc"
  endif


  ;---------------------------------------
  ;- Region: _5: Real Knobs Ctroller
  ;---------------------------------------
  if changed(kCtrler20)== 1  then
      gk_Freq_Morph = kCtrler20*0.05
      chnset gk_Freq_Morph,"Enc_Freq_Morph"
  endif
  if changed(kCtrler21)== 1 || changed(kCtrler22)== 1 then    ;read and rescale the Ctr 20 (unites)  and 21 (decimales)
      ;messages from controllers are between 0 and 100   (using a config from the alesis vi49)
      gk_FM_Freq_Mod= kCtrler21*.05 +kCtrler22*0.005
      chnset gk_FM_Freq_Mod,"Enc_FM_Freq_Mod"
  endif
      
  if changed(kCtrler23)== 1  then
      gk_FM_Amp_Mod = kCtrler23*0.25
      chnset gk_FM_Amp_Mod,"Enc_FM_Amp_Mod"
  endif
  /* Controller trigger the Filter Cutoff and filter Resonance */ 
  if changed(kCtrler24)== 1  then
       gk_Filter_CutOff =  kCtrler24*12+50
       chnset gk_Filter_CutOff,"Enc_Filter_CutOff"      
  endif
  if changed(kCtrler25)== 1  then
      ; Not implemented yet
       gk_Filter_Reson =kCtrler25*0.01
        chnset gk_Filter_Reson,"Enc_Filter_Reson"
  endif

/* RING MODULATION */   
      if changed(kCtrler26)== 1  then
      ; Not implemented yet
      gk_Ring_Amp=kCtrler26*0.02
      chnset gk_Ring_Amp,"Ring_Amp"
  endif
  if changed(kCtrler27)== 1 || changed(kCtrler28)== 1 then
      gk_Ring_Freq=kCtrler27*15 + kCtrler28
      chnset gk_Ring_Freq,"Ring_Freq"
  endif
  /*if changed(kCtrler28)== 1  then
      ; Not implemented yet
  endif*/
  if changed(kCtrler29)== 1  then
       gk_Ring_Offset=kCtrler29*0.01
      chnset gk_Ring_Offset,"Ring_Offset"
  endif
  if changed(kCtrler30)== 1  then
      ; Not implemented yet
  endif
  if changed(kCtrler31)== 1  then
      gkMainGain =  kCtrler31*0.01
      chnset gkMainGain,"MainGain"
  endif
endin






instr ManageGB


  ;**********************************************
  ;- Region: GB_Oscillator
  ;**********************************************
  if gkFlag_ActiveGB_OSC==1 then
      ;  printks "kFlag_ActiveGB_OSC  \n", 0.25
      ;- Region: ____Populate Soundfilers
      ; get the value for the oscillator and soundfilers
      if changed:k(chnget:S("filenameOscA"))==1 then
          LoadSoundfile "filenameOscA", "filerOscA", "ChannelTableOscA"
      endif
      if changed:k(chnget:S("filenameOscB"))==1 then
          LoadSoundfile "filenameOscB", "filerOscB", "ChannelTableOscB"
      endif
      if changed:k(chnget:S("filenameOscC"))==1 then
          LoadSoundfile "filenameOscC", "filerOscC", "ChannelTableOscC"
      endif
      ;- Region: ____Get Suboscillator
      ;get the values of the suboscillator
      if changed:k(chnget:k("Slider_SubOsc_Octave"))==1 then
          gk_SubOsc_Octave = chnget:k("Slider_SubOsc_Octave")
      endif
      if changed:k(chnget:k("Slider_SubOsc_Mix"))==1 then
          gk_SubOsc_Mix = chnget:k("Slider_SubOsc_Mix")
      endif
      ;- Region: ____Get FM
      if changed:k(chnget:k("Enc_FM_Freq_Mod"))==1 then
          gk_FM_Freq_Mod = chnget:k("Enc_FM_Freq_Mod")
      endif
      if changed:k(chnget:k("Enc_FM_Amp_Mod"))==1 then
          gk_FM_Amp_Mod = chnget:k("Enc_FM_Amp_Mod")
      endif
      ;- Region: ____Get Morphing
      if changed:k(chnget:k("Enc_Freq_Morph"))==1 then
          gk_Freq_Morph = chnget:k("Enc_Freq_Morph")
      endif
      if changed:k(chnget:k("ChkBox_Sin"))==1 ||changed:k(chnget:k("ChkBox_Seg"))==1 ||\
          changed:k(chnget:k("ChkBox_Exp"))==1 ||changed:k(chnget:k("ChkBox_Line"))==1 then
          if chnget:k("ChkBox_Sin")==1 then
              gk_Shape_Morph =1
          endif
          if chnget:k("ChkBox_Seg")==1 then
              gk_Shape_Morph =2
          endif
          if chnget:k("ChkBox_Exp")==1 then
              gk_Shape_Morph =3
          endif
          if chnget:k("ChkBox_Line")==1 then
              gk_Shape_Morph =4
          endif
      endif
  endif
  ;**********************************************
  ;- Region: ___Enveloppe GB
  ;**********************************************
  if gkFlag_ActiveGB_ENV==1 then
      ; printks "kFlag_ActiveGB_ENV \n", 0.1
      if  changed:k(chnget:k("Enc_ADSR_Attack"))==1 then
          gk_ADSR_Attack = chnget:k("Enc_ADSR_Attack")
      endif
      if  changed:k(chnget:k("Enc_ADSR_Decay"))==1 then
          gk_ADSR_Decay = chnget:k("Enc_ADSR_Decay")
      endif
      if  changed:k(chnget:k("Enc_ADSR_Sustain"))==1 then
          gk_ADSR_Sustain = chnget:k("Enc_ADSR_Sustain")
      endif
      if  changed:k(chnget:k("Enc_ADSR_Release"))==1 then
          gk_ADSR_Release = chnget:k("Enc_ADSR_Release")
      endif
      if changed:k(chnget:k("ChkBox_ADSR_AD"))==1 ||changed:k(chnget:k("ChkBox_ADSR_ADSR"))==1 ||\
          changed:k(chnget:k("ChkBox_ADSR_EXPADSR"))==1 ||changed:k(chnget:k("ChkBox_ADSR_REV"))==1 then
          if chnget:k("ChkBox_ADSR_AD") ==1 then
              gk_Envelope_Mode = 1
          endif
          if chnget:k("ChkBox_ADSR_ADSR") ==1 then
              gk_Envelope_Mode = 2
          endif
          if chnget:k("ChkBox_ADSR_EXPADSR") ==1 then
              gk_Envelope_Mode = 3
          endif
          if chnget:k("ChkBox_ADSR_REV") ==1 then
              gk_Envelope_Mode = 4
          endif
      endif
  endif
  ;**********************************************
  ;- Region: ___Filters GB
  ;**********************************************
  if gkFlag_ActiveGB_FILT ==1 then
      ; printks "kFlag_ActiveGB_FILT \n", 0.1
      ;- Region:  __Check if filter is on
      if changed:k(chnget:k("ChkBox_Filter_On"))==1 then
          if chnget:k("ChkBox_Filter_On")==1 then
              gk_Filter_is_On = 1
          else
              gk_Filter_is_On = 0
              chnset k(0),"ChkBox_Filter_PitchFollowOn"
             chnset k(0), "ChkBox_Filter_CutOff_LFO_On"
             chnset k(0), "ChkBox_Filter_Reson_LFO_On"
             chnset k(0), "ChkBox_Filter_Env_On"                    
          endif
      endif
      ;- Region:  __Check selected filter type
      if changed:k(chnget:k("ChkBox_Filter_Moogl"))==1 || changed:k(chnget:k("ChkBox_Filter_LPF18"))==1  ||changed:k(chnget:k("ChkBox_Filter_BQRez"))==1  \
          ||  changed:k(chnget:k("ChkBox_Filter_Tone"))==1  || changed:k(chnget:k("ChkBox_Filter_aTone"))==1 then
           
          if chnget:k("ChkBox_Filter_Moogl")==1 then
              gk_Filter_Type=0
              chnset "active(0)", "R_Enc_Filter_Distor"
              chnset "active(1)", "R_Enc_Filter_Reson"
              chnset "active(0)", "R_Combo_Filter_BQRez"
              chnset "active(1)", "R_Enc_Filter_CutOff"
          endif
          if chnget:k("ChkBox_Filter_LPF18")==1 then
              gk_Filter_Type=1
              chnset "active(1)", "R_Enc_Filter_Reson"
              chnset "active(1)", "R_Enc_Filter_Distor"
              chnset "active(0)", "R_Combo_Filter_BQRez"
              chnset "active(1)", "R_Enc_Filter_CutOff"
          endif
          if chnget:k("ChkBox_Filter_BQRez")==1 then
              gk_Filter_Type=2
              chnset "active(1)", "R_Enc_Filter_Reson"
              chnset "active(0)", "R_Enc_Filter_Distor"
              chnset "active(1)", "R_Combo_Filter_BQRez"
              chnset "active(1)", "R_Enc_Filter_CutOff"
          endif
          if chnget:k("ChkBox_Filter_Tone")==1 then
              gk_Filter_Type=3
              chnset "active(0)", "R_Enc_Filter_Reson"
              chnset "active(0)", "R_Enc_Filter_Distor"
              chnset "active(0)", "R_Combo_Filter_BQRez"
              chnset "active(1)", "R_Enc_Filter_CutOff"
          endif
          if chnget:k("ChkBox_Filter_aTone")==1 then
              gk_Filter_Type=4
              chnset "active(0)", "R_Enc_Filter_Reson"
              chnset "active(0)", "R_Enc_Filter_Distor"
              chnset "active(0)", "R_Combo_Filter_BQRez"
              chnset "active(1)", "R_Enc_Filter_CutOff"
          endif
      endif

      ;- Region:  __Get values Main Encoders
      if changed:k(chnget:k("Enc_Filter_Mix"))==1 then
          gk_Filter_Mix = chnget:k("Enc_Filter_Mix")
      endif

      if changed:k(chnget:k("Enc_Filter_CutOff"))==1 then
          gk_Filter_CutOff = chnget:k("Enc_Filter_CutOff")
      endif

      if changed:k(chnget:k("Enc_Filter_Reson"))==1 then
          gk_Filter_Reson = chnget:k("Enc_Filter_Reson")
      endif

      if changed:k(chnget:k("Enc_Filter_Distor"))==1 then
          gk_Filter_Distor = chnget:k("Enc_Filter_Distor")
      endif
	
      ;- Region:  __Get values BQrez combo
      if changed:k(chnget:k("Combo_Filter_BQRez"))==1 then
          kFilterCombo = chnget:k("Combo_Filter_BQRez")
          reinit REINIT_BQREZ
          REINIT_BQREZ:
              gi_BQrez_Type = i(kFilterCombo)-1
          rireturn
      endif
      ;- Region:  __Get values Tone/atone sliders
      if changed:k(chnget:k("Slider_Filter_Tonelayer"))==1 then
          kLayer = chnget:k("Slider_Filter_Tonelayer")
          reinit TONE_LAYER
          TONE_LAYER:
              gi_ToneLayer = i(kLayer)
          rireturn
      endif
      if changed:k(chnget:k("Slider_Filter_aTonelayer"))==1 then
          kLayer = chnget:k("Slider_Filter_aTonelayer")
          reinit ATONE_LAYER
          ATONE_LAYER:
              gi_AToneLayer = i(kLayer)
          rireturn
      endif

      ;- Region:  __Get values Filter Pitch Follow
      if changed:k(chnget:k("ChkBox_Filter_PitchFollowOn"))==1 then
          if chnget:k("ChkBox_Filter_PitchFollowOn")== 1 then
              gk_Filter_PitchFollow=1
          else
              gk_Filter_PitchFollow=0
          endif
      endif
      if gk_Filter_PitchFollow==1  && changed:k(chnget:k("Enc_Filter_Follow"))==1 then
          gk_Filter_PitchFollow_Value = chnget:k("Enc_Filter_Follow")
      endif

      ;- Region:  __Get values LFO Cut Off for filters
      if changed:k(chnget:k("ChkBox_Filter_CutOff_LFO_On"))==1 then
          if chnget:k("ChkBox_Filter_CutOff_LFO_On")==1 then
              gk_Filter_CutOff_LFO_is_On = 1
          else
              gk_Filter_CutOff_LFO_is_On = 0
          endif
      endif
	
      if gk_Filter_CutOff_LFO_is_On ==1 then
          if changed:k(chnget:k("Enc_Filter_CutOff_Amp"))==1 then
              gk_Filter_CutOff_Amp = chnget:k("Enc_Filter_CutOff_Amp")
          endif
          if changed:k(chnget:k("Enc_Filter_CutOff_Freq"))==1 then
              gk_Filter_CutOff_Freq = chnget:k("Enc_Filter_CutOff_Freq")
          endif
          if changed:k(chnget:k("ChkBox_Filter_CutOff_Line"))==1  || changed:k(chnget:k("ChkBox_Filter_CutOff_Sine"))==1 || \
              changed:k(chnget:k("ChkBox_Filter_CutOff_Seg"))==1 || changed:k(chnget:k("ChkBox_Filter_CutOff_Exp"))==1 then
              if chnget:k("ChkBox_Filter_CutOff_Line")==1 then
                  gk_Filter_CutOff_LFO_Mode = 0
              endif
              if chnget:k("ChkBox_Filter_CutOff_Sine")==1 then
                  gk_Filter_CutOff_LFO_Mode = 1
              endif
              if chnget:k("ChkBox_Filter_CutOff_Seg")==1  then
                  gk_Filter_CutOff_LFO_Mode = 2
              endif
              if chnget:k("ChkBox_Filter_CutOff_Exp")==1  then
                  gk_Filter_CutOff_LFO_Mode = 3
              endif
          endif
      endif
	
	
      ;- Region:  __Get values LFO Resonance
      if changed:k(chnget:k("ChkBox_Filter_Reson_LFO_On"))==1 then
          if chnget:k("ChkBox_Filter_Reson_LFO_On")==1 then
              gk_Filter_Reson_LFO_is_On = 1
          else
              gk_Filter_Reson_LFO_is_On = 0
          endif
      endif
      if gk_Filter_Reson_LFO_is_On ==1 then
          if changed:k(chnget:k("Enc_Filter_Reson_Amp"))==1 then
              gk_Filter_Reson_Amp = chnget:k("Enc_Filter_Reson_Amp")
          endif
          if changed:k(chnget:k("Enc_Filter_Reson_Freq"))==1 then
              gk_Filter_Reson_Freq = chnget:k("Enc_Filter_Reson_Freq")
          endif
          if changed:k(chnget:k("ChkBox_Filter_Reson_Line"))==1  || changed:k(chnget:k("ChkBox_Filter_Reson_Sine"))==1 || \
              changed:k(chnget:k("ChkBox_Filter_Reson_Seg"))==1 || changed:k(chnget:k("ChkBox_Filter_Reson_Exp"))==1 then
              if chnget:k("ChkBox_Filter_Reson_Line")==1     then
                  gk_Filter_Reson_LFO_Mode = 0
              endif
              if chnget:k("ChkBox_Filter_Reson_Sine")==1 then
                  gk_Filter_Reson_LFO_Mode = 1
              endif
              if chnget:k("ChkBox_Filter_Reson_Seg")==1  then
                  gk_Filter_Reson_LFO_Mode = 2
              endif
              if chnget:k("ChkBox_Filter_Reson_Exp")==1  then
                  gk_Filter_Reson_LFO_Mode = 3
              endif
          endif
      endif

	  
	  
      ;- Region:  __Get values Filter Audio ADSR
      if changed:k(chnget:k("ChkBox_Filter_Env_On"))==1 then
          if chnget:k("ChkBox_Filter_Env_On")==1 then
              gk_Filter_Env_is_On=1
          else
              gk_Filter_Env_is_On=0
          endif
      endif
      if gk_Filter_Env_is_On==1 then
          if changed:k(chnget:k("Enc_Filter_Env_Att"))==1 then
              gk_Filter_Env_Att =  chnget:k("Enc_Filter_Env_Att")
          endif
          if changed:k(chnget:k("Enc_Filter_Env_Dec"))==1 then
              gk_Filter_Env_Dec =  chnget:k("Enc_Filter_Env_Dec")
          endif
          if changed:k(chnget:k("Enc_Filter_Env_Sus"))==1 then
              gk_Filter_Env_Sus =  chnget:k("Enc_Filter_Env_Sus")
          endif
          if changed:k(chnget:k("Enc_Filter_Env_Rel"))==1 then
              gk_Filter_Env_Rel =  chnget:k("Enc_Filter_Env_Rel")
          endif
      endif
	
  endif


  ;**********************************************
  ;- Region: ___Effects GB
  ;**********************************************
  if gkFlag_ActiveGB_EFFECT==1 then
 
      ;- Region: Effect management
      ;- Region: ____1-Reverb

      if (chnget:k("Reverb_On"))==1 then    ; if the checkbox is on 
        gk_Reverb_On =1                     ; set the global flag to the audio instrument
        kReverb_active active "Reverb",0,1  ; check if instrument reverb is active
        if kReverb_active==0 then           ; if the reverb instr is not 
          event "i","Reverb",0,-3600        ;  turn it on 
        endif
        if changed:k(chnget:k("Reverb_Room"))==1 then   ; check for changed values
          gk_Reverb_Room=chnget:k("Reverb_Room")
        endif
        if changed:k(chnget:k("Reverb_Damp"))==1 then
          gk_Reverb_Damp =chnget:k("Reverb_Damp")
        endif
        if changed:k(chnget:k("Reverb_Mix"))==1 then
          gk_Reverb_Mix =chnget:k("Reverb_Mix")
        endif
      else                                  ; checkbox is off
        gk_Reverb_On =0                     ; set the global flag to the audio instrument
        kReverb_active active "Reverb",0,1  ; check if instrument reverb is active
        if kReverb_active >0 then           ; if the reverb instr has more than 0 instance 
          chnclear "Reverb_SendL"           ; clear channels
          chnclear "Reverb_SendR"
          turnoff2 "Reverb",0,0              ;  turn instr rever off
        endif
      endif

      ;- Region: ____2-Echo
      if chnget:k("Echo_On")==1 then                         ; if the checkbox is on 
        gk_Echo_On =1                                         ; set the global flag to the audio instrument
        kEcho_active active "Echo",0,1                        ; check if instrument reverb is active
        if kEcho_active ==0 then                              ; if the echo instr is not 
          event "i","Echo",0,-3600                            ;  turn it on 
        endif
        if changed:k(chnget:k("Echo_Delay"))==1 then          ; check for changed values
          gk_Echo_rvt = chnget:k("Echo_Delay")
        endif
        if changed:k(chnget:k("Echo_Loop"))==1 then
          gk_Echo_loop = chnget:k("Echo_Loop")
        endif
      else
        gk_Echo_On =0
        kEcho_active active "Echo",0,1                        ; check if instrument reverb is active
        if kEcho_active>0 then 
          chnclear "Echo_SendL"
          chnclear "Echo_SendR"
          turnoff2 "Echo",0,0              ;  turn instr rever off
        endif

      endif

      ;- Region: ____3-Ring Modulation
      if changed:k(chnget:k("Ring_On"))==1 then
          if chnget:k("Ring_On")==1 then
              gk_Ring_On=1
          else
              gk_Ring_On=0
          endif
      endif
      if changed:k(chnget:k("Ring_Amp"))==1 then
          gk_Ring_Amp=chnget:k("Ring_Amp")
      endif
      if changed:k(chnget:k("Ring_Freq"))==1 then
          gk_Ring_Freq= chnget:k("Ring_Freq")
      endif
      if changed:k(chnget:k("Ring_Offset"))==1 then
          gk_Ring_Offset=chnget:k("Ring_Offset")
      endif
      
      ;- Region: ____4-Flanger
      if changed:k(chnget:k("Flanger_On"))==1 then
          if chnget:k("Flanger_On")==1 then
              gk_Flanger_On=1
          else
              gk_Flanger_On=0
          endif
      endif
      if changed:k(chnget:k("Flanger_Depth"))==1 then
          gk_Flanger_Depth= chnget:k("Flanger_Depth")
      endif
      if changed:k(chnget:k("Flanger_Freq"))==1 then
          gk_Flanger_Freq = chnget:k("Flanger_Freq")
      endif
      if changed:k(chnget:k("Flanger_FeedBack"))==1 then
          gk_Flanger_FeedBack = chnget:k("Flanger_FeedBack")
      endif

      ;- Region: ____5-Chorus
      if changed:k(chnget:k("Chorus_On"))==1 then
          if chnget:k("Chorus_On")==1 then
              gk_Chorus_On=1
          else
              gk_Chorus_On=0
          endif
      endif
      if gk_Chorus_On==1 then
          if changed:k(chnget:k("Chorus_Depth"))==1 then
              gk_Chorus_Depth= chnget:k("Chorus_Depth")
             ; gk_Chorus_Min = gk_Chorus_Min/1000
          endif
          if changed:k(chnget:k("Chorus_Rate"))==1 then
              gk_Chorus_Rate= chnget:k("Chorus_Rate")
          endif
          if changed:k(chnget:k("Chorus_Offset"))==1 then
              gk_Chorus_Offset = chnget:k("Chorus_Offset")
            ;  gk_Chorus_Max= gk_Chorus_Max/1000
          endif
          if changed:k(chnget:k("Chorus_Mix"))==1 then
              gk_Chorus_Mix = chnget:k("Chorus_Mix")
          endif
      endif
  
      ;- Region: ____6-Main Gain
      if changed:k(chnget:k("MainGain"))==1 then
          gk_MainGain = chnget:k("MainGain")
      endif
 
      ;- Region: ____7-Host Enslave
      if chnget:k("HostSlave_On")==1 then
          if chnget:k("IS_A_PLUGIN")==1 then
              gk_TempoFactor= chnget:k("HOST_BPM")
              chnset gk_TempoFactor,"HostBPMValue"
              chnset gk_Freq_Morph,"HostMorphValue"
          else
              gk_TempoFactor = 1
              chnset gk_TempoFactor,"HostBPMValue"
              chnset gk_Freq_Morph,"HostMorphValue"
          endif
      else
          gkTempoFactor = 1
          chnset gk_TempoFactor,"HostBPMValue"
          chnset gk_Freq_Morph,"HostMorphValue"
      endif
      
      ;- Region: ____8-BinAural
      if changed:k(chnget:k("ChkBox_Binaural"))==1 then
          gk_Stereo chnget ("ChkBox_Binaural")
          printks "gkstero : %d \n",0,gk_Stereo
      endif
      if changed:k(chnget:k("Enc_Azimut"))==1 then
          kToto = chnget:k("Enc_Azimut")
          gk_az =kToto
          reinit AZIMUT
      endif

      if changed:k(chnget:k("Enc_Elev"))==1 then
          kToto1 = chnget:k("Enc_Elev")
          gk_el = kToto1
          reinit ELEVATION
      endif
  endif



  ;VERY IMPORTANT
  ; This is necessary to bring back the loop to reading only one GB after a preset has been loaded and all variables have been updated.
  if 	gkPreset_FLag==1 then
      gkPreset_FLag=0
      gkFlag_ActiveGB_FILT=0
      gkFlag_ActiveGB_ENV=0
      gkFlag_ActiveGB_EFFECT=0
      gkFlag_ActiveGB_OSC=1
      chnset k(1), "But_Call_MainOsc" 
      chnset "visible(0)","GB_ADSR"
      chnset "visible(0)","GB_Effects"
      chnset "visible(1)","GB_MainOSc"
      chnset "visible(0)","GB_Filters"
  endif


  AZIMUT:
      gi_Az = i(kToto)
  rireturn

  ELEVATION:
      gi_Elev = i(kToto1)
  rireturn
endin






instr Echo
  aInL chnget "Echo_SendL"
  aInR chnget "Echo_SendR"
  if  gk_Echo_On==1 then
      aOutL vcomb aInL, gk_Echo_rvt, gk_Echo_loop, 6
      aOutR vcomb aInR, gk_Echo_rvt, gk_Echo_loop, 6
  
      if gk_Reverb_On==1 then
          chnmix aOutL*gk_Reverb_Mix,"Reverb_SendL"
          chnmix aOutR*gk_Reverb_Mix,"Reverb_SendR"
      endif
  endif
  outs aOutL,aOutR
  
  /*  chnmix aOutL,"LeftSignal"
    chnmix aOutR,"RightSignal"*/
  
  chnclear "Echo_SendL"
  chnclear "Echo_SendR"
endin
 
 

instr  Reverb    ; Reverb
  aInL chnget "Reverb_SendL"
  aInR chnget "Reverb_SendR"
  ; create reverberated version of input signal (note stereo input and output)
  aRvbL,aRvbR  freeverb aInL,  aInR, gk_Reverb_Room, gk_Reverb_Damp
  
  outs      aRvbL, aRvbR ; send audio to outputs
  /*   chnmix aRvbL,"LeftSignal"
    chnmix aRvbR,"RightSignal"*/
  
  chnclear  "Reverb_SendL"
  chnclear  "Reverb_SendR"
endin

 







;instrument will be triggered by keyboard widget
instr 801

  iTableOscA chnget "ChannelTableOscA"
  iTableOscB chnget "ChannelTableOscB"
  iTableOscC chnget "ChannelTableOscC"
  ktrig init 0
  ktrig=ktrig+1

 kamp  = p5/127
   ; -- pitch bend --
  kPchBnd  pchbend  0,12                ; read in pitch bend (range -6 to 6)

  ; -- aftertouch --
   if gkAfttch!=0 then 
        kAftPitch lfo gkAfttch,8*gkAfttch   ; get the value of gkAfttch  from instr 800
   else
        kAftPitch=0
   endif
  ; MIDI note number + pitch bend are converted to cycles per seconds
  kPitchInit = cpsmidinn(p4+gkPitchBend+kAftPitch)

  /* Calculate audio */
  /* Calculate envelope : call UDO */ 
  kVolume_Envelope Envelop gk_Envelope_Mode, gk_ADSR_Attack,gk_ADSR_Decay, gk_ADSR_Sustain, gk_ADSR_Release
  /* Calculate morphing : call UDO */ 
  kWeighMorph Morphing gk_Freq_Morph, gk_Shape_Morph
  /* Calculate FM modulator: call UDO */ 
  aFM FM kPitchInit,gk_FM_Freq_Mod,gk_FM_Amp_Mod,iTableOscC
  /* Calculate audio with oscil A and B*/ 
  aOut1 poscil 1,kPitchInit+aFM,iTableOscA
  aOut2 poscil 1,kPitchInit+aFM,iTableOscB
  /* Calculate sub-audio with oscil A and B*/ 
  aP4 interp kPitchInit
  aOut1,aOut2 SubOscillator aOut1,aOut2,aP4+aFM, gk_SubOsc_Octave,gk_SubOsc_Mix, iTableOscA,iTableOscB
  aOut sum aOut1*(1-kWeighMorph),aOut2*kWeighMorph

  ;------------------------------------
  ;- Region: _Apply Ring Modulation
  if gk_Ring_On == 1 then
    aRing poscil gk_Ring_Amp, cent(gk_Ring_Freq) * kPitchInit, iTableOscC
    aOut =aOut*(aRing + gk_Ring_Offset)
  endif


  ;---------------------------------------
  ;- Region: _Filter and apply envelopes
  if gk_Filter_is_On==1 then
      if gk_Filter_Type ==0 then
          aFilt My_Moogladder aOut, gk_Filter_CutOff, gk_Filter_Reson, gk_Filter_PitchFollow,gk_Filter_PitchFollow_Value, kPitchInit , \
          gk_Filter_CutOff_LFO_is_On , gk_Filter_CutOff_LFO_Mode ,gk_Filter_CutOff_Amp, gk_Filter_CutOff_Freq ,\
          gk_Filter_Reson_LFO_is_On , gk_Filter_Reson_LFO_Mode ,gk_Filter_Reson_Amp, gk_Filter_Reson_Freq
      endif
      if gk_Filter_Type ==1 then
          aFilt My_LPF18 aOut, gk_Filter_CutOff, gk_Filter_Reson, gk_Filter_PitchFollow,gk_Filter_PitchFollow_Value, kPitchInit , \
          gk_Filter_CutOff_LFO_is_On , gk_Filter_CutOff_LFO_Mode ,gk_Filter_CutOff_Amp, gk_Filter_CutOff_Freq ,\
          gk_Filter_Reson_LFO_is_On , gk_Filter_Reson_LFO_Mode ,gk_Filter_Reson_Amp, gk_Filter_Reson_Freq, gk_Filter_Distor
      endif
      if gk_Filter_Type ==2 then
          aFilt My_BQRez aOut, gk_Filter_CutOff, gk_Filter_Reson, gk_Filter_PitchFollow,gk_Filter_PitchFollow_Value, kPitchInit , \
          gk_Filter_CutOff_LFO_is_On , gk_Filter_CutOff_LFO_Mode ,gk_Filter_CutOff_Amp, gk_Filter_CutOff_Freq ,\
          gk_Filter_Reson_LFO_is_On , gk_Filter_Reson_LFO_Mode ,gk_Filter_Reson_Amp, gk_Filter_Reson_Freq ,gi_BQrez_Type
      endif
      if gk_Filter_Type ==3 then
          aFilt My_Tonex aOut, gk_Filter_CutOff, gk_Filter_PitchFollow,gk_Filter_PitchFollow_Value, kPitchInit , \
          gk_Filter_CutOff_LFO_is_On , gk_Filter_CutOff_LFO_Mode ,gk_Filter_CutOff_Amp, gk_Filter_CutOff_Freq ,gi_ToneLayer
      endif
      if gk_Filter_Type ==4 then
          aFilt My_aTonex aOut, gk_Filter_CutOff, gk_Filter_PitchFollow,gk_Filter_PitchFollow_Value, kPitchInit , \
          gk_Filter_CutOff_LFO_is_On , gk_Filter_CutOff_LFO_Mode ,gk_Filter_CutOff_Amp, gk_Filter_CutOff_Freq ,gi_AToneLayer
      endif
      ; If filtered signal has its own envelope, apply it
      if gk_Filter_Env_is_On ==1 then
          kFiltADSR madsr i(gk_Filter_Env_Att),i(gk_Filter_Env_Dec),i(gk_Filter_Env_Sus),i(gk_Filter_Env_Rel)
          aOut = (1-gk_Filter_Mix)*aOut*kVolume_Envelope +  aFilt * gk_Filter_Mix*kFiltADSR
      else
          ;if not, then apply the Volume envelope
          aOut = ((1-gk_Filter_Mix)*aOut + aFilt * gk_Filter_Mix)*kVolume_Envelope
      endif
  else
      aOut = aOut *kVolume_Envelope
  endif


  ;-----------------------------------------
  ;- Region: _Apply Main Gain
  aOut =gk_MainGain *aOut *kamp
 
  ;-----------------------------------------
  ;- Region: _Apply Flanger
  if gk_Flanger_On==1 then
      aOut Flanger  aOut, gk_Flanger_Depth,gk_Flanger_Freq,gk_Flanger_FeedBack
  endif


  ;-----------------------------------------
  ;- Region: _Apply Chorus
  if gk_Chorus_On==1 then
    aOut MyChorus  aOut,  gk_Chorus_On,  gk_Chorus_Mix, gk_Chorus_Depth, gk_Chorus_Rate,gk_Chorus_Offset      ;k(0.8),k(14),k(0.2),20 ;0.8,14,0.2,20
  endif

 
  ;-----------------------------------------
  ;- Region: _Apply Binaural
  if gk_Stereo == 1 then
      aleft,aright hrtfstat aOut, gi_Az, gi_Elev, gSstereoL,gSstereoR  
      aleft = aleft*2
      aright = aright*2
  else
      aleft = aOut
      aright= aOut
  endif
  
   ;-----------------------------------------
  ;- Region: _Out Audio
  outs     aleft, aright


  ;-----------------------------------------
  ;- Region: _Apply Echo
  if gk_Echo_On==1 then
      chnmix aleft,"Echo_SendL"
      chnmix aright,"Echo_SendR"
  endif

  ;-----------------------------------------
  ;- Region:  Apply Reverb
  if gk_Reverb_On ==1 then
      chnmix aleft*gk_Reverb_Mix,"Reverb_SendL"
      chnmix aright*gk_Reverb_Mix,"Reverb_SendR"
  endif
  

endin



/* Special thanks to Ian Mc Curdy and all contributors to Csound who have released a lot of their work
 for being used and/or reused by others */ 

instr 	1	;INSTRUMENT THAT SCANS MIDI AND STARTS AND STOPS NOTES
	insno	=	801					;INSTRUMENT NUMBER OF INSTRUMENT TO BE TRIGGERED
	MIDI_trigger_instrument	insno,0				;CALL UDO FOR STARTING AND STOPPING NOTE VIA MIDI
endin




</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i "InitData" 0 0.2
i "ManageGUI" 0 z
i "ManageGB" 0 z
i 1 0 z
</CsScore>
</CsoundSynthesizer>
