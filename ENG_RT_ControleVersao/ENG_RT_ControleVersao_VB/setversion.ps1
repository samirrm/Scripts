
# SetVersion.ps1

#

# Set the version in all the AssemblyInfo.cs or AssemblyInfo.vb files in any subdirectory.

#

# usage:

#  from cmd.exe:

#     powershell.exe SetVersion.ps1  2.8.3.0

#

#  from powershell.exe prompt:

#     .\SetVersion.ps1  2.8.3.0

#

# last saved Time-stamp: <Wednesday, April 23, 2008  11:46:40  (by dinoch)>

#


function Usage

{

  Write-Output "Usage: ";

  Write-Output "  from cmd.exe: ";

  Write-Output "     powershell.exe SetVersion.ps1  2.8.3.0";

  Write-Output " " ;

  Write-Output "  from powershell.exe prompt: ";

  Write-Output "     .\SetVersion.ps1  2.8.3.0";

  Write-Output " ";

}


function Update-SourceVersion

{

  Param ([string]$Version)

  foreach ($o in $input)

  {
  
    #CUSTOM Bruno Stefanni
    $sln = Get-Content $o.FullName
    $versao = $sln | Select-String 'AssemblyVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)' -AllMatches | select-object -First 1
    $versao = $versao  -replace'[^0-9.]',''
    $versao = $versao.Substring(0,$versao.LastIndexOf('.') + 1) + [string]([int]$versao.Substring($versao.LastIndexOf('.')+1) + 1)

    If ($Version -ne 0)
    {
      Write-Output 'sim'
      $Version
      $NewVersion = 'AssemblyVersion("' + $Version + '")';
      $NewFileVersion = 'AssemblyFileVersion("' + $Version + '")';
	  $NewFileVersionAttribute = 'AssemblyFileVersionAttribute("' + $Version + '")';
    }
    else
    {
      Write-Output 'nao'
      $NewVersion = 'AssemblyVersion("' + $versao + '")';
      $NewFileVersion = 'AssemblyFileVersion("' + $versao + '")';
	  $NewFileVersionAttribute = 'AssemblyFileVersionAttribute("' + $versao + '")';
    }
    
    #

    Write-output $o.FullName

    $TmpFile = $o.FullName + ".tmp"

     get-content $o.FullName |
     
        %{$_ -replace 'AssemblyVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)', $NewVersion } |

        %{$_ -replace 'AssemblyFileVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)', $NewFileVersion } |

		%{$_ -replace 'AssemblyFileVersionAttribute\("[0-9]+(\.([0-9]+|\*)){1,3}"\)', $NewFileVersionAttribute } > $TmpFile
        

     move-item $TmpFile $o.FullName -force

  }

}


function Update-AllAssemblyInfoFiles ( $version )

{

  foreach ($file in "AssemblyInfo.cs", "AssemblyInfo.vb" )

  {

    get-childitem -recurse | Where-Object {$_.Name -eq $file} | Update-SourceVersion $version;

  }

}

#& "git" config --global user.email usuarioservico@pmenos.com.br
#& "git" config --global  user.name usuarioservico

#& "git" checkout master --quiet
#& "git" pull https://52464:verde_44@paguemenos.visualstudio.com/Desenvolvimento/_git/ENG_RT_ControleVersao/?path=%2FENG_RT_ControleVersao_CSharp&version=GBmaster master --force  --quiet
#Set-Location Apresentacao/WfaEntradaMercadoria
Remove-Item *.nupkg
$versao = "0.0.0"
If ($args[0] -ne $null)
{
  $versao = $args[0];
  Update-AllAssemblyInfoFiles $args[0];
}
else
{
  Update-AllAssemblyInfoFiles 0;
}

#& "git" add -A
#& "git" commit -m ("incrementando versao ControleVersao_CSharp " + $versao) --quiet
#& "git" push https://52464:verde_44@paguemenos.visualstudio.com/Desenvolvimento/_git/ENG_RT_ControleVersao/?path=%2FENG_RT_ControleVersao_CSharp&version=GBmaster master --force  --quiet