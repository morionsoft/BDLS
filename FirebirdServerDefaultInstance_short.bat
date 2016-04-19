@Echo Off
SetLocal EnableDelayedExpansion
Set ServiceName=FirebirdServerDefaultInstance
Net Stop %ServiceName%||(
	For /F "tokens=3" %%A In ('SC queryex %ServiceName%^|Find "PID"') Do (
	            TaskKill /F /PID %%A>nul
	            Ping -n 5 127.0.0.1>nul
	)
) 
del D:\SoftInform\MorionOld\Database\short\*.rar 
"C:\Program Files\WinRAR\winrar.exe" a -m3 -ep -dh -inul -rr MDRUGS D:\SoftInform\MorionOld\Database\short\MDRUGS.GDB
Net Start %ServiceName% 
ncftpput.exe -R -z -r 10 -v -u "" -p "" "193.111.9.200" /MORION/morion/short D:\SoftInform\MorionOld\Database\short\mdrugs.rar
pause