﻿$packageName = 'opswatsecurityscore'
$installerType = 'msi'
$url = 'http://software.opswat.com/securityscore/installer/OPSWATSecurityScore.msi'
$silentArgs = '/qb'
$validExitCodes = @(0,3010) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

try {

	Install-ChocolateyPackage $packageName $installerType $silentArgs $url -validExitCodes $validExitCodes
	
	Write-ChocolateySuccess $packageName
	
} catch {
	Write-ChocolateyFailure $packageName $($_.Exception.Message)
	throw 
}