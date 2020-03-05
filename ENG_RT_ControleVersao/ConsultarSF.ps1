$env:Path = "C:\Python27";
$env:Path = "C:\Python27\Scripts";

function Usage
{

  Write-Output "Usage: ";

  Write-Output "  from cmd.exe: ";

  Write-Output "     powershell.exe ConsultarSF.ps1  2.8.3.0";

  Write-Output " " ;

  Write-Output "  from powershell.exe prompt: ";

  Write-Output "     .\ConsultarSF.ps1  NOME_APLICACAO";

  Write-Output " ";

}

& sfctl cluster select --endpoint http://dashboardsf.pmenos.com.br:19080
& sfctl application info --application-id $args[0]

#function Consultar-versao
#{

#	sfctl cluster select --endpoint 10.4.100.97:19000
#	sfctl application info --aplication-id $args[0]

	# Param([string]$SFName)
	# {
		
		# $sln = Get-Content $aplication-id	
		# $SFName = $sln | Select-String 'AplicationName\(string)'
		# $SFName = sfctl application info --aplication-id "$sln"
		# $aplication-id = $SFName
	
	# }
	
	# Write-Output $aplication-id
# }