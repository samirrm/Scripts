function IsNumeric { 
[CmdletBinding( 
    SupportsShouldProcess=$True, 
    ConfirmImpact='High')] 
 
param ( 
 
[Parameter( 
    Mandatory=$True, 
    ValueFromPipeline=$True, 
    ValueFromPipelineByPropertyName=$True)] 
     
    $Value, 
     
[Parameter( 
    Mandatory=$False, 
    ValueFromPipeline=$True, 
    ValueFromPipelineByPropertyName=$True)] 
    [alias('B')] 
    [Switch] $Boolean 
     
) 
     
BEGIN { 
 
    #clear variable 
    $IsNumeric = 0 
 
} 
 
PROCESS { 
 
    #verify input value is numeric data type 
	$fileName = [System.IO.Path]::GetFileName($value)
    try { 0 + $fileName | Out-Null 
    $IsNumeric = 1 }catch{ $IsNumeric = 0 } 
 
    if($IsNumeric){  
        $IsNumeric = 1 
        if($Boolean) { $Isnumeric = $True } 
    }else{  
        $IsNumeric = 0 
        if($Boolean) { $IsNumeric = $False } 
    } 
     
    if($PSBoundParameters['Verbose'] -and $IsNumeric) 
    {
		 	 
		 Remove-Item $Value -Confirm:$false -recurse -force
		 Write-Host "A pasta " $fileName "Removido com sucesso"
		 
	}
        
    
    #return $IsNumeric 
} 
 
END {} 
 
}


Get-ChildItem C:\agent\_work\ | where { $_.GetType().Name } | Select -ExpandProperty FullName | IsNumeric -Verbose

