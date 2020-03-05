$val = $true

while($val)
{
    $artefatos = Test-Path \\10.11.100.240\c$\Balcao\BalcaoFL.exe
    
    if($artefatos -eq $true)
    {
        copy-item "\\10.11.100.240\c$\Balcao\BalcaoFL.exe" -Destination "\\172.24.0.82\c$\Balcao\" -Recurse
        
        $val = $false
    }

    Start-Sleep -Seconds 30
}

Write-Output terminou