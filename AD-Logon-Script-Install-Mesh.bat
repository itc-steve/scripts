 @echo off
if EXIST "C:\Program Files\Mesh Agent\MeshAgent.exe" GOTO END
start "" "\\servername\sharedfolder\meshagent64-Unsorted.exe" -fullinstall
:END