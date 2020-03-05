
$service = 'AdministracaoPessoal'
$action = 'Start-WebAppPool'

$pw = convertto-securestring -AsPlainText -Force -String 'C:\caminho\PASS\PASSWD.txt'

Write-Output $pw


$Secure = Read-Host -AsSecureString

$Encrypted = ConvertFrom-SecureString -SecureString $Secure
$Secure2 = ConvertTo-SecureString -String $Encrypted


Write-Output 3° $Encrypted