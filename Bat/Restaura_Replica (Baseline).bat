//**Begin Preparation Marker
// Fazer download de todos os arquivos especificados
begin prefetch block
  add prefetch item name=78D2D75C4E8054F77D224E71010BE92D7453F3A6 sha1=78d2d75c4e8054f77d224e71010be92d7453f3a6 size=2911 url=SWDProtocol://127.0.0.1:52311/Uploads/78D2D75C4E8054F77D224E71010BE92D7453F3A6/store-001.properties.bfswd sha256=f7ae8422e95d90ded1389639a384e514a7249e2f9e56c603516c2208b5fa26b5
end prefetch block

// Todos os arquivos SWD irão para uma pasta na pasta __BESData de clientes. Essa pasta é limpa a cada reinicialização.
parameter "baseFolder" =  "__Download/"
// Mover arquivos para subpastas e nomes de arquivos descodificados com a função unescape
move "__Download/78D2D75C4E8054F77D224E71010BE92D7453F3A6" "{parameter "baseFolder"}store-001.properties" 

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
		
		net stop replicasql
		rem //sc config replicasql start= demand

		//Rem Copiar bat para pasta de inicialização Windows
		xcopy store-001.properties "C:\Arquivos de Programas\replicasql\engines" /Y
		xcopy store-001.properties "C:\Program Files\replicasql\engines" /Y
		

		del "C:\Arquivos de Programas\replicasql\logs\sym*.*" /Q
		del "C:\Arquivos de Programas\replicasql\logs\wrapper.pid" /Q
		rd "C:\Arquivos de Programas\replicasql\tmp" /s /Q
		rd "C:\Arquivos de Programas\replicasql\logs" /s /Q
		del "C:\Program Files\replicasql\logs\sym*.*" /Q
		del "C:\Program Files\replicasql\logs\wrapper.pid" /Q
		rd "C:\Arquivos de Programas\replicasql\logs" /s /Q
		rd "C:\Program Files\replicasql\tmp" /s /Q

		//criar as pastas deletas
		mkdir "C:\Arquivos de Programas\replicasql\tmp"
		mkdir "C:\Arquivos de Programas\replicasql\logs"
		mkdir "C:\Program Files\replicasql\tmp"
		mkdir "C:\Program Files\replicasql\logs"


		rem //sc config replicasql start= auto
		net start replicasql

		rem //cd "C:\Program Files\Kaspersky Lab\NetworkAgent"
		rem //klmover.exe -address 172.24.0.76
		rem//cibele região sul sudeste 172.24.0.65
		rem//semela região NORDESTE 172.24.0.76
		rem //klnagchk.exe

		Colocar serviço em modo Manual
		sc config replicasql start= demand
		
		rem //Reinicar Maquina
		rem //rem shutdown -r -t 0
		
				
		echo concluido: %time% 
		echo Codigo de Retorno: %errorlevel% 
	_end_

	move __createfile run.bat
	override wait
	hidden=true
	completion=job
	wait run.bat >> "{parameter "logFolder"}/{parameter "logFile"}" 2>&1
	dos echo {parameter "bkFolder"} > c:\cosmos\ultimaversao.txt
//else // O programa esta em execucao
  //exit false
//endif