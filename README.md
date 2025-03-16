# Raindrop.API
[![PowerShell Gallery](https://img.shields.io/powershellgallery/v/Raindrop.API?label=Raindrop.API&color=blue&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciICB2aWV3Qm94PSIwIDAgNDggNDgiIHdpZHRoPSI0OHB4IiBoZWlnaHQ9IjQ4cHgiPjxwYXRoIGZpbGw9IiMwMjc3YmQiIGQ9Ik0xOS44NDcsNDEuOTU2Yy01LjYyOS0wLjAwMi0xMS4yNTksMC4wMjQtMTYuODg4LTAuMDEzYy0yLjg1NS0wLjAxOS0zLjM3NC0wLjctMi43MzEtMy41MjUgYzIuMTc4LTkuNTgsNC40MjctMTkuMTQzLDYuNTU3LTI4LjczNEM3LjM1Niw3LjExMiw4LjU4OCw1Ljk3NSwxMS4zMTIsNkMyMi41Nyw2LjEwNiwzMy44MjksNi4wMzQsNDUuMDg4LDYuMDQ2IGMyLjgyNCwwLjAwMywzLjI5OCwwLjYxNCwyLjY2NCwzLjUxMWMtMi4wNTgsOS40MDYtNC4xMjksMTguODA5LTYuMjM2LDI4LjIwM2MtMC43ODksMy41MTYtMS42OTcsNC4xODctNS4zNTMsNC4xOTUgQzMwLjcyNCw0MS45NjYsMjUuMjg1LDQxLjk1OCwxOS44NDcsNDEuOTU2eiIvPjxwYXRoIGZpbGw9IiNmYWZhZmEiIGQ9Ik0yNS4wNTcgMjMuOTIyYy0uNjA4LS42ODctMS4xMTQtMS4yNjctMS41MzEtMS43MzItMi40My0yLjcyOC00LjY1Ni01LjI3LTcuMDYzLTcuODY5LTEuMTAyLTEuMTg5LTEuNDUzLTIuMzQ0LS4xMy0zLjUxOCAxLjMwNy0xLjE2IDIuNTkyLTEuMDU4IDMuNzkxLjI3NyAzLjM0IDMuNzE3IDYuNjc2IDcuNDM4IDEwLjA3MSAxMS4xMDQgMS4yNjggMS4zNjkuOTcyIDIuMy0uNDI0IDMuMzE1LTUuMzU5IDMuODk1LTEwLjY4NyA3LjgzMy0xNi4wMSAxMS43NzgtMS4xOTYuODg3LTIuMzM3IDEuMTA5LTMuMzA0LS4yMDEtMS4wNjYtMS40NDUtLjA4LTIuMzA1IDEuMDI2LTMuMTE0IDMuOTU1LTIuODkzIDcuOTAzLTUuNzk4IDExLjgzNC04LjcyNUMyMy44NjUgMjQuODMgMjQuNTk1IDI0LjI2NyAyNS4wNTcgMjMuOTIyek0yMS43NSAzN0MyMC42MjUgMzcgMjAgMzYgMjAgMzVzLjYyNS0yIDEuNzUtMmM0LjIyNCAwIDYuMTEyIDAgOS41IDAgMS4xMjUgMCAxLjc1IDEgMS43NSAycy0uNjI1IDItMS43NSAyQzI5LjEyNSAzNyAyNSAzNyAyMS43NSAzN3oiLz48L3N2Zz4=)](https://www.powershellgallery.com/packages/Raindrop.API)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

PowerShell module to interact with the [**Raindrop.io**](https://developer.raindrop.io//).

## Available Endpoints

### Authentication
- **Get-RaindropAuthHeader**: Builds an authorization header for API requests.

### User
- **Get-RaindropBackup**: Retrieves a list of backups for the authenticated user.
-
### Backup
- **New-RaindropBackup**: Creates a new backup for the authenticated user. This requires some time.
- **Get-RaindropBackup**: Retrieves a list of backups for the authenticated user.
- **Save-RaindropBackup**: Saves a backup to a file in the specified format.

### Export
- **Export-Raindrop**: Exports a collection of Raindrop bookmarks in the specified format.

## License
[MIT License](LICENSE.md) © Alan Płócieniak