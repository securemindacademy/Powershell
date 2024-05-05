
$moduleLoggingPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging"
if (-not (Test-Path $moduleLoggingPath)) {
    New-Item -Path $moduleLoggingPath -Force
}

# Create the ModuleNames subkey under ModuleLogging
$moduleNamesPath = "$moduleLoggingPath\ModuleNames"
if (-not (Test-Path $moduleNamesPath)) {
    New-Item -Path $moduleNamesPath -Force
}

# Now set the properties
Set-ItemProperty -Path $moduleLoggingPath -Name "EnableModuleLogging" -Value "1"
Set-ItemProperty -Path $moduleNamesPath -Name "*" -Value "*"

# Similarly for ScriptBlockLogging
$scriptBlockLoggingPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
if (-not (Test-Path $scriptBlockLoggingPath)) {
    New-Item -Path $scriptBlockLoggingPath -Force
}
Set-ItemProperty -Path $scriptBlockLoggingPath -Name "EnableScriptBlockLogging" -Value "1"

# And for Transcription
$transcriptionPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
if (-not (Test-Path $transcriptionPath)) {
    New-Item -Path $transcriptionPath -Force
}
Set-ItemProperty -Path $transcriptionPath -Name "EnableTranscripting" -Value "1"
Set-ItemProperty -Path $transcriptionPath -Name "OutputDirectory" -Value "C:\Users\SangNguyen\Desktop\" # Change path as needed

Restart-Service -Name WinRM
gpupdate /force
