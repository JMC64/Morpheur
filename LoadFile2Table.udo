/*
OPCODE for LOADING SOUNDFILE INTO SOUNDFILER
AND A GEN01 TABLE

Input : 
	SFilePath :Path to the file 
	iTableNumber : : Number of the table to be created
	
	The table is create for the whole CSD and reachable from any other part of the code
	First time it is called, the table number should be 0
	After calling with a number will replace the content of the table.

Output :
itableOsc : Table Number
ichansOsc : Number of channels in the table
kTabLenOsc : Length of the table
	

Note : 
Csound allocates a new table number any time ftgen is called, (and it seems to keep track of the latest allocated table)
Therefore, calling the UDO 3 times in a row, creates 3 different tables., but like I did ( I am lucky for once), writing an UDO with a table number both as input and as output allows to rewrite the table if the input value is not 0.
i.e
giOscTable LoadSoundFile SPath,giOscTable
First call with 0 as input for table number, will create a brand new table

giOscTable1 LoadSoundFile SPath,giOscTable1
will allocate a new table because the input is also 0 but , calling again

giOscTable LoadSoundFile SPath,giOscTable
will rewrite the table giOscTable because the value is not 0, but the value of an already allocated table.

*/


opcode	LoadSoundFile2,iik,jS	; load sound file into a table
    ;SFilePath,
	iTableNumber,SButtonFileChannel xin
	SFilePath chnget SButtonFileChannel
reinit Foo
Foo:	
  if filevalid(SFilePath) ==1 then
          itableOsc	ftgen	iTableNumber,0,0,1,SFilePath,0,0,0		; load sound file into a GEN 01 function table
       ;   prints "table number %d", i(kTableNumber)
		  ichansOsc	filenchnls	SFilePath			; derive the number of channels (mono=1,stereo=2) in the sound file
          kTabLenOsc	init		ftlen(itableOsc)/ichansOsc		; table length in sample frames      
      else
          printks "File no valid \n",0
      endif
rireturn
xout itableOsc,ichansOsc,kTabLenOsc

endop


;===================================================================================
; LoadSoundFile UDO
; usage:
;
;   LoadSoundfile SFileButtonChannel,SFileButtonIdentChannel, STableNumberChannel
;
;   SFileButtonChannel: channel given to filebutton that is used to browse for soundfile
;   SSoundfilerIdentChannel: soundfiler ident channel 
;   STableNumberChannel: channel use to access table number that was asigned to soundfile
;
;===================================================================================
opcode	LoadSoundfile,0,SSS	                                                ; load sound file into a table
    SFileButtonChannel,SFileButtonIdentChannel, STableNumberChannel xin                                
   
	kTableNum chnget STableNumberChannel
	
    if changed:k(chnget:S(SFileButtonChannel))==1 then 
		SFilePath chnget SFileButtonChannel
        reinit RELOAD_FILE_TO_TABLE
   
        RELOAD_FILE_TO_TABLE:
		
        if filevalid(SFilePath) ==1 then			
			itableOsc	ftgen	i(kTableNum),0,0,1,SFilePath,0,0,0		; load sound file into a GEN 01 function table
			prints "table number %d", itableOsc
            chnset itableOsc, STableNumberChannel 
            SMessage sprintfk "file(%s)", SFilePath           
            chnset SMessage, SFileButtonIdentChannel                        ; show file in soundfiler              
        else
            printks "Filename is not valid \n", 0
        endif
        rireturn
    endif 
	;xout itableOsc
endop
