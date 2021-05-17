
#<#
function Import-RequiredModules {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]
        $RequiredModules = @(
            "Brennan"
            "Brennan.Core",
            "Brennan.CodeSigning"
        )
    )
    ### Import Required Modules.
    ###------------------------------------------------
    foreach($RequiredModule in $RequiredModules){
        try {
            if( [bool](Get-Module -Name $RequiredModule -ListAvailable) -eq $true ){
                Write-Host "Importing Module: " $RequiredModule -ForegroundColor Magenta
                Import-Module -Name $RequiredModule -Force
                Get-Module -Name $RequiredModule
            }    
            else {
                Write-Error -Message "Required Module $RequiredModule isnt available." 
            }
        }
        catch {
            Write-Warning -Message ("ERROR Importing required module: $RequiredModule" + $global:Error[0].Exception.Message) -ErrorAction Stop
        }
    }
}
#>

[string[]]$RequiredModules = @(
    #"Brennan"
    "Brennan.Core",
    "Brennan.CodeSigning",
    "Brennan.SQL",
    "Brennan.Reporting"
)
Import-RequiredModules -RequiredModules $RequiredModules

#Import-RequiredModules

