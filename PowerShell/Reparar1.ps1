$username = '00000@DOMINIO.COM.BR'
$Password = 'SENHA_AQUI'
$service = "AdministracaoPessoal"
$comando = Start-WebAppPool
$pc = 'COMPUTERNAME_AQUI'

$pass = ConvertTo-SecureString -AsPlainText $Password -Force
$SecureString = $pass

$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$SecureString 
$session2 = New-PSSession -ComputerName $pc -Credential $MySecureCreds -ThrottleLimit 16
Invoke-Command $comando -ApplicationName $service -SessionName $session2


#$pass="COMPUTERNAME_AQUI"|ConvertTo-SecureString -AsPlainText -Force
#$cred = New-Object –Credential $cred –computer $computer System.Management.Automation.PsCredential('00000@DOMINIO.COM.BR',$pass)
#Invoke-Expression "Start-WebAppPool -Name $service"