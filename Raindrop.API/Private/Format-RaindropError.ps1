function Format-RaindropError {
    <#
    .SYNOPSIS
    Formats detailed error information from a Raindrop API call.

    .DESCRIPTION
    Extracts HTTP status code, status description, and exception message from an error object
    to provide comprehensive error details for Raindrop API failures.

    .PARAMETER ErrorRecord
    The error record from a catch block.

    .PARAMETER Url
    The URL that was being accessed when the error occurred.

    .PARAMETER Operation
    A description of the operation being performed (e.g., "export", "backup").
    If not provided, uses the name of the calling cmdlet.

    .EXAMPLE
    try {
        Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    }
    catch {
        Format-RaindropError -ErrorRecord $_ -Url $url
    }
    #>
    param (
        [Parameter(Mandatory)]
        $ErrorRecord,

        [Parameter(Mandatory)]
        [string] $Url,

        [Parameter(Mandatory = $false)]
        [string] $Operation
    )

    # If Operation not provided, use the calling cmdlet's name
    if ([string]::IsNullOrEmpty($Operation)) {
        $Operation = (Get-PSCallStack)[1].Command
    }

    $errorMessage = $ErrorRecord.Exception.Message
    $statusCode = $ErrorRecord.Exception.Response.StatusCode.value__
    $statusDescription = $ErrorRecord.Exception.Response.StatusDescription

    $errorDetails = @()
    $errorDetails += "Failed to run '$Operation'"
    $errorDetails += "(URL: $Url)"

    if ($statusCode) {
        $httpStatus = "HTTP $statusCode"
        if ($statusDescription) {
            $httpStatus += " ($statusDescription)"
        }
        $errorDetails += $httpStatus
    }

    $errorDetails += "Message: $errorMessage"

    return $errorDetails -join " | "
}
