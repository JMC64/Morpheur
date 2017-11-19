opcode Envelop, k, kkkkk
/* 
Inputs: 
	-kMode : Type of enveloppe
	-kAttk
	-kDecay
	-kSustain
	-kRelease

Output kEnv  :  Enveloppe at krate
  */
  kMode,	kAttk, kDecay, kSustain, kRelease xin

  if kMode == 1     then
      kEnv linenr kSustain, i(kAttk), i(kDecay), i(kRelease)  ; A revoir
  endif
  if kMode == 2 then
      kEnv madsr  i(kAttk), i(kDecay),i(kSustain), i(kRelease)
  endif
  if kMode == 3 then
      kEnv mxadsr  i(kAttk), i(kDecay),i(kSustain), i(kRelease)
  endif
  if kMode == 4 then
      kEnv linsegr  0, i(kAttk),i(kSustain),i(kDecay),i(kSustain), 0.1,1,i(kRelease) , 0
  endif
  xout kEnv
endop
  