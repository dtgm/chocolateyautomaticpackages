﻿$packageName = '{{PackageName}}'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

$processor = Get-WmiObject Win32_Processor
  $is64bit = $processor.AddressWidth -eq 64
  if ($is64bit) {
    $url = '{{DownloadUrlx64}}'
    #$url = 'http://surfnet.dl.sourceforge.net/project/peazip/{version}/peazip-{version}.WIN64.exe'
  } else {
    $url = '{{DownloadUrl}}'
    #$url = 'http://surfnet.dl.sourceforge.net/project/peazip/{version}/peazip-{version}.WINDOWS.exe'
  }

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"  -validExitCodes $validExitCodes
