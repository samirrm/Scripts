$env:Path = "C:\Program Files\Git\bin"

&cd "C:\FonteDesenvolvimento"

#Remove-Item "LOG_RT_EnvioNFeAutomatico_VB"

&"git" clone "https://paguemenos.visualstudio.com/Desenvolvimento/_git/COM_RT_AnaliseEstoque_VB"

#geração da DLL

#diretorio onde serão enviados os artefatos após a geração
$outdir = "C:\CosmosRT\DLL\"

#diretorio do projeto que será compilado 
$project = "C:\FonteDesenvolvimento\COM_RT_AnaliseEstoque_VB\Classes\AnaliseEstoque\clsAnaliseEstoque.vbp"

#cria um arquivo de log
$logfile = "C:\Artefatos_Gerados\log\project.log"

#chamada para executar o vb6

#$vb6bin = "C:\Program Files\Microsoft Visual Studio\VB98\VB6.EXE"

#Write-Output $vb6bin

#dll após o make
$dll = "C:\CosmosRT\DLL\clsAnaliseEstoque.dll"

#comando que abre o vb6, executa o make no vbp, cria o arquivo de log e joga a dll após o make
$cmd = "C:\progra~1\MICROS~1\VB98\VB6.EXE /m $project /out $logfile /outdir $outdir"

#Write-Output $cmd

#executa os comandos da variavel $cmd
Invoke-Expression $cmd

#registra a dll de forma silenciosa
$regsvrp = Start-Process regsvr32.exe -ArgumentList ($dll + " -s") -PassThru

#geração do EXE

#diretorio onde serão enviados os artefatos após a geração
$outdir = "C:\CosmosRT\"

#diretorio do projeto que será compilado 
$project = "C:\FonteDesenvolvimento\COM_RT_AnaliseEstoque_VB\Principal\CsmAnaliseEstoque.vbp"

#cria um arquivo de log
$logfile = "C:\Artefatos_Gerados\log\project.log"

#chamada para executar o vb6

#$vb6bin "C:\Program Files\Microsoft Visual Studio\VB98\VB6.EXE"

#Write-Output $vb6bin

#comando que abre o vb6, executa o make no vbp, cria o arquivo de log e joga a dll após o make
$cmd = "C:\ARQUIV~1\MICROS~2\VB98\VB6.EXE /m $project /out $logfile /outdir $outdir"

#Write-Output $cmd

#executa os comandos da variavel $cmd
Invoke-Expression $cmd
