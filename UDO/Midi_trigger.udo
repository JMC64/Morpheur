

opcode	MIDI_trigger_instrument,0,	ii				;INPUT ARGUMENT FOR INSTRUMENT NUMBER OF THE INSTRUMENT TO BE TRIGGERED AND THE MIDI CHANNEL ON WHICH TRIGGERING WILL OCCUR (VALUE OF ZERO HERE MEANS THAT NOTES WILL BE TRIGGERED ON ALL CHANNELS)
	
	insno,ichan	xin						;READ IN INPUT ARGUMENTS
	
	gkAftouch=0		
	kstatus, kchan, kdata1, kdata2  midiin				;READ IN MIDI
		
	if kchan==ichan||ichan==0 then					;IF A MESSAGE ON THE CORRECT CHANNEL HAS BEEN RECEIVED (OR ON ANY CHANNEL IF CHANNEL WAS DEFINED AS ZERO)
	    if kstatus==144 then						;IF MIDI MESSAGE IS A NOTE...
	        if kdata2>0 then						;IF VELOCITY IS MORE THAN ZERO, I.E. NOT A NOTE OFF
	 	        event "i",insno+(kdata1*0.001),0,-1,kdata1,kdata2	;TRIGGER INSTRUMENT WITH A HELD NOTE. NOTE NUMBER TRANSMITTED AS p4, VELOCITY AS p5
	        else								;OTHERWISE (I.E. MUST BE A NOTE OFF / ZERO VELOCITY)
	            turnoff2	insno+(kdata1*0.001),4,1			;TURN OFF INSTRUMENT WITH THIS SPECIFIC FRACTIONAL NOTE NUMBER
	        endif									;END OF CONDITIONAL BRANCH
	    elseif kstatus==128 then					;IF MESSAGE USES A 'NOTE OFF' STATUS BYTE (128)
	        gkAfttch=0
	        turnoff2	insno+(kdata1*0.001),4,1			;TURN OFF INSTRUMENT WITH THIS SPECIFIC FRACTIONAL NOTE NUMBER
	    elseif kstatus==208 then
			/* Aftertouch */ 
            gkAfttch = kdata1/127 ; between 0 and 1
		elseif kstatus==224 then
			/* Pitch Bend */
			printks "kstatus %d    kchan %d    data1 : %d    data2 %d  \n",0,kstatus,kchan,kdata1,kdata2
			gkPitchBend pchbend  0,12
		endif
	endif								;END OF CONDITIONAL BRANCH
endop

