
;All filters are turned into UDO because it will be easier to reuse them into another synth (copy paste the groupbox also)
;*****************************************************
;- Region: _3:Filters
;*****************************************************

;--------------------------------------------
;- Region: __1:OP MOOGLADDER

opcode My_Moogladder, a, akkkkkkkkkkkkk

  /*--------------------------------------------
  The filter accepts the following parameters

  aIn                : audio signal input
  kCutOff            : Cut Off Frequency
  kResonLoc          : Amount of Resonnance (between 0 and 1)
  kPitchF_on         : If user want to follow the pitch of the input note. If yes, then CutOff frequency is unused
  kPitchF_Val        : Factor to shift the pitch follow cut off (cent() of the note. Between -2400 and + 2400, @ octaves
  kPitch             : Pitch (freq) of the note played on keyborad
  kLFOCutOff_on      : activate or not the LFO on the CutOff Frequency
  kLFOCutOff_mode    : Type of modulator for the cut Off (0 : ramp, 1: sine, 2: triangle, 3: expon segments
  kLFOCutOff_amp     : Amplitude of cut Off modulation in ]0,1]
  kLFOCutOff_freq    : Frequency of cut Off modulation in ]0,5]
  kLFOReson_on       : activate or not the LFO on the Resonnance
  kLFOReson_mode     : Type of modulator for the Resonance (0 : ramp, 1: sine, 2: triangle, 3: expon segments
  kLFOReson_amp      : Amplitude of resonance modulation in ]0,1]
  LFOReson_freq      : Frequency of resonance modulation
  */

  aIn,  kCutOff , kResonLoc, kPitchF_on, kPitchF_Val, kPitch, \
  kLFOCutOff_on, kLFOCutOff_mode,kLFOCutOff_amp, kLFOCutOff_freq  ,\
  kLFOReson_on, kLFOReson_mode,kLFOReson_amp, kLFOReson_freq     xin

  kRamp init 0
  kRamp1 init 0
  if kPitchF_on==1 then
      kCutOffLoc = kPitch * cent(kPitchF_Val)
  else
      kCutOffLoc =kCutOff
  endif

  if kLFOCutOff_on ==1 then
      if kLFOCutOff_mode ==0 then
          kRamp = (kRamp < 1 ? kRamp + 1/(kr*kLFOCutOff_freq) :1)
          kLFO_CutOff = kRamp*kLFOCutOff_amp
         /* iDur = i( kLFOCutOff_freq)
          kLFO_CutOff linsegr 0.01, 1 / iDur , i(kLFOCutOff_amp),0.1, i(kLFOCutOff_amp)*/
      endif
      if kLFOCutOff_mode == 1 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,0       ; Apply a sine waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==2 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,1       ; Apply a triangle waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==3 then
          kLFO_CutOff looptseg kLFOCutOff_freq,0,0,  1-0.5*kLFOCutOff_amp ,6,1,  1+0.5* kLFOCutOff_amp,6, 1, 1-0.5*kLFOCutOff_amp
      endif
  else
      kLFO_CutOff=1
  endif
  kCutOffLoc = kCutOffLoc*kLFO_CutOff
  ; Resonnace
  if kLFOReson_on ==1 then
      if kLFOReson_mode ==0 then
          kRamp1 = (kRamp1 < 1 ? kRamp1 + 1/(kr*kLFOReson_freq) :1)
          kLFO_Reson = kRamp1*kLFOReson_amp
        /*  iDur = i( kLFOReson_freq)
          kLFO_Reson linsegr 0.01, 1 / iDur , i(kLFOReson_amp),0.1, i(kLFOReson_amp)*/
      endif
      if kLFOReson_mode == 1 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,0       ; Apply a sine waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==2 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,1       ; Apply a triangle waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==3 then
          kLFO_Reson looptseg kLFOReson_freq,0,0,  kLFOReson_amp ,6,1,  0,6, 1,  kLFOReson_amp
      endif
  else
      kLFO_Reson=1
  endif
  kResonLoc = kResonLoc*kLFO_Reson
  aOutLoc moogladder2 aIn,  kCutOffLoc , kResonLoc
  xout aOutLoc
endop

 
 
;--------------------------------------------
;- Region: __2: OP LPF18

opcode My_LPF18, a, akkkkkkkkkkkkkk

  /*--------------------------------------------
  See MoogLadder for parameters
 
  kDistor : Amount of distorsion

  */
  aIn,  kCutOff , kResonLoc, kPitchF_on, kPitchF_Val, kPitch, \
  kLFOCutOff_on, kLFOCutOff_mode,kLFOCutOff_amp, kLFOCutOff_freq  ,\
  kLFOReson_on, kLFOReson_mode,kLFOReson_amp, kLFOReson_freq,\
  kDistor     xin

  
  kRamp init 0
  kRamp1 init 0
  
  if kPitchF_on==1 then
      kCutOffLoc = kPitch * cent(kPitchF_Val)
  else
      kCutOffLoc =kCutOff
  endif

  if kLFOCutOff_on ==1 then
      if kLFOCutOff_mode ==0 then
          kRamp = (kRamp < 1 ? kRamp + 1/(kr*kLFOCutOff_freq) :1)
          kLFO_CutOff = kRamp*kLFOCutOff_amp
         /* iDur = i( kLFOCutOff_freq)
          kLFO_CutOff linsegr 0.01, 1 / iDur , i(kLFOCutOff_amp),0.1, i(kLFOCutOff_amp)*/
      endif
      if kLFOCutOff_mode == 1 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,0       ; Apply a sine waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==2 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,1       ; Apply a triangle waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==3 then
          kLFO_CutOff looptseg kLFOCutOff_freq,0,0,   1-0.5*kLFOCutOff_amp ,6,1,  1+0.5* kLFOCutOff_amp,6, 1,  1-0.5*kLFOCutOff_amp
      endif
  else
      kLFO_CutOff=1
  endif
  kCutOffLoc = kCutOffLoc*kLFO_CutOff
  ; REsonnace
  if kLFOReson_on ==1 then
      if kLFOReson_mode ==0 then
          kRamp1 = (kRamp1 < 1 ? kRamp1 + 1/(kr*kLFOReson_freq) :1)
          kLFO_Reson = kRamp1 * kLFOReson_amp
        /*  iDur = i( kLFOReson_freq)
          kLFO_Reson linsegr 0.01, 1 / iDur , i(kLFOReson_amp),0.1, i(kLFOReson_amp)*/
      endif
      if kLFOReson_mode == 1 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,0       ; Apply a sine waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==2 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,1       ; Apply a triangle waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==3 then
          kLFO_Reson looptseg kLFOReson_freq,0,0,  kLFOReson_amp ,6,1,  0,6, 1, kLFOReson_amp
      endif
  else
      kLFO_Reson=1
  endif

  kResonLoc = kResonLoc*kLFO_Reson
  aOutLoc lpf18 aIn,  kCutOffLoc , kResonLoc ,kDistor
  xout aOutLoc
endop



;--------------------------------------------
;- Region: __3: OP BQREZ
;--------------------------------------------

opcode My_BQRez, a, akkkkkkkkkkkkkj

  /*--------------------------------------------
  See MoogLadder for parameters
 
  + imode : Select the type of the filter (see BQRez Csound manual page)

  */

  aIn,  kCutOff , kResonLoc, kPitchF_on, kPitchF_Val, kPitch, \
  kLFOCutOff_on, kLFOCutOff_mode,kLFOCutOff_amp, kLFOCutOff_freq  ,\
  kLFOReson_on, kLFOReson_mode,kLFOReson_amp, kLFOReson_freq ,imode    xin

  
  kRamp init 0
  kRamp1 init 0
  
  if kPitchF_on==1 then
      kCutOffLoc = kPitch * cent(kPitchF_Val)
  else
      kCutOffLoc =kCutOff
  endif

  if kLFOCutOff_on ==1 then
      if kLFOCutOff_mode ==0 then
          kRamp = (kRamp < 1 ? kRamp + 1/(kr*kLFOCutOff_freq) :1)
          kLFO_CutOff = kRamp*kLFOCutOff_amp
         /* iDur = i( kLFOCutOff_freq)
          kLFO_CutOff linsegr 0.01, 1 / iDur , i(kLFOCutOff_amp),0.1, i(kLFOCutOff_amp)*/
      endif
      if kLFOCutOff_mode == 1 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,0       ; Apply a sine waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==2 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,1       ; Apply a triangle waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==3 then
          kLFO_CutOff looptseg kLFOCutOff_freq,0,0,  1-0.5*kLFOCutOff_amp ,6,1,  1+0.5* kLFOCutOff_amp,6, 1, 1-0.5*kLFOCutOff_amp
      endif
  else
      kLFO_CutOff=1
  endif
  kCutOffLoc = kCutOffLoc*kLFO_CutOff
  ; REsonnace
  if kLFOReson_on ==1 then
      if kLFOReson_mode ==0 then
          kRamp1 = (kRamp1 < 1 ? kRamp1 + 1/(kr*kLFOReson_freq) :1)
          kLFO_Reson = kRamp1*kLFOReson_amp
         /* iDur = i( kLFOReson_freq)
          kLFO_Reson linsegr 0.01, 1 / iDur , i(kLFOReson_amp),0.1, i(kLFOReson_amp)*/
      endif
      if kLFOReson_mode == 1 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,0       ; Apply a sine waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==2 then
          kResonLFO lfo  kLFOReson_amp, kLFOReson_freq,1       ; Apply a triangle waveshape
          kLFO_Reson = (kResonLFO+1)*0.5
      endif
      if kLFOReson_mode ==3 then
          kLFO_Reson looptseg kLFOReson_freq,0,0,  kLFOReson_amp ,6,1,  0,6, 1,   kLFOReson_amp
      endif
  else
      kLFO_Reson=1
  endif
  kResonLoc = kResonLoc*kLFO_Reson*99+1
  aOutLoc bqrez aIn,  kCutOffLoc , kResonLoc ,imode
  aOutLoc balance aOutLoc, aIn
  xout aOutLoc
endop

    
    
;--------------------------------------------
;- Region: __4: OP TONEX
;--------------------------------------------

opcode My_Tonex, a, akkkkkkkkj
 
  /*--------------------------------------------
  The filter accepts the following parameters
  --  This filter is non resonant--

  aIn                : audio signal input
  kCutOff            : Cut Off Frequency
  kPitchF_on         : If user want to follow the pitch of the input note. If yes, then CutOff frequency is unused
  kPitchF_Val        : Factor to shift the pitch follow cut off (cent() of the note. Between -2400 and + 2400, @ octaves
  kPitch             : Pitch (freq) of the note played on keyborad
  kLFOCutOff_on      : activate or not the LFO on the CutOff Frequency
  kLFOCutOff_mode    : Type of modulator for the cut Off (0 : ramp, 1: sine, 2: triangle, 3: expon segments
  kLFOCutOff_amp     : Amplitude of cut Off modulation in ]0,1]
  kLFOCutOff_freq    : Frequency of cut Off modulation in ]0,5]
  iNbFilt             :  number of layer in TONE filter
  */
 
  aIn,  kCutOff ,  kPitchF_on, kPitchF_Val, kPitch, \
  kLFOCutOff_on, kLFOCutOff_mode,kLFOCutOff_amp, kLFOCutOff_freq,iNbFilt  xin
 
 
  kRamp init 0
 
 
  if kPitchF_on==1 then
      kCutOffLoc = kPitch * cent(kPitchF_Val)
  else
      kCutOffLoc =kCutOff
  endif

  if kLFOCutOff_on ==1 then
      if kLFOCutOff_mode ==0 then
          kRamp = (kRamp < 1 ? kRamp + 1/(kr*kLFOCutOff_freq) :1)
          kLFO_CutOff = kRamp*kLFOCutOff_amp
        /*  iDur = i( kLFOCutOff_freq)
          kLFO_CutOff linsegr 0.01, 1 / iDur , i(kLFOCutOff_amp),0.1, i(kLFOCutOff_amp)*/
      endif
      if kLFOCutOff_mode == 1 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,0       ; Apply a sine waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==2 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,1       ; Apply a triangle waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==3 then
          kLFO_CutOff looptseg kLFOCutOff_freq,0,0,   1-0.5*kLFOCutOff_amp ,6,1,  1+0.5* kLFOCutOff_amp,6, 1,  1-0.5*kLFOCutOff_amp
      endif
  else
      kLFO_CutOff=1
  endif

  kCutOffLoc = kCutOffLoc*kLFO_CutOff
  aOutLoc tonex aIn,  kCutOffLoc , iNbFilt
  xout aOutLoc
endop


;--------------------------------------------
;- Region: __5: OP ATONEX
;--------------------------------------------

opcode My_aTonex, a, akkkkkkkkj
 
  /*  See TONEX UDO for input values*/
 
  aIn,  kCutOff ,  kPitchF_on, kPitchF_Val, kPitch, \
  kLFOCutOff_on, kLFOCutOff_mode,kLFOCutOff_amp, kLFOCutOff_freq,iNbFilt  xin
  
  kRamp init 0
 
  if kPitchF_on==1 then
      kCutOffLoc = kPitch * cent(kPitchF_Val)
  else
      kCutOffLoc =kCutOff
  endif

  if kLFOCutOff_on ==1 then
      if kLFOCutOff_mode ==0 then
          kRamp = (kRamp < 1 ? kRamp + 1/(kr*kLFOCutOff_freq) :1)
          kLFO_CutOff = kRamp*kLFOCutOff_amp
         /* iDur = i( kLFOCutOff_freq)
          kLFO_CutOff linsegr 0.01, 1 / iDur , i(kLFOCutOff_amp),0.1, i(kLFOCutOff_amp)*/
      endif
      if kLFOCutOff_mode == 1 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,0       ; Apply a sine waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==2 then
          kCutOffLFO lfo  kLFOCutOff_amp, kLFOCutOff_freq,1       ; Apply a triangle waveshape
          kLFO_CutOff = (kCutOffLFO+2)*0.5
      endif
      if kLFOCutOff_mode ==3 then
          kLFO_CutOff looptseg kLFOCutOff_freq,0,0,  1-0.5*kLFOCutOff_amp ,6,1 ,  1+0.5* kLFOCutOff_amp,6, 1,   1-0.5*kLFOCutOff_amp
      endif
  else
      kLFO_CutOff=1
  endif

  kCutOffLoc = kCutOffLoc*kLFO_CutOff
  aOutLoc atonex aIn,  kCutOffLoc , iNbFilt
  xout aOutLoc
endop




