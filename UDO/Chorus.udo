;*****************************************************
;- Region: _2:Chorus
;*****************************************************




/*****************************************************
asig Chorus ain,kf,kmin,kmax
ain - input signal
kf - noise generator frequency
kmin - min delay
kmax - max delay
kmix   mixing delayed and input signal 
Values : 
kf - 0.2
kmin - 14
kmax - 20
kmix - 0.5
*****************************************************/

/*
opcode Chorus,a,akkkk
  asig,kf,kmin,kmax,kmix xin
   
  ;iSine	 ftgentmp	0, 0, 4097, 10, 1						; sine wave
  kmin=kmin/1000
  kmax=kmax /1000
  
  idel = 0.1
  im = 2/sr
  km = kmin < kmax ? kmin : kmax
  kmx = kmax > kmin ? kmax : kmin
  kmx = (kmx < idel ? kmx : idel)
  km = (km > im ? km : im)
  kwdth = kmx - km
  amod  poscil3     kwdth, kf, giSine,0
  amod2  poscil3     kwdth, kf, giSine,0.25
  amod = (amod + kwdth)/2
  amod2 = (amod2 + kwdth)/2
  admp delayr idel
  adel deltap3 amod+km
  adel2 deltap3 amod2+km
  delayw asig
  aOut sum adel*0.5*sqrt(kmix), adel2*.5*sqrt(kmix), asig*(1-sqrt(kmix))
  xout adel + asig
endop


  opcode ensembleChorus, aa, akkkkiip
;kdpth 0 - kdelay, kmin/max = cps
ain, kdelay, kdpth, kmin, kmax, inumvoice, iwave, icount xin
incr = 1/(inumvoice)

if (icount == inumvoice) goto out
ainl, ainr ensembleChorus ain, kdelay, kdpth, kmin, kmax, inumvoice, iwave, icount + 1

out:

max:
imax = i(kmax)
if (kmax != imax) then 
reinit max
endif

iratemax unirand imax
rireturn
alfo oscil kdpth, iratemax + kmin, iwave
adel vdelay3 ain/(inumvoice * .5), (kdelay + alfo) * 1000, 1000
al = ainl + adel * incr * icount
ar = ainr + adel * (1 - incr * icount)
xout al, ar
  endop

*/

opcode MyChorus,a,akkkkk
 aInL, kChorus_On, kMix, kDepth, kRate, kOffset xin
    if kChorus_On==1 then
      aDepth interp kDepth
      iChorWave =giSine
        aDelayTime1     oscili  0.5, kRate, iChorWave, 0        ; delay time oscillator (LFO)
        aDelayTime2     oscili  0.5, kRate, iChorWave, 0.25     ; delay time oscillator (LFO)
         aDelayTime3     oscili  0.5, kRate, iChorWave, 0.5     ; delay time oscillator (LFO)
        aDelayTime1     = ((aDelayTime1+0.5)*aDepth)+kOffset    ; scale and offset LFO
        aDelayTime2     = ((aDelayTime2+0.5)*aDepth)+kOffset    ; scale and offset LFO
         aDelayTime3     = ((aDelayTime3+0.5)*aDepth)+kOffset    ; scale and offset LFO
        iMaxDelay       = 1                                     ; max delay time
        iWindowSize     = 4                                     ; interpolation size
        aChorusL1        vdelayx aInL, aDelayTime1*0.001, iMaxDelay, iWindowSize   
        aChorusL2        vdelayx aInL, aDelayTime2*0.001, iMaxDelay, iWindowSize     
        aChorusL3        vdelayx aInL, aDelayTime3*0.001, iMaxDelay, iWindowSize     
        
        aOutL         sum  aInL*(1-kMix),aChorusL1*kMix,aChorusL2*kMix,aChorusL3*kMix

        aOutL =aOutL 

    else 
      aOutL=  aInL

    endif
 xout            aOutL
endop
