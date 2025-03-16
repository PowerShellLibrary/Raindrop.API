function Save-RaindropBackup {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken,

        [Parameter(Mandatory = $true)]
        [string] $id = 0,

        [Parameter(Mandatory = $true)]
        [ValidateSet("csv", "html")]
        [string] $format,

        [Parameter(Mandatory = $false)]
        [string] $OutFile
    )

    $url = "$Global:RaindropBaseUrl/backup/$id.$format"
    $headers = Get-RaindropAuthHeader -ApiToken $ApiToken

    try {
        if ([string]::IsNullOrEmpty($OutFile)) {
            $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
            return $response
        }
        else {
            Invoke-WebRequest -Uri $url -Headers $headers -Method Get -OutFile $OutFile
        }
    }
    catch {
        Write-Error "Failed to retrieve projects: $_"
    }
}