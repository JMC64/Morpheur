

opcode FM,a,kkki

  kPitch, kFreqMod, kAmpMod,iTableFM xin

  if kFreqMod !=0 || kAmpMod !=0 then
      kmod_frq    = kPitch    * kFreqMod
      kamp    = kmod_frq * kAmpMod
      aoscil      poscil kamp, kmod_frq, iTableFM
  else
      aoscil = 0
  endif

  xout aoscil
endop
