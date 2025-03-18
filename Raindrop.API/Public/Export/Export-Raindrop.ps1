function Export-Raindrop {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken,

        [Parameter(Mandatory = $false)]
        [int] $CollectionId = 0,

        [Parameter(Mandatory = $true)]
        [ValidateSet("csv", "html", "zip")]
        [string] $Format,

        [Parameter(Mandatory = $false)]
        [string] $OutFile,

        [Parameter(Mandatory = $false)]
        [ValidateSet('-created', 'created', 'score', '-sort', 'title', '-title', 'domain', '-domain')]
        [string] $Sort,

        [Parameter(Mandatory = $false)]
        [string] $Search
    )

    $headers = Get-RaindropAuthHeader -ApiToken $ApiToken

    $params = @{}
    if ($PSBoundParameters.ContainsKey('Sort')) { $params['sort'] = $Sort }
    if ($PSBoundParameters.ContainsKey('Search')) { $params['search'] = $Search }

    $queryString = ($params.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }) -join '&'

    $url = "$Global:RaindropBaseUrl/raindrops/$CollectionId/export.$($Format)?$queryString"

    try {
        if ([string]::IsNullOrEmpty($OutFile)) {
            Invoke-RestMethod -Uri $url -Headers $headers -Method Get
        }
        else {
            Invoke-WebRequest -Uri $url -Headers $headers -Method Get -OutFile $OutFile
        }
    }
    catch {
        Write-Error "Failed to retrieve projects: $_"
    }
}