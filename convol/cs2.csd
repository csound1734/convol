<CsoundSynthesizer>
<CsOptions>
; August 23rd 2019
</CsOptions>
<CsInstruments>
sr=44100
ksmps=44.1
nchnls=1

instr 187 ;for 2 mono samples
ampfactor = 1/(p6^2) ;scale by p6 2 times
printf_i "Convolving table %f with table %f \n", 1, p4, p5
as1 loscil 1, 1, p4, 1, 0
acv1 ftconv as1, p5, 65536
alm tablei acv1*ampfactor, p7, 0, ftlen(p7)/2, 0 ;waveshaper (select effect using p11)
out alm
endin

instr 188 ;for 3 mono samples
ampfactor = 1/(p7^3) ;scale by p7 3 times
printf_i "Convolving table %f, %f, and %f \n", 1, p4, p5, p6
as1 loscil 1, 1, p4, 1, 0
acv1 ftconv as1, p5, 65536
acv2 ftconv acv1, p6, 65536
alm tablei acv2*ampfactor, p8, 0, ftlen(p8)/2, 0 ;waveshaper (select effect using p11)
out alm
endin



instr 191 ;for 6 mono samples
ampfactor = 1/(p10^5) ;scale by p10 5 times
printf_i "Convolving table %f, %f, %f, %f, %f, and %f \n", 1, p4, p5, p6, p7, p8, p9
as1 loscil 1, 1, p4, 1, 0
acv1 ftconv as1, p5, 65536
acv2 ftconv acv1, p6, 65536
acv3 ftconv acv2, p7, 65536
acv4 ftconv acv3, p8, 65536
acv5 ftconv acv4, p9, 65536
alm tablei acv5*ampfactor, p11, 0, ftlen(p11)/2, 0 ;waveshaper (select effect using p11)
out alm
endin

instr 196 ;for 11 mono samples
ampfactor = 1/(p10^5) ;scale by p10 5 times
printf_i "Convolving table %f, %f, %f, %f, %f, and %f \n", 1, p4, p5, p6, p7, p8, p9
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

#include "./scores/sco1.txt"

</CsScore>
</CsoundSynthesizer>