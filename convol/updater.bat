@ECHO OFF
ECHO Welcome to AUTO CSOUND.
ECHO First verify the following so the program can be updated.
ECHO The latest version of the code should be in the first file. The second must exist.
Pause
ECHO Should I go ahead with copying (updating the AUTOSOUND.bat file)?
ECHO Select Yes to copy csd1.txt as the file AUTOCSOUND.bat
XCOPY cs1.txt AUTOCSOUND.bat/P
ECHO AUTOCSOUND.bat has been updated. Press any key to run the new script.
PAUSE
CALL AUTOCSOUND.bat
PAUSE