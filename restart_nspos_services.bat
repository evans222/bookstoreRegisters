@ECHO OFF
ECHO Current service status:
powershell -command "Get-Service -displayname ""NSPOS*"""
ECHO Stopping services...
powershell -command "Stop-Service -displayname ""NSPOS AutoUpdater""" -Force
powershell -command "Stop-Service -displayname ""NSPOS Management Scripts Agent""" -Force
powershell -command "Stop-Service -displayname ""NSPOS Monitoring Agent""" -Force
powershell -command "Stop-Service -displayname ""NSPOS MySQL""" -Force
powershell -command "Stop-Service -displayname ""NSPOS Replication Agent""" -Force

powershell -command "Get-Service -displayname ""NSPOS*"""
ECHO Starting services...
powershell -command "Start-Service -displayname ""NSPOS AutoUpdater"""
powershell -command "Start-Service -displayname ""NSPOS Management Scripts Agent"""
powershell -command "Start-Service -displayname ""NSPOS Monitoring Agent"""
powershell -command "Start-Service -displayname ""NSPOS MySQL"""
powershell -command "Start-Service -displayname ""NSPOS Replication Agent"""

powershell -command "Get-Service -displayname ""NSPOS*"""

PAUSE