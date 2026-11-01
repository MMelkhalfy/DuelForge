# DuelForge

DuelForge is a Yu-Gi-Oh! card creation project. The repository keeps the Android project and a Windows desktop wrapper together so they can share the same web application assets.

## Repository layout

```text
DuelForge/
├── Android/                 # Android project and its bundled web application
│   └── assets/
│       └── public/          # Compiled web app served by the desktop wrapper
└── Windows/                 # Electron desktop application
    ├── build/
    │   └── icon.ico
    ├── electron/
    │   └── main.cjs
    ├── package.json
    ├── package-lock.json
    └── prepare.ps1
```

The Android web assets in `Android/assets/public/` are the source used by the Windows wrapper. The preparation script copies them into `Windows/web/` before the desktop app starts or is packaged. The generated `Windows/web/` directory is intentionally ignored by Git; it is recreated from the Android project when needed.

## Windows desktop app

The Windows version uses [Electron](https://www.electronjs.org/) to run the existing DuelForge web application in a desktop window. It does not rebuild or modify the Android project.

### Requirements

- Windows 10 or 11 (64-bit)
- Node.js and npm
- The repository cloned with both the `Android/` and `Windows/` folders

### Run locally

Open PowerShell in the `Windows` directory:

```powershell
cd Windows
npm install
npm start
```

The `start` command runs `prepare:web` first. This copies the contents of `Android/assets/public/` into `Windows/web/`, validates the JavaScript and CSS files referenced by `index.html`, and then launches Electron.

If your Android project is stored outside the repository or uses a different folder location, run the preparation script with an explicit path to the Android project folder:

```powershell
.\prepare.ps1 -AndroidProjectPath "C:\path\to\Android"
```

### Build for Windows

Run these commands from the `Windows/` directory:

| Command | Output |
| --- | --- |
| `npm run pack:win` | Unpacked Windows application in `release/` |
| `npm run dist:win` | NSIS installer in `release/` |
| `npm run dist:portable` | Portable executable in `release/` |

The installer is configured for 64-bit Windows and allows the user to choose an installation directory.

## Development notes

- Make web application changes in the Android project, then run the Windows preparation/build command to refresh the desktop copy.
- Do not edit `Windows/web/` as the permanent source; it is generated and replaced during preparation.
- Keep `Windows/build/icon.ico` tracked. Installer output, generated web copies, dependencies, and build output are excluded by `.gitignore`.
- The Electron renderer runs with Node integration disabled, context isolation enabled, and sandboxing enabled.
- The desktop wrapper serves local files through the `duelforge://app/` protocol and opens permitted external links in the system browser.
- Browser-based storage and sharing can behave differently from Android native features. Desktop-specific handling may be needed for features that depend on Android plugins or the native share sheet.

## Android build

The repository includes the Android project, but this README does not prescribe an Android build command. Use the build process and tooling appropriate to the Android project as currently maintained.

## License

DuelForge is licensed under the [Apache License 2.0](LICENSE). You may use, modify, and distribute the project under its terms. The license does not grant permission to use the DuelForge name or branding as a trademark.
