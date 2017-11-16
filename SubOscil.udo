opcode SubOscillator, aa,aaakkii
/*
   Apply a suboscillator to an audio signal 
   inputs : 
   aIn1 :Audio 1 correspond to audio signal generated with iTableOscA at pitch kPitch
   aIn2 :Audio 2 correspond to audio signal generated with iTableOscB at pitch kPitch
   aPitch : pitch of the note  ( The pitch must be transformed into audio signal beforehand 
			if user wants to send FM to it
   kOctave : Number of octave to apply
   kMix : Mixer When 1 full suboscil, if 0, not suboscil audio 
    iTableOscA, iTableOscB : Table for generating the signal 
*/
	aIn1,aIn2, aPitch ,kOctave,kMix, iTableOscA,iTableOscB xin
if kOctave !=0 then 
	aSubPitch = aPitch * octave(kOctave)
	aSub1 poscil 1,aSubPitch, iTableOscA
	aSub2 poscil 1,aSubPitch, iTableOscB
	aOut1 sum aIn1*(1-kMix),aSub1*kMix
	aOut2 sum aIn2*(1-kMix),aSub2*kMix
else 
	aOut1 sum aIn1
	aOut2 sum aIn2
endif
	xout aOut1,aOut2
endop
 