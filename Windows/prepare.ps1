param(
    [string]$AndroidProjectPath = (Join-Path (Split-Path -Parent $PSScriptRoot) 'Android')
)

$ErrorActionPreference = 'Stop'
$sourcePublic = Join-Path $AndroidProjectPath 'assets\public'
$webRoot = Join-Path $PSScriptRoot 'web'

if (-not (Test-Path (Join-Path $sourcePublic 'index.html'))) {
    Write-Host ''
    Write-Host 'Could not find DuelForge web assets.' -ForegroundColor Red
    Write-Host "Expected: $sourcePublic\index.html" -ForegroundColor Yellow
    Write-Host ''
    Write-Host 'Pass your project folder explicitly, for example:' -ForegroundColor Yellow
    Write-Host '.\prepare.ps1 -AndroidProjectPath "C:\Users\mohmo\Downloads\DuelForge-unsigned"'
    exit 1
}

if (Test-Path $webRoot) {
    Remove-Item $webRoot -Recurse -Force
}
New-Item -ItemType Directory -Path $webRoot -Force | Out-Null

Write-Host 'Copying DuelForge web assets...' -ForegroundColor Cyan
Copy-Item -Path (Join-Path $sourcePublic '*') -Destination $webRoot -Recurse -Force

$requiredFiles = @(
    (Join-Path $webRoot 'index.html'),
    (Join-Path $webRoot 'assets\index-DE2h1T9a.js'),
    (Join-Path $webRoot 'assets\index-DTX2HEPQ.css')
)
foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        throw "Required DuelForge asset is missing: $file"
    }
}

Write-Host ''
Write-Host 'DuelForge web assets are ready.' -ForegroundColor Green
Write-Host "Source:      $sourcePublic"
Write-Host "Destination: $webRoot"
Write-Host 'Your existing Android project was not modified.' -ForegroundColor Green
