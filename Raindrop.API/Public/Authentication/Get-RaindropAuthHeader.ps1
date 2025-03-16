function Get-RaindropAuthHeader {
    param (
        [Parameter(Mandatory)]
        [string] $ApiToken
    )

    return @{ Authorization = "Bearer $ApiToken" }
}