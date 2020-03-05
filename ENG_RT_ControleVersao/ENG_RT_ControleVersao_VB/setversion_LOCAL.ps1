
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
    }
    else
    {
      Write-Output 'nao'
      $NewVersion = 'AssemblyVersion("' + $versao + '")';
      $NewFileVersion = 'AssemblyFileVersion("' + $versao + '")';
    }
    
    #

    Write-output $o.FullName

    $TmpFile = $o.FullName + ".tmp"

     get-content $o.FullName |
     
        %{$_ -replace 'AssemblyVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)', $NewVersion } |

        %{$_ -replace 'AssemblyFileVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)', $NewFileVersion }  > $TmpFile
        

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

& "git" pull origin master --force  --quiet

If ($args[0] -ne $null)
{
  Update-AllAssemblyInfoFiles $args[0];
}
else
{
  Update-AllAssemblyInfoFiles 0;
}

#&  'C:\Program Files\MSBuild\14.0\bin\MSBuild.exe' C:\FonteDesenvolvimento\ENG_RT_ControleVersao\ENG_RT_ControleVersao_VB\ENG_RT_ControleVersao_VB.csproj 
& "C:\Program Files (x86)\MSBuild\14.0\bin\msbuild.exe"  ((Get-Item -Path ".\.." -Verbose).FullName + "\ENG_RT_ControleVersao.sln")

#& "git" add -A
#& "git" commit -m ("incrementando versao LOCAL clsControleVersaoVB6" + $versao) --quiet
#& "git" push origin master --force  --quiet