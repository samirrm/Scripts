#geração do EXE 
$dir = "c:\Balcao\"
if($dir -ne $false){

Copy-Item "c:\Balcao\*" -Destination "C:\FonteDesenvolvimento\" -recurse

Remove-Item C:\Balcao\OPE_FL_Balcao_VB\* -Confirm:$false -recurse -force 

#diretorio onde serão enviados os artefatos após a geração 
$outdir = "C:\Cosmos\Exe" 

#diretorio do projeto que será compilado 
$project = "C:\FonteDesenvolvimento\OPE_FL_Balcao_VB\Principal\CsmBalcaoFL.vbp" 

#cria um arquivo de log 
$logfile = "C:\Artefatos_gerados\log\project.log" 

#chamada para executar o vb6 

#$vb6bin "C:\Program Files\Microsoft Visual Studio\VB98\VB6.EXE" 

#Write-Output $vb6bin 

#comando que abre o vb6, executa o make no vbp, cria o arquivo de log e joga a dll após o make 
$cmd = "C:\progra~1\MICROS~1\VB98\VB6.EXE /m $project /out $logfile /outdir $outdir" 

#Write-Output $cmd 

#executa os comandos da variavel $cmd 
Invoke-Expression $cmd 

start-sleep -Seconds 30

Remove-Item C:\FonteDesenvolvimento\OPE_FL_Balcao_VB -Confirm:$false -recurse -force 
Copy-Item "C:\Cosmos\Exe\BalcaoFL.exe" -Destination "C:\Balcao\"
Remove-Item C:\Cosmos\Exe\BalcaoFL.exe -Confirm:$false -recurse -force 

}