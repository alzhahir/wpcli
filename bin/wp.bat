@ECHO OFF

where php >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
  echo [91mERROR: PHP is missing or are not added to the PATH! Please install PHP and add it to the PATH system environment variable.[0m
  exit 1
)

IF NOT EXIST "%~dp0..\vendor\wp-cli.phar" (
  echo [91mERROR: WP-CLI core is missing! Run wpcli-update.ps1 to download the core file.[0m
  exit 1
)

php "%~dp0..\vendor\wp-cli.phar" %*