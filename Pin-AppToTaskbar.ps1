#============================================================================
# Pin-AppToTaskbar
# ----------------
# Uses the Windows Script Host object model to pin the specified app to the
# task bar. WSH seems to be the only guy that can do it.
#============================================================================

if ( $args.Length -eq 0 )
{
   Write-Host "Syntax: Pin-AppToTaskbar.ps1 <application/exe/lnk>"
   Write-Host
   exit
}

if ( -Not ( Test-Path $args[0] ) )
{
   Write-Host "File does not exist: $($args[0])"
   Write-Host
   exit
}

$fullPath = Resolve-Path $args[0]
$path = Split-Path $fullPath
$fileName = Split-Path -Leaf $fullPath

$shellApplication = New-Object -ComObject Shell.Application
$folder = $shellApplication.NameSpace( $path )
$shortcutItem = $folder.ParseName( $fileName )

$wasPinned = $false

foreach ( $verb in $shortcutItem.Verbs() )
{
   $thisVerb = ( $verb.Name -Replace "&", "" ).ToLower()
   
   if ( $thisVerb -eq "pin to taskbar" )
   {
      $verb.DoIt()
      $wasPinned = $true
      break
   }
}

if ( $wasPinned )
{
   Write-Host "Pinned successfully: $fullPath"
   Write-Host
}
else
{
   Write-Host "Does not appear to be pinnable (already pinned?): $fullPath"
   Write-Host
}

$null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject( $shellApplication )
