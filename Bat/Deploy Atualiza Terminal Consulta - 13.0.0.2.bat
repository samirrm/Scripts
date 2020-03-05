version of file "C:\cosmos\exe\AtualizaTerminalConsulta.exe" < "13.0.0.1"


//sha1:552b27e661aa6a39db297dc1070877ac01fbd7e1 size:27369 RDS 818329
//sha1:957e3f777bb5e3ae47aabb39a46fb01ee9fa498d size:27444 RDS 805581
//sha1:c9bca426b987c25520a396cfd01f8ec0c2c32718 size:27452 RDS 778115
//sha1:a854e4b113b9253147f42e8d61499d3784eeed76 size:23781
//sha1:16363afffb4f3534d49eae38bf91bcc4551316c1 size:27034

//**Begin Preparation Marker
// Fazer download de todos os arquivos especificados
begin prefetch block
  add prefetch item name=e1bfe19ba69975b832142f084635c3b622907e5b sha1=e1bfe19ba69975b832142f084635c3b622907e5b size=27027 url=SWDProtocol://127.0.0.1:52311/Uploads/e1bfe19ba69975b832142f084635c3b622907e5b/AtualizaTerminalConsulta.zip.bfswd sha256=287a17946383fb2f8b21024f9a951d401715f7a30f0525c1af03c243c34c46f7
end prefetch block

// Todos os arquivos SWD irão para uma pasta na pasta __BESData de clientes. Essa pasta é limpa a cada reinicialização.
parameter "baseFolder" =  "__Download/"
// Mover arquivos para subpastas e nomes de arquivos descodificados com a função unescape
move "__Download/e1bfe19ba69975b832142f084635c3b622907e5b" "{parameter "baseFolder"}AtualizaTerminalConsulta.zip"

parameter "logFolder" = "C:\BackupIEM\TEMLog\"
parameter "logFile" = "{id of active action}.log"
parameter "bkFolder" = "C:\BackupIEM\TEMLog\{id of active action}"
// Executar processo de configuração	
delete __createfile
delete run.bat
dos mkdir "{parameter "logFolder"}"
dos mkdir "{parameter "bkFolder"}"

createfile until _end_
		@ECHO OFF
		cd "{parameter "baseFolder"}"

		echo Hora: %time% 
		echo Acao: {id of active action} 

		echo Descompactar 
		unzip AtualizaTerminalConsulta.zip 

		dir *.exe /b > arqexe.txt

		//Checa novamente se a aplicação está rodando
		taskkill.exe /F /IM AtualizaTerminalConsulta.exe
		
		echo Atualiza nova versao
		copy *.exe c:\cosmos\exe /Y

        del  "C:\Cosmos\Exe\Import.txt" /S
        del "C:\Program Files\QuickWayChecker\Import.txt" /S

		
		      		
			
		rem //   Controle de Ações

FOR /F "tokens=1,2,3 delims=/ " %%a in ("%DATE%") do (
set DIA=%%a
set MES=%%b
set ANO=%%c
)
FOR /F "tokens=1,2,3 delims=:, " %%a in ("%TIME%") do (
set H=%%a
set M=%%b
set S=%%c
)
set H=0%H%
set H=%H:~-2%
set FORMATO=%DIA%/%MES%/%ANO% - %H%:%M%:%S%
echo Data: %FORMATO% Ação: "Deploy Atualiza Terminal Consulta - 13.0.0.1" >>C:/Cosmos/ControleAcao.txt
			
		echo concluido: %time% 
		echo Codigo de Retorno: %errorlevel% 
_end_

move __createfile run.bat

override wait
hidden=true
completion=job
wait run.bat >> "{parameter "logFolder"}/{parameter "logFile"}" 2>&1