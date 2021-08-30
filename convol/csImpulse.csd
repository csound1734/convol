<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr=44100
ksmps=44.1
nchnls=1

instr 23
ifund = 220
kamp linseg 0, 0.001, 1, p3/5, .250, 3*p3/5, .150, p3/5, 0
icosfn ftgenonce 0,0,32768,11,1,5
amaster mpulse 1, 1/ifund
iformf random 550,1190 
kspline jspline .65, 5, 7
aslave, asyncout syncphasor iformf*(1+kspline), amaster
aosc tablei aslave, icosfn, 1, 0, 1
out aosc*kamp*15000
endin

</CsInstruments>
<CsScore>
{8 x
i 23 [$x*1.5] 1
}
</CsScore>
</CsoundSynthesizer>