function Get-RaindropUser {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken
    )

    $url = "$Global:RaindropBaseUrl/user"
    $headers = Get-RaindropAuthHeader -ApiToken $ApiToken

    try {
        $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
        return $response.user
    }
    catch {
        $errorMsg = Format-RaindropError -ErrorRecord $_ -Url $url
        Write-Error $errorMsg
    }
}