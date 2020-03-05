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

  #$NewVersion = 'AssemblyVersion("' + $Version + '")';

  #$NewFileVersion = 'AssemblyFileVersion("' + $Version + '")';


  foreach ($o in $input)

  {
  
    #CUSTOM Bruno Stefanni
    $sln = Get-Content $o.FullName
    $versao = $sln | Select-String 'AssemblyVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)' -AllMatches | select-object -First 1
    $versao = $versao  -replace'[^0-9.]',''

    #($versao + '.0') 
    #& "C:\agent\externals\nuget\NuGet.exe" delete -s 'nexus01' -NonInteractive ENG_RT_ControleVersao_VBNET ($versao + '.0') -ApiKey 8be4b34f-057d-341b-9f95-078374d8b831

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

#Remove-Item *.nupkg
#$versao = 0.0.0
If ($args[0] -ne $null)
{
  Update-AllAssemblyInfoFiles $args[0];
}
else
{
  Update-AllAssemblyInfoFiles 0;
}


#MSBuild

#Set-Location ''
#&  'C:\Program Files\MSBuild\14.0\bin\MSBuild.exe' C:\FonteDesenvolvimento\ENG_RT_ControleVersao\ENG_RT_ControleVersao_VBNET\ENG_RT_ControleVersao_VBNET.csproj 
&  'C:\Program Files (x86)\MSBuild\14.0\bin\msbuild.exe' C:\FonteDesenvolvimento\ENG_RT_ControleVersao\ENG_RT_ControleVersao_VBNET\ENG_RT_ControleVersao_VBNET.csproj 
#& "C:\Program Files (x86)\MSBuild\14.0\bin\msbuild.exe"  ((Get-Item -Path ".\.." -Verbose).FullName + "\ENG_RT_ControleVersao.sln")

#[System.Diagnostics.Process]::Start("C:\Program Files (x86)\MSBuild\14.0\bin\msbuild.exe", "C:\agent\_work\47\s\ENG_RT_ControleVersao.sln /nologo /nr:false /dl:CentralLogger")
#& "git" add -A
#& "git" commit -m ("incrementando versao LOCAL clsControleVersaoVBNET" + $versao) --quiet
#& "git" push origin master --force  --quiet



#& "C:\agent\externals\nuget\Nuget.exe" sources add -Name "nexus01" -Source "http://nexusdev.pmenos.com.br:8081/repository/nuget01/" -UserName 72784 -Password N1ntend02

#Update-Package -reinstall ENG_RT_ControleVersao_VBNET -DependencyVersion Highest
