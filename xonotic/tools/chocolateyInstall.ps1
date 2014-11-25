﻿$packageName = '{{PackageName}}'
$url = '{{DownloadUrl}}' 
$unzipLocation = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$processor = Get-WmiObject Win32_Processor
$is64bit = $processor.AddressWidth -eq 64

try {
	
	Install-ChocolateyZipPackage $packageName $url $unzipLocation
	
	if ($is64bit) {
    $targetFilePath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\Xonotic\xonotic-x64.exe"
	} else {
    $targetFilePath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\Xonotic\xonotic.exe"
	}
    
    Install-ChocolateyDesktopLink $targetFilePath
	
	# the following is all part of error handling
    Write-ChocolateySuccess $packageName
}   catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}