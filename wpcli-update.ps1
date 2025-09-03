# $Host.UI.RawUI.WindowTitle = "WPCLI Updater"

Write-Host "WPCLI Updater"
Write-Host ""

# wp-cli.phar download source
$Url = "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
Write-Host "Downloading latest " -NoNewLine
Write-Host "wp-cli.phar" -ForegroundColor Cyan -NoNewLine
Write-Host " from " -NoNewLine
Write-Host "$Url" -ForegroundColor DarkYellow

Write-Host ""

# destination directory, currently <workdir>\bin\<file>
$OutFile = Join-Path -Path $PSSCriptRoot -ChildPath "vendor\wp-cli.phar"
Write-Host "Saving the file to " -NoNewLine
Write-Host "$OutFile" -ForegroundColor DarkYellow


$OutPath = Join-Path -Path $PSSCriptRoot -ChildPath "vendor"
if ((Test-Path -Path $OutPath) -ne $True) {
  Write-Host ""
  Write-Host "Folder is missing... Creating new folder... " -NoNewLine
  New-Item -Path $OutPath -ItemType Directory >nul
  Write-Host "Done!" -ForegroundColor Green
}

Write-Host ""

# begin download process
Write-Host "Downloading... " -NoNewLine
Invoke-WebRequest -Uri $Url -OutFile $OutPath
Write-Host "Done!" -ForegroundColor Green

$FinalDir = Join-Path -Path $PSSCriptRoot -ChildPath "bin\wp.bat"
Write-Host ""
Write-Host "You can now use WP-CLI via $FinalDir"