REM stop servi�o replica
net stop replicasql

REM Desabilitar UAC no regedit
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f



REM Adicionar o grupo todos e conceder acesso total ao diretorio ReplicaSQL
icacls "C:\Program Files\ReplicaSQL" /inheritance:e /grant:r todos:(OI)(CI)F
icacls "C:\Arquivos de Programas\ReplicaSQL" /inheritance:e /grant:r todos:(OI)(CI)F

REM desinstalando replica e instalando
      sc delete replicasql
		cd c:\Arquivos de Programas\ReplicaSQL\bin
		cd c:\Program Files\ReplicaSQL\bin
		sym_service install



REM Trocar arquivo de configura��o
del "C:\Program Files\replicasql\engines\store-001*" /Q
del "C:\Arquivos de Programas\replicasql\engines\store-001*" /Q

   O arquivo esta em \\vela\Publica\Tecnologia\David\store-001.zip deve ser descompactado e copiado para o diretorio 
   C:\Program Files\replicasql\engines
   C:\Arquivos de Programas\replicasql\engines



REM Apagar arquivos de log�s do replica

cd C:\Program Files\ReplicaSQL\tmp
rd "C:\Program Files\ReplicaSQL\tmp" /s /q
cd C:\Arquivos de Programas\ReplicaSQL\tmp
rd "C:\Arquivos de Programas\ReplicaSQL\tmp" /s /q


REM Atualizar data e hora
net start w32time
w32tm /resync /force


REM Iniciar servi�o do replica
net start ReplicaSQL

timeout 3 /nobreak

net start ReplicaSQL





