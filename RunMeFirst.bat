@Echo Off

SET BootstrapScript=%CD%\Bootstrap.ps1 

PowerShell -NoProfile -ExecutionPolicy Unrestricted -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Unrestricted -File ""%BootstrapScript%""' -Verb RunAs}";
