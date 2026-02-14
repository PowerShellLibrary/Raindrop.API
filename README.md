# Raindrop.API
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/Raindrop.API?label=Raindrop.API&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciICB2aWV3Qm94PSIwIDAgNDggNDgiIHdpZHRoPSI0OHB4IiBoZWlnaHQ9IjQ4cHgiPjxwYXRoIGZpbGw9IiMwMjc3YmQiIGQ9Ik0xOS44NDcsNDEuOTU2Yy01LjYyOS0wLjAwMi0xMS4yNTksMC4wMjQtMTYuODg4LTAuMDEzYy0yLjg1NS0wLjAxOS0zLjM3NC0wLjctMi43MzEtMy41MjUgYzIuMTc4LTkuNTgsNC40MjctMTkuMTQzLDYuNTU3LTI4LjczNEM3LjM1Niw3LjExMiw4LjU4OCw1Ljk3NSwxMS4zMTIsNkMyMi41Nyw2LjEwNiwzMy44MjksNi4wMzQsNDUuMDg4LDYuMDQ2IGMyLjgyNCwwLjAwMywzLjI5OCwwLjYxNCwyLjY2NCwzLjUxMWMtMi4wNTgsOS40MDYtNC4xMjksMTguODA5LTYuMjM2LDI4LjIwM2MtMC43ODksMy41MTYtMS42OTcsNC4xODctNS4zNTMsNC4xOTUgQzMwLjcyNCw0MS45NjYsMjUuMjg1LDQxLjk1OCwxOS44NDcsNDEuOTU2eiIvPjxwYXRoIGZpbGw9IiNmYWZhZmEiIGQ9Ik0yNS4wNTcgMjMuOTIyYy0uNjA4LS42ODctMS4xMTQtMS4yNjctMS41MzEtMS43MzItMi40My0yLjcyOC00LjY1Ni01LjI3LTcuMDYzLTcuODY5LTEuMTAyLTEuMTg5LTEuNDUzLTIuMzQ0LS4xMy0zLjUxOCAxLjMwNy0xLjE2IDIuNTkyLTEuMDU4IDMuNzkxLjI3NyAzLjM0IDMuNzE3IDYuNjc2IDcuNDM4IDEwLjA3MSAxMS4xMDQgMS4yNjggMS4zNjkuOTcyIDIuMy0uNDI0IDMuMzE1LTUuMzU5IDMuODk1LTEwLjY4NyA3LjgzMy0xNi4wMSAxMS43NzgtMS4xOTYuODg3LTIuMzM3IDEuMTA5LTMuMzA0LS4yMDEtMS4wNjYtMS40NDUtLjA4LTIuMzA1IDEuMDI2LTMuMTE0IDMuOTU1LTIuODkzIDcuOTAzLTUuNzk4IDExLjgzNC04LjcyNUMyMy44NjUgMjQuODMgMjQuNTk1IDI0LjI2NyAyNS4wNTcgMjMuOTIyek0yMS43NSAzN0MyMC42MjUgMzcgMjAgMzYgMjAgMzVzLjYyNS0yIDEuNzUtMmM0LjIyNCAwIDYuMTEyIDAgOS41IDAgMS4xMjUgMCAxLjc1IDEgMS43NSAycy0uNjI1IDItMS43NSAyQzI5LjEyNSAzNyAyNSAzNyAyMS43NSAzN3oiLz48L3N2Zz4=)](https://www.powershellgallery.com/packages/Raindrop.API)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

PowerShell module to interact with the [**Raindrop.io**](https://developer.raindrop.io//).

## Available Endpoints

### Authentication
- **Get-RaindropAuthHeader**: Builds an authorization header for API requests using the provided API token.

### User
- **Get-RaindropUser**: Retrieves information about the authenticated user.

### Backup
- **New-RaindropBackup**: Initiates the creation of a new backup for the authenticated user. This process may take some time.
- **Get-RaindropBackup**: Retrieves a list of available backups for the authenticated user.
- **Save-RaindropBackup**: Downloads and saves a specific backup to a file in CSV or HTML format.

### Export
- **Export-Raindrop**: Exports a collection of Raindrop bookmarks in the specified format (CSV, HTML, ZIP, or TXT). Supports sorting by creation date, score, title, or domain, and filtering by search terms.

## Examples

```powershell
# Import the module (adjust path as needed)
Import-Module .\Raindrop.API\Raindrop.API.psm1 -Force

# Set your API token
$ApiToken = 'YOUR_API_TOKEN'

# Get authenticated user info
$user = Get-RaindropUser -ApiToken $ApiToken

# Export bookmarks to a TXT file (sorted & filtered)
# Exports collection 0 (all) to .\export.txt, sorted by created desc, searching 'youtube'
Export-Raindrop -ApiToken $ApiToken -collectionId 0 -format 'txt' -OutFile '.\export.txt' -Sort '-created' -Search 'youtube'

# Export bookmarks to CSV and convert to PS objects
# When called without -OutFile, Export-Raindrop returns CSV text
$csv = Export-Raindrop -ApiToken $ApiToken -collectionId 0 -format 'csv'

# List available backups
Get-RaindropBackup -ApiToken $ApiToken

# Save a specific backup to CSV
# Pick an ID from $backups and save it
Save-RaindropBackup -ApiToken $ApiToken -id 67d6c08737249bbc09d0f54f -format 'csv' -OutFile ".\export.csv"

# Create a new backup (may take time)
New-RaindropBackup -ApiToken $ApiToken

# Download an export as ZIP file
Export-Raindrop -ApiToken $ApiToken -collectionId 0 -format 'zip' -OutFile '.\export-main.zip'
```

## License
[MIT License](LICENSE.md) © Alan Płócieniak