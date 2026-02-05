@echo off

set NEOFORGE_VERSION=21.1.219
set INSTALLER="%~dp0neoforge-%NEOFORGE_VERSION%-installer.jar"
set NEOFORGE_URL="https://maven.neoforged.net/releases/net/neoforged/neoforge/%NEOFORGE_VERSION%/neoforge-%NEOFORGE_VERSION%-installer.jar"

setlocal
cd /D "%~dp0"
if not exist "libraries" (
    echo NeoForge not installed, installing now.
    if not exist %INSTALLER% (
        echo No NeoForge installer found, downloading from %NEOFORGE_URL%
        bitsadmin.exe /rawreturn /nowrap /transfer forgeinstaller /download /priority FOREGROUND %NEOFORGE_URL% %INSTALLER%
    )
    
    echo Running NeoForge installer.
    java -jar %INSTALLER% -installServer
)

java @user_jvm_args.txt @libraries\net\neoforged\neoforge\%NEOFORGE_VERSION%\win_args.txt nogui