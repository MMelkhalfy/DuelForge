# DuelForge Desktop (Electron)

This is a separate Windows desktop wrapper for DuelForge. It reuses the web application already inside your decompiled Android project; it does not modify the Android project or its APK build process.

## What this package includes

- Electron main process with a secure local `duelforge://` protocol.
- Node integration disabled in the renderer; context isolation and sandboxing enabled.
- A PowerShell preparation script that copies the current `assets/public` folder from the neighboring `DuelForge-unsigned` project.
- Windows NSIS installer and portable EXE build scripts.

The Electron wrapper deliberately does not include a second copy of DuelForge's 200+ MB web assets. It copies them from your existing Android project when you prepare or build the desktop app. This also means it uses the JavaScript and custom card assets currently in your local `DuelForge-unsigned` folder, including any changes you have already applied there.

## Requirements

- Windows 10/11, 64-bit.
- Node.js and npm installed.
- Your existing decompiled project folder named `DuelForge-unsigned` next to this folder, with `assets/public/index.html` inside it.
- Internet access for the first `npm install` and Electron Builder's first packaging run.

## Folder arrangement

Extract this folder beside your existing project so the layout is:

```text
Downloads/
  DuelForge-unsigned/
    assets/public/index.html
    ...
  DuelForge-Desktop-Electron/
    package.json
    prepare.ps1
    electron/main.cjs
```

If your Android project is somewhere else, pass its folder path to `prepare.ps1`.

## Run in development

Open PowerShell in `DuelForge-Desktop-Electron` and run:

```powershell
npm install
npm start
```

`npm start` automatically copies the current Android web assets into `web/` before opening the Electron window.

To specify the Android project path explicitly:

```powershell
.\prepare.ps1 -AndroidProjectPath "C:\Users\mohmo\Downloads\DuelForge-unsigned"
npm start
```

## Build the Windows installer (.exe)

```powershell
npm run dist:win
```

The installer will be created in:

```text
release/DuelForge-Setup-1.0.0.exe
```

To create a portable EXE instead:

```powershell
npm run dist:portable
```

To create an unpacked test build:

```powershell
npm run pack:win
```

## Capacitor compatibility notes

The compiled web bundle includes Capacitor's browser implementations for Filesystem and Share. In Electron, `Capacitor.isNativePlatform()` should be false, so DuelForge takes its ordinary web export path instead of the Android Documents/share path. The browser Filesystem implementation stores files in IndexedDB, not directly in Windows Documents. Card PNG/JSON downloads from ordinary browser download paths should use Electron/Chromium's download handling.

The Web Share API is not consistently available in desktop Chromium/Electron, so any UI that explicitly requires the native share sheet may be unavailable. A later desktop-specific pass can wire those actions to Windows Save As dialogs if needed.

## Troubleshooting

- If `prepare.ps1` cannot find the Android project, check the folder arrangement or pass `-AndroidProjectPath` explicitly.
- If the app opens to a blank window, press `Ctrl+R` to reload in development, or run `npm start` from PowerShell and inspect the console output. Development builds enable DevTools from the View menu.
- If YGOPRODeck requests fail, check the API availability and Electron DevTools Network/Console messages. The local app wrapper does not proxy or alter third-party API requests.

## Notes

This project is an Electron wrapper around the existing compiled Vue/Vite web app, not a reconstruction of DuelForge's original Vue source. Android-specific native plugins may need dedicated desktop implementations if later features rely on them.
