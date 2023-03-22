
function GetUserData {
    [ValidateScript({
        $_
    })]
    $MyUserListFile = "$PSScriptRoot\MyLabFile.csv"
    $MyUserList = Get-Content -Path $MyUserListFile | ConvertFrom-Csv
    $MyUserList
}

function Get-CourseUser {
   [CmdletBinding()]
   param (
        [Parameter()]
        [String]$Name,

        [Parameter()]
        [int]$Olderthan
   )
   $Result = GetUserData

    if (-not [string]::IsNullOrEmpty($Name)) {
        $Result = $Result | Where-Object -Property Name -Like "*$Name*"
    }
    
    if ($OlderThan) {
        $Result = $Result | Where-Object -Property Age -ge $OlderThan
    }

    $Result

}

function Add-CourseUser {
    [CmdletBinding()]
    param (
        $DataBaseFile = "$PSScriptRoot\MyLabFile.csv",

        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [int]$Age,

        [Parameter()]
        [ValidateSet(red, green, blue, yellow, Mandatory) ]
        [String]$Color,

        $UserID = (Get-Random -Minimum 10 -Maximum 100000)      
    )

    $MyCsvUser = "$Name,$Age,{0},{1}" -f $Color,$UserID

    
}