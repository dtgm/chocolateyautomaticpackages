﻿$packageName = 'mucommander'
$installerType = 'EXE'
#$url = 'http://www.mucommander.com/download/{anchor1}.exe'
$url = 'http://www.mucommander.com/download/mucommander-0_9_0.exe'
$silentArgs = '/S'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes