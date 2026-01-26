function New-RaindropBackup {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken
    )

    $url = "$Global:RaindropBaseUrl/backup"
    $headers = Get-RaindropAuthHeader -ApiToken $ApiToken

    try {
        $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
        Write-Host $response.message
        return $response.result
    }
    catch {
        $errorMsg = Format-RaindropError -ErrorRecord $_ -Url $url
        Write-Error $errorMsg
    }
}