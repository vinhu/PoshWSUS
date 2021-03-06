function Get-PoshWSUSClientsInGroup {
    <#  
    .SYNOPSIS  
        Retrieves a list of clients that are members of a group.
    .DESCRIPTION
        Retrieves a list of clients that are members of a group.
    .PARAMETER Id
        Retrieves list of clients in group by group guid.          
    .PARAMETER Name
        Retrieves list of clients in group by group name.    
    .NOTES  
        Name: Get-PoshWSUSClientsInGroup
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE  
    Get-PoshWSUSClientsInGroup -name "Domain Servers"

    Description
    -----------      
    This command will list all clients that are members of the specified group via group name.

    .EXAMPLE
    Get-PoshWSUSClientsInGroup -ID "b73ca6ed-5727-47f3-84de-015e03f6a88a"

    Description
    -----------    
    This command will list all clients that are members of the specified group via the group guid.
           
    #> 
    [cmdletbinding()]
    Param(
        [Parameter(
            Mandatory = $False,
            Position = 0)]
            [string]$Name,
        [Parameter(
            Mandatory = $False,
            Position = 1)]
            [string]$Id                           
            )
    Process {                                    
        If ($PSBoundParameters['id']) {     
            ($wsus.GetComputerTargetGroups() | Where {
                $_.Id -eq $id
            }).GetComputerTargets()
        }
        If ($PSBoundParameters['name']) {
            ($wsus.GetComputerTargetGroups() | Where {
                $_.name -eq $name
            }).GetComputerTargets()
        }   
    } 
}
