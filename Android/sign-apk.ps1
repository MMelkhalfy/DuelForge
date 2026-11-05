
$ErrorActionPreference = "Stop"

# Paths
$AndroidDir = $PSScriptRoot
$DistDir = Join-Path $AndroidDir "dist"

$UnsignedApk = Join-Path $DistDir "Android-unsigned.apk"
$AlignedApk = Join-Path $DistDir "Android-aligned.apk"
$SignedApk = Join-Path $DistDir "Android.apk"

$Keystore = Join-Path $env:USERPROFILE "duelforge-key.jks"
$Alias = "duelforge"

# Check required files
foreach ($file in @($UnsignedApk, $Keystore)) {
    if (-not (Test-Path $file)) {
        throw "Required file not found: $file"
    }
}

# Check Android build tools
foreach ($tool in @("zipalign", "apksigner")) {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        throw "$tool was not found in PATH. Install Android SDK Build Tools or add its folder to PATH."
    }
}

Write-Host "`n[1/3] Aligning APK..." -ForegroundColor Cyan

zipalign -p -f 4 $UnsignedApk $AlignedApk

if ($LASTEXITCODE -ne 0) {
    throw "zipalign failed."
}

Write-Host "`n[2/3] Signing APK..." -ForegroundColor Cyan

apksigner sign `
    --ks $Keystore `
    --ks-key-alias $Alias `
    --out $SignedApk `
    $AlignedApk

if ($LASTEXITCODE -ne 0) {
    throw "APK signing failed."
}

Write-Host "`n[3/3] Verifying signature..." -ForegroundColor Cyan

apksigner verify --verbose $SignedApk

if ($LASTEXITCODE -ne 0) {
    throw "APK signature verification failed."
}

Write-Host "`nSUCCESS! Signed APK created:" -ForegroundColor Green
Write-Host $SignedApk -ForegroundColor Green
