param(
    [string]$webUrl=""
)

if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) {
	Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}
if((Get-Command "Invoke-Sqlcmd" -ErrorAction SilentlyContinue) -eq $null) {
	AddLogEntryTrace "Sql server cmdlet snappin is not activaated. Trying to import module sqlps." $currentFunctionName
	Import-Module "sqlps" -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
}
if((Get-Command "Invoke-Sqlcmd" -ErrorAction SilentlyContinue) -eq $null) {
	AddLogEntryTrace "Sql server cmdlet snappin is not activated. Trying to activate." $currentFunctionName
	Add-PSSnapin SqlServerCmdletSnapin100
	Add-PSSnapin SqlServerProviderSnapin100
}


$currentFolder = (Resolve-Path .\).Path
$tempFolder  = [System.IO.Path]::Combine($currentFolder, "tmp")

function GetWeb () {
    $web = Get-SPWeb $webUrl -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    if ($web -eq $null) {
        sleep -Seconds:10

        $web = Get-SPWeb $webUrl
    }
    
    return $web
}


function Update() {

    $web = GetWeb

    $contentDB = Get-SPContentDatabase -Site $webUrl
    $contentDBServerName = $contentDB.Server
    $contentDBName = $contentDB.Name



    $query = "USE [WSS_Content]
GO
EXEC	 [dbo].[REP_AddUserSalaryHistory]
GO
"

       
    $data = Invoke-Sqlcmd -ServerInstance $contentDBServerName -Database $contentDBName -Query $query
}

Update