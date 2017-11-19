/*
Given a Frequence for Morphing (kFreq_Morph) the sound 
and the shape of Morphing (kFlagMorph): 
	1: sine, 
	2: triangle 
	3: Exponential segments, 
	4 :or no cycles (from A to B)
if the frequence of Morphing is 0 then it send 0.5, allowing  mixing the 2 sounds in equal parts
*/
opcode Morphing, k,kk
kweightpoint init 0

kFreq_Morph, kFlagMorph xin
if kFreq_Morph >0 then 
	if kFlagMorph==1 then                                                              ; calculate the curve for morphing depending on choice
		kweightpoint lfo 1, kFreq_Morph
		kweightpoint= (kweightpoint+1)/2
	endif
	if kFlagMorph==2 then
		kweightpoint oscil 1,kFreq_Morph,giTriangle
		;kweightpoint loopseg kFreq_Morph,0, 0.0,0.0,  1.0, 1,  2.0, 0
	endif
	if kFlagMorph==3 then
		kweightpoint looptseg kFreq_Morph,0,0,            0,6,1,   1,6, 1,   0
	endif
	if kFlagMorph==4 then
		 kweightpoint = (kweightpoint<1 ? kweightpoint+ 1/(kr*kFreq_Morph) : 1) 
	endif
else 
	kweightpoint = k(0.5)
endif
xout kweightpoint
endop

