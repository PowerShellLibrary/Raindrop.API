function Get-RaindropBackup {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken
    )

    $url = "$Global:RaindropBaseUrl/backups"
    $headers = Get-RaindropAuthHeader -ApiToken $ApiToken

    try {
        $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
        return $response.items
    }
    catch {
        Write-Error "Failed to retrieve projects: $_"
    }
}