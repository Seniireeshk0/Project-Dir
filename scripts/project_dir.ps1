<#
.SYNOPSIS
    Project-Dir utility for Antigravity.
    Manages the global root directory for all Antigravity projects and groups files cleanly.
#>

param(
    [switch]$GetRoot,
    [string]$SetRoot,
    [switch]$PickGui,
    [switch]$ListProjects,
    [string]$NewProject,
    [string]$Description
)

$configDir = "C:\Users\arsen\.gemini\config"
$configFile = Join-Path $configDir "workspace_settings.json"

function Get-Settings {
    if (Test-Path $configFile) {
        try {
            $json = Get-Content -Raw -Path $configFile | ConvertFrom-Json
            return $json
        } catch {
            Write-Warning "Could not parse $configFile"
        }
    }
    return [PSCustomObject]@{
        projects_root = ""
        is_configured = $false
        version       = "1.0.0"
    }
}

function Save-Settings ($settings) {
    if (-not (Test-Path $configDir)) {
        New-Item -ItemType Directory -Path $configDir -Force | Out-Null
    }
    $obj = [PSCustomObject]@{
        projects_root = $settings.projects_root
        is_configured = $true
        configured_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssK")
        version       = "1.0.0"
    }
    $obj | ConvertTo-Json -Depth 5 | Set-Content -Path $configFile -Encoding UTF8
    Write-Output "Config saved to: $configFile"
}

# 1. Pick via Native Windows Folder Dialog
if ($PickGui) {
    Add-Type -AssemblyName System.Windows.Forms
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $dialog.Description = "Select a root folder for all Antigravity projects:"
    $dialog.ShowNewFolderButton = $true

    $current = (Get-Settings).projects_root
    if ($current -and (Test-Path $current)) {
        $dialog.SelectedPath = $current
    }

    $result = $dialog.ShowDialog()
    if ($result -eq [System.Windows.Forms.DialogResult]::OK -and -not [string]::IsNullOrWhiteSpace($dialog.SelectedPath)) {
        $selected = $dialog.SelectedPath
        $settings = Get-Settings
        $settings.projects_root = $selected
        Save-Settings $settings
        Write-Output "SUCCESS: Root directory set to: $selected"
        exit 0
    } else {
        Write-Output "CANCELLED: No folder was selected."
        exit 1
    }
}

# 2. Set Root explicitly
if (-not [string]::IsNullOrWhiteSpace($SetRoot)) {
    $resolvedPath = [System.IO.Path]::GetFullPath($SetRoot)
    if (-not (Test-Path $resolvedPath)) {
        New-Item -ItemType Directory -Path $resolvedPath -Force | Out-Null
        Write-Output "Created directory: $resolvedPath"
    }
    $settings = Get-Settings
    $settings.projects_root = $resolvedPath
    Save-Settings $settings
    Write-Output "SUCCESS: Root directory set to: $resolvedPath"
    exit 0
}

# 3. Create New Project Subfolder
if (-not [string]::IsNullOrWhiteSpace($NewProject)) {
    $settings = Get-Settings
    $root = $settings.projects_root
    if ([string]::IsNullOrWhiteSpace($root) -or -not (Test-Path $root)) {
        Write-Error "ERROR: Projects root folder is not configured yet! Please run with -PickGui or -SetRoot first."
        exit 1
    }
    $projectDir = Join-Path $root $NewProject
    if (-not (Test-Path $projectDir)) {
        New-Item -ItemType Directory -Path $projectDir -Force | Out-Null
        New-Item -ItemType Directory -Path (Join-Path $projectDir "src") -Force | Out-Null
        New-Item -ItemType Directory -Path (Join-Path $projectDir "docs") -Force | Out-Null

        $readmePath = Join-Path $projectDir "README.md"
        $desc = if ($Description) { $Description } else { "Created by Antigravity Project-Dir." }
        $readmeContent = @"
# $NewProject

$desc

## Structure
- `src/`: Source code
- `docs/`: Documentation & notes
"@
        Set-Content -Path $readmePath -Value $readmeContent -Encoding UTF8
        Write-Output "SUCCESS: Created project folder at: $projectDir"
    } else {
        Write-Output "EXISTS: Project folder already exists at: $projectDir"
    }
    exit 0
}

# 4. List Projects
if ($ListProjects) {
    $settings = Get-Settings
    $root = $settings.projects_root
    if ([string]::IsNullOrWhiteSpace($root)) {
        Write-Output "NOT_CONFIGURED: Root folder has not been selected yet."
        exit 0
    }
    Write-Output "Projects Root: $root"
    if (Test-Path $root) {
        $dirs = Get-ChildItem -Path $root -Directory
        if ($dirs.Count -eq 0) {
            Write-Output "No projects found yet in $root"
        } else {
            Write-Output "Existing projects:"
            foreach ($d in $dirs) {
                Write-Output " - $($d.Name) ($($d.FullName))"
            }
        }
    } else {
        Write-Output "Root folder does not exist: $root"
    }
    exit 0
}

# Default / GetRoot
$settings = Get-Settings
if ([string]::IsNullOrWhiteSpace($settings.projects_root)) {
    Write-Output "NOT_CONFIGURED"
} else {
    Write-Output "Projects Root: $($settings.projects_root)"
}
