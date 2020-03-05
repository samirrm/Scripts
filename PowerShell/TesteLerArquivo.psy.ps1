$Text = Get-Content -Path C:\FonteDesenvolvimentoSamir\PowerShell\PASSWD.txt 
$Text.GetType() | Format-Table -AutoSize

Write-Output "Tex:" $Text
