@REM =========================================================================
@REM  Environment Setup Script
@REM  ------------------------
@REM  Bootstraps the environment setup. Grabs Chocolatey, installs apps with
@REM  it, and tweaks app and system settings.
@REM =========================================================================

@Echo off

echo Running Windows Environment Setup...

REM ==============================================
REM  Install Chocolatey
REM ==============================================

powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

REM ==============================================
REM  Apps
REM ==============================================

cinst google-chrome-x64
cinst notepadplusplus
cinst hxd
cinst paint.net
cinst agentransack
cinst nuget.commandline
cinst bind-toolsonly

REM ==============================================
REM  Git
REM ==============================================

cinst git
cinst git-credential-winstore

git config --global user.name "Alex Novak"
git config --global user.email "alexwnovak@gmail.com"
git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"

REM ==============================================
REM  Terminal
REM ==============================================



REM ==============================================
REM  Todo
REM ==============================================

REM Configure Notepad++ with scheme/colors?
REM Pin apps to the taskbar
REM PowerShell execution policy
REM Set up PoshGit terminal stuff
REM Get my profile/aliases for PowerShell
REM Pin a shortcut with my font/colors for PowerShell
