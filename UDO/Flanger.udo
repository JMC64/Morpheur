
;*****************************************************
;- Region: _1: Flanger
;*****************************************************
opcode Flanger,a,akkk
/*
 aIn : Audio input 
 kFlgDepth : Depth of flanger, between 0 and 200
 kFlgFreq : Freq of flanger, between 0 and 200
 kFeedBck  : FeedBack amount between 0 and 1.0 
 
 kFlgDepth init 20
 kFlgFreq init 20
 kFeedBck init 0.5
 
  */
  aIn,kFlgDepth,kFlgFreq,kFeedBck  xin
  aDel    lfo kFlgDepth/2000, kFlgFreq/2000
  aOut flanger aIn,   aDel, kFeedBck
  xout aOut
endop
