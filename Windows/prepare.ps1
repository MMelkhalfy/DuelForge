param(
    [string]$AndroidProjectPath = (Join-Path (Split-Path -Parent $PSScriptRoot) 'Android')
)

$ErrorActionPreference = 'Stop'
$sourcePublic = Join-Path $AndroidProjectPath 'assets\public'
$webRoot = Join-Path $PSScriptRoot 'web'
$sourceIndex = Join-Path $sourcePublic 'index.html'

if (-not (Test-Path $sourceIndex -PathType Leaf)) {
    throw @"
Could not find DuelForge web assets.
Expected: $sourceIndex

Pass the Android project folder explicitly if it is stored elsewhere:
.\prepare.ps1 -AndroidProjectPath "C:\path\to\DuelForge\Android"
"@
}

if (Test-Path $webRoot) {
    Remove-Item $webRoot -Recurse -Force
}
New-Item -ItemType Directory -Path $webRoot -Force | Out-Null

Write-Host 'Copying DuelForge web assets...' -ForegroundColor Cyan
Copy-Item -Path (Join-Path $sourcePublic '*') -Destination $webRoot -Recurse -Force

$indexPath = Join-Path $webRoot 'index.html'
$html = Get-Content -Path $indexPath -Raw

# Validate the bundle referenced by index.html without hard-coding Vite's
# content-hashed filenames, which change whenever the Android app is rebuilt.
$scriptMatches = [regex]::Matches($html, '(?i)<script\b[^>]*\bsrc=["'']([^"'']+\.m?js(?:\?[^"'']*)?)["'']')
$styleMatches = [regex]::Matches($html, '(?i)<link\b[^>]*\bhref=["'']([^"'']+\.css(?:\?[^"'']*)?)["'']')

if ($scriptMatches.Count -eq 0) {
    throw 'The Android index.html does not reference a JavaScript bundle.'
}
if ($styleMatches.Count -eq 0) {
    throw 'The Android index.html does not reference a CSS bundle.'
}

foreach ($match in $scriptMatches) {
    $assetPath = ($match.Groups[1].Value -split '[?#]', 2)[0] -replace '/', '\'
    $assetPath = $assetPath -replace '^\.\\', ''
    $resolvedPath = Join-Path $webRoot $assetPath
    if (-not (Test-Path $resolvedPath -PathType Leaf)) {
        throw "Referenced JavaScript asset is missing: $resolvedPath"
    }
}

foreach ($match in $styleMatches) {
    $assetPath = ($match.Groups[1].Value -split '[?#]', 2)[0] -replace '/', '\'
    $assetPath = $assetPath -replace '^\.\\', ''
    $resolvedPath = Join-Path $webRoot $assetPath
    if (-not (Test-Path $resolvedPath -PathType Leaf)) {
        throw "Referenced CSS asset is missing: $resolvedPath"
    }
}

Write-Host ''
Write-Host 'DuelForge web assets are ready.' -ForegroundColor Green
Write-Host "Source:      $sourcePublic"
Write-Host "Destination: $webRoot"
Write-Host 'Your Android project was not modified.' -ForegroundColor Green
