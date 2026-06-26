# -----------------------------
# Factorio Mod Builder (PowerShell + 7-Zip)
# -----------------------------

$ErrorActionPreference = "Stop"

# Root folder (script location)
$ROOT = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ROOT

# -----------------------------
# Read info.json
# -----------------------------
$info = Get-Content "info.json" | ConvertFrom-Json
$MODNAME = $info.name
$VERSION = $info.version

if (-not $MODNAME -or -not $VERSION) {
    throw "Could not read name/version from info.json"
}

$ZIP_NAME = "${MODNAME}_${VERSION}.zip"
$TEMP_DIR = "${MODNAME}_build_temp"
$MOD_DIR = Join-Path $TEMP_DIR $MODNAME

Write-Host "Building $ZIP_NAME"

# -----------------------------
# Clean temp
# -----------------------------
if (Test-Path $TEMP_DIR) {
    Remove-Item $TEMP_DIR -Recurse -Force
}

New-Item -ItemType Directory -Path $MOD_DIR | Out-Null

# -----------------------------
# Copy files with exclusions
# -----------------------------
$excludeDirs = @(".git", ".vscode", ".idea", $TEMP_DIR)
$excludeExt  = @(".zip", ".sh", ".ps1", ".bat")

Get-ChildItem -Path $ROOT -Recurse -Force | ForEach-Object {

    $relative = $_.FullName.Substring($ROOT.Length + 1)

    # Skip temp folder
    if ($relative -like "$TEMP_DIR*") { return }

    # Skip excluded directories
    foreach ($dir in $excludeDirs) {
        if ($relative -like "$dir*") { return }
    }

    # Skip file extensions
    foreach ($ext in $excludeExt) {
        if ($_.Extension -eq $ext) { return }
    }

    $target = Join-Path $MOD_DIR $relative

    if ($_.PSIsContainer) {
        New-Item -ItemType Directory -Path $target -Force | Out-Null
    } else {
        $targetDir = Split-Path $target -Parent
        if (!(Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }
        Copy-Item $_.FullName $target -Force
    }
}

# -----------------------------
# Find 7-Zip
# -----------------------------
$sevenZip = $null

$possible = @(
    "$env:ProgramFiles\7-Zip\7z.exe",
    "$env:ProgramFiles(x86)\7-Zip\7z.exe"
)

foreach ($path in $possible) {
    if (Test-Path $path) {
        $sevenZip = $path
        break
    }
}

if (-not $sevenZip) {
    throw "7-Zip not found in Program Files"
}

# -----------------------------
# Create zip
# -----------------------------
Set-Location $TEMP_DIR

& $sevenZip a -tzip "..\$ZIP_NAME" $MODNAME | Out-Null

Set-Location $ROOT

# -----------------------------
# Cleanup
# -----------------------------
Remove-Item $TEMP_DIR -Recurse -Force

Write-Host "Done: $ZIP_NAME"