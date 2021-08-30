<CsoundSynthesizer>
<CsOptions>
; August 23rd 2019
</CsOptions>
<CsInstruments>
sr=44100
ksmps=44.1
nchnls=1

instr 188 ;for 3 mono samples
ioutbuf ftgen 0, 0, (2^23), -2, 0
ampfactor = 1/(p7^3) ;scale by p7 3 times
as1 loscil 1, 1, p4, 1, 0
acv1 ftconv as1, p5, 65536
acv2 ftconv acv1, p6, 65536
alm tablei acv2*ampfactor, p8, 0, ftlen(p8)/2, 0 ;waveshaper (select effect using p11)
out alm
endin



instr 191 ;for 6 mono samples
ioutbuf ftgen 0, 0, (2^23), -2, 0
ampfactor = 1/(p10^5) ;scale by p10 5 times
as1 loscil 1, 1, p4, 1, 0
acv1 ftconv as1, p5, 65536
acv2 ftconv acv1, p6, 65536
acv3 ftconv acv2, p7, 65536
acv4 ftconv acv3, p8, 65536
acv5 ftconv acv4, p9, 65536
alm tablei acv5*ampfactor, p11, 0, ftlen(p11)/2, 0 ;waveshaper (select effect using p11)
out alm
endin

</CsInstruments>
<CsScore>

;begin soundfile input
f 1 0 65536 1 "D:/hopsed/s/237105.wav" 0 0 1 ;ting1
f 2 0 65536 1 "D:/hopsed/s/237106.wav" 0 0 1 ;ting2
f 3 0 [65536*2] 1 "D:/hopsed/s/196733.wav" 0 0 1 ;crash1
f 4 0 [65536*2] 1 "D:/hopsed/s/171479.wav" 0 0 1 ;crash2
f 5 0 [65536*2] 1 "D:/hopsed/s/153404.wav" 0 0 1 ;crash3
f 6 0 [65536*2] 1 "D:/hopsed/s/425431.aiff" 0 0 1 ;crash4
f 7 0 [65536*2] 1 "D:/hopsed/s/91790.aiff" 0 0 1 ;crash5
f 8 0 [65536*2] 1 "D:/hopsed/s/213943.wav" 0 0 1 ;crash6
f 9 0 65536 1 "D:/hopsed/s/344209.wav" 0 0 1 ;kiss1
f 10 0 65536 1 "D:/hopsed/s/3538.wav" 0 0 1 ;tonk1
f 11 0 65536 1 "D:/hopsed/s/3543.wav" 0 0 1 ;tonk2
f 12 0 [65536*2] 1 "D:/hopsed/s/176760.wav" 0 0 1 ;egg1
f 13 0 [65536*2] 1 "D:/hopsed/s/176761.wav" 0 0 1 ;egg2
;end

;begin waveshaping functions
f 101127 0 [65536*2] -7 -32768 [32768] -32768 65536 32768 [32768] 32768 ;wavefolding limiter
f 10805 0 [65536*2] "tanh" -1 1 0
f 10807 0 [65536*2] -24 10805 -32768 32768
f 12234 0 [65536*2] -19 1 32768 180 0
f 12235 0 [65536*2] -19 2 32768 180 0
;end

;begin performance
/*
; --------   sound inputs - scale - waveshaper
i 196 00 20   10 9 12 6 7 8   3     10807
i 196 05 20   11 9 12 6 7 8   3     10807
i 196 10 20   10 9 13 6 3 8   3     10807
i 196 15 20   11 9 13 6 3 8   3     10807
i 196 20 20   10 9 12 4 3 8   3     10807
i 196 25 20   11 9 13 4 3 8   3     10807
*/
t 0 57 8 62 16 57
i 188 00 10   10 3 12         .25     10807
i 188 02 10   11 3 12         .     10807
i 188 05 10   10 3 13         .     10807
i 188 07 10   11 3 13         .     10807
;end

f 0 2

</CsScore>
</CsoundSynthesizer>
