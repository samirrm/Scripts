$username = 'USER@CONTA.COM.BR'
$service = 'AdministracaoPessoal'
$destino = 'iishomo02'
$action = Start-WebAppPool


$acesso = New-PSSession -ComputerName $destino -Credential $username -EnableNetworkAccess -ThrottleLimit 91
Invoke-Expression "$comando -name $service"

