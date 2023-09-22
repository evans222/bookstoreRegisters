@ECHO OFF
ECHO Current service status:
powershell -command "Get-Service -displayname ""Freeway*"""
ECHO Stopping services...
powershell -command "Stop-Service -displayname ""Freeway Client Service""" -Force
powershell -command "Stop-Service -displayname ""Freeway Server Service""" -Force

powershell -command "Get-Service -displayname ""Freeway*"""
ECHO Starting services...
powershell -command "Start-Service -displayname ""Freeway Client Service"""
powershell -command "Start-Service -displayname ""Freeway Server Service"""

powershell -command "Get-Service -displayname ""Freeway*"""

PAUSE