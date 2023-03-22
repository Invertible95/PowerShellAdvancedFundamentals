
function Get-User{
    [CmdletBinding(ConfirmImpact='Low')] # Default value for ConfirmImpact is High
    param (
        [Parameter()]
        [int]$Id,

        [switch]$MyBool
    )


    Begin{


    }

    Process {
        $Users = Get-Content
        
        Write-Verbose "MyBool is: $MyBool"
        
        if ($id) {
            $Users | Where-Object -Property id -eq $id
        }
        else {
            $Users
        }
    }


    end {

    }

}


