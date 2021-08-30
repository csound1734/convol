@ECHO OFF
:BEGIN
CLS
ECHO AUTO CSOUND 
ECHO %DATE%
ECHO %TIME%
::clear the current-date file
copy /y nul rundatet.txt
ECHO %DATE% %TIME% >> rundatet.txt
CHOICE /C 123456789 /M "Press 1 or any other number button to select a csound file"
IF ERRORLEVEL=2 GOTO TWO
IF ERRORLEVEL=1 GOTO ONE
GOTO NOTONE
:ONE
ECHO cs1.csd SELECTED
csound cs1.csd -odac -O log.txt
::parse the current-date file into tokens and use to rename the csound log with date and time
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do rename "log.txt" %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.txt
::open the csound log by parsing the current-date file into tokens and calling notepad. This cannot be done with %date%.
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do notepad %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.txt
echo Finished csound performance. Your csound log is located in %d-%e-%f-%g-%h-%i-%j-%k-%l-%m.txt
copy /y nul rundatet.txt
GOTO END
:TWO
ECHO cs2.csd SELECTED
csound cs2.csd -o runoutput.wav -O log.txt
::parse the current-date file into tokens and use to rename the csound log with date and time
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do rename "log.txt" %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.txt
::open the csound log by parsing the current-date file into tokens and calling notepad. This cannot be done with %date%.
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do notepad %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.txt
::parse the current-date file into tokens and use to rename the csound output file with date and time
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do rename "runoutput.wav" %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.wav
::parse the current-date file into tokens and use to copy the csound ouput file to the sample directory
for /f "tokens=1-10 delims=/:.- " %%d in (rundatet.txt) do copy %%d-%%e-%%f-%%g-%%h-%%i-%%j-%%k-%%l-%%m.wav .\s
echo Finished csound performance. Your csound log is located in %d-%e-%f-%g-%h-%i-%j-%k-%l-%m.txt
copy /y nul rundatet.txt
copy /y nul runoutput.wav
GOTO END
:NOTONE
ECHO YOU PRESSED ANOTHER NUMBER
:END
pause
