@echo off
call :GET_CURRENT_DIR
cd %THIS_DIR%
IF NOT EXIST %APPDATA%\ZcashParams (
MKDIR %APPDATA%\ZcashParams
)
IF NOT EXIST %APPDATA%\ZcashParams\sprout-proving.key (
    ECHO Downloading Zcash trusted setup sprout-proving.key, this may take a while ...
    .\wget64.exe --progress=dot:giga --continue --retry-connrefused --waitretry=3 --timeout=30 https://z.cash/downloads/sprout-proving.key -O %APPDATA%\ZcashParams\sprout-proving.key
)
IF NOT EXIST %APPDATA%\ZcashParams\sprout-verifying.key (
    ECHO Downloading Zcash trusted setup sprout-verifying.key, this may take a while ...
    .\wget64.exe --progress=dot:giga --continue --retry-connrefused --waitretry=3 --timeout=30 https://z.cash/downloads/sprout-verifying.key -O %APPDATA%\ZcashParams\sprout-verifying.key
)
goto :EOF
:GET_CURRENT_DIR
pushd %~dp0
set THIS_DIR=%CD%
popd
goto :EOF

