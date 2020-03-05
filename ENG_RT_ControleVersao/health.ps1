$url = 'https://k8s.pmenos.com.br/apipainelvendasreceita/api/health'
$req = [system.Net.WebRequest]::Create($url)

try {
    $res = $req.GetResponse()
} 
catch [System.Net.WebException] {
    $res = $_.Exception.Response
}

if([int]$res.StatusCode -match 200){

    Write-Output "está no ar"

}else{

    exit 1

}

