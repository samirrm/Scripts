$NomeServico = 'NOME_DO_POLL_AQUI'
$action = 'Start-WebAppPool'
$computerName = 'COMPUTERNAME_AQUI'
$adminUserName = USER_AQUI
$service = $NomeServico
$names = $servico
$adminPassword = Get-Content -Path C:\FonteDesenvolvimentoSamir\PowerShell\PASSWD.txt 
$adminPassword.GetType() | Format-Table -AutoSize
Write-Output "Senha Usada:" $adminPassword

$action = $action -replace ' ', '-'

if (![string]::IsNullOrWhiteSpace($adminUserName)) {
    $secpasswd = ConvertTo-SecureString $adminPassword -AsPlainText -Force
    $credential = New-Object -typename System.Management.Automation.PSCredential -ArgumentList $adminUserName, $secpasswd

    $names.Split(";") | ForEach-Object -Process {
        echo "$($action) $($_)"
        Invoke-Command -ComputerName $computerName -Credential $credential -ScriptBlock {
            param($service, $action)
            Get-Module WebAdministration

            $result = $true
            if ($action -eq 'Stop-WebAppPool') {
                $state = Get-WebAppPoolState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("WebAppPool $($service) already $($state.Value)")
                    $result = $false
                }
            }
            elseif ($action -eq 'Stop-Website') { 
                $state = Get-WebsiteState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("Website $($service) already $($state.Value)")
                    $result = $false
                }
            }
            elseif ($action -eq 'Restart-WebAppPool') { 
                $state = Get-WebAppPoolState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("WebAppPool $($service) already $($state.Value)")
                    $result = $false
                    Invoke-Expression  "Start-WebAppPool -Name '$($service)'"
                }
            }

            if ($result) {
                Invoke-Expression  "$($action) -Name '$($service)'"
            }
        } -ArgumentList $_, $action  
    }
}
 <# else {
    $names.Split(";") | ForEach-Object -Process {
        echo "$($action) $($_)"
        Invoke-Command -ComputerName $computerName -ScriptBlock {
            param($service, $action)
            Get-Module WebAdministration

            $result = $true
            if ($action -eq 'Stop-WebAppPool') {
                $state = Get-WebAppPoolState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("WebAppPool $($service) already $($state.Value)")
                    $result = $false
                }
            }
            elseif ($action -eq 'Stop-Website') { 
                $state = Get-WebsiteState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("Website $($service) already $($state.Value)")
                    $result = $false
                }
            }
            elseif ($action -eq 'Restart-WebAppPool') { 
                $state = Get-WebAppPoolState -Name $service
                if ($state.Value -eq 'Stopped') {
                    Write-Warning("WebAppPool $($service) already $($state.Value)")
                    $result = $false
                    Invoke-Expression  "Start-WebAppPool -Name '$($service)'"
                }
            }

            if ($result) {
                Invoke-Expression  "$($action) -Name '$($service)'"
            }
        } -ArgumentList $_, $action  
    }
} #>
