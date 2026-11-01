'use strict';

const { app, BrowserWindow, Menu, protocol, shell } = require('electron');
const fs = require('node:fs/promises');
const path = require('node:path');

// A secure, standard custom protocol keeps the renderer on a stable local origin.
protocol.registerSchemesAsPrivileged([
  {
    scheme: 'duelforge',
    privileges: {
      standard: true,
      secure: true,
      supportFetchAPI: true,
      corsEnabled: true,
      stream: true
    }
  }
]);

const APP_HOST = 'app';
const WEB_ROOT = path.join(app.getAppPath(), 'web');
const DEFAULT_ZOOM_FACTOR = 0.6; // 60% initial UI scale for desktop
const MIN_ZOOM_FACTOR = 0.4;
const MAX_ZOOM_FACTOR = 1.5;
let mainWindow;

function adjustZoom(delta) {
  if (!mainWindow) return;
  const current = mainWindow.webContents.getZoomFactor();
  const next = Math.min(MAX_ZOOM_FACTOR, Math.max(MIN_ZOOM_FACTOR, current + delta));
  mainWindow.webContents.setZoomFactor(Number(next.toFixed(2)));
}

function resetZoom() {
  if (mainWindow) mainWindow.webContents.setZoomFactor(DEFAULT_ZOOM_FACTOR);
}

const MIME_TYPES = {
  '.html': 'text/html; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.mjs': 'text/javascript; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.map': 'application/json; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.webp': 'image/webp',
  '.gif': 'image/gif',
  '.ico': 'image/x-icon',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.ttf': 'font/ttf',
  '.otf': 'font/otf',
  '.txt': 'text/plain; charset=utf-8',
  '.wasm': 'application/wasm'
};

function response(status, body, contentType = 'text/plain; charset=utf-8') {
  return new Response(body, {
    status,
    headers: {
      'Content-Type': contentType,
      'X-Content-Type-Options': 'nosniff',
      'Cache-Control': 'no-store'
    }
  });
}

async function handleAppProtocol(request) {
  let url;
  try {
    url = new URL(request.url);
  } catch {
    return response(400, 'Bad request');
  }

  if (url.hostname !== APP_HOST || !['GET', 'HEAD'].includes(request.method)) {
    return response(404, 'Not found');
  }

  let pathname;
  try {
    pathname = decodeURIComponent(url.pathname);
  } catch {
    return response(400, 'Invalid path');
  }

  if (!pathname || pathname === '/') pathname = '/index.html';
  const relativePath = pathname.replace(/^[/\\]+/, '');
  const filePath = path.resolve(WEB_ROOT, relativePath);
  const relativeCheck = path.relative(WEB_ROOT, filePath);

  // Prevent a crafted URL from reading files outside the packaged web directory.
  if (relativeCheck.startsWith('..') || path.isAbsolute(relativeCheck)) {
    return response(403, 'Forbidden');
  }

  try {
    const stat = await fs.stat(filePath);
    if (!stat.isFile()) return response(404, 'Not found');

    const contentType = MIME_TYPES[path.extname(filePath).toLowerCase()] || 'application/octet-stream';
    if (request.method === 'HEAD') {
      return new Response(null, {
        status: 200,
        headers: {
          'Content-Type': contentType,
          'Content-Length': String(stat.size),
          'X-Content-Type-Options': 'nosniff',
          'Cache-Control': 'no-store'
        }
      });
    }

    const data = await fs.readFile(filePath);
    return new Response(data, {
      status: 200,
      headers: {
        'Content-Type': contentType,
        'Content-Length': String(data.byteLength),
        'X-Content-Type-Options': 'nosniff',
        'Cache-Control': 'no-store'
      }
    });
  } catch (error) {
    if (error && error.code === 'ENOENT') return response(404, 'Not found');
    console.error('Failed to serve local DuelForge asset:', error);
    return response(500, 'Unable to load application asset');
  }
}

function openAllowedExternalUrl(rawUrl) {
  try {
    const parsed = new URL(rawUrl);
    if (parsed.protocol === 'https:' || parsed.protocol === 'http:' || parsed.protocol === 'mailto:') {
      return shell.openExternal(parsed.href);
    }
  } catch {
    // Ignore malformed URLs rather than passing them to the operating system.
  }
  return Promise.resolve();
}

function createWindow() {
  mainWindow = new BrowserWindow({
    icon: path.join(__dirname, '..', 'build', 'icon.ico'),
    width: 1440,
    height: 960,
    minWidth: 980,
    minHeight: 680,
    show: false,
    autoHideMenuBar: true,
    backgroundColor: '#101116',
    title: 'DuelForge',
    webPreferences: {
      nodeIntegration: false,
      contextIsolation: true,
      sandbox: true,
      webSecurity: true,
      devTools: !app.isPackaged
    }
  });

  // The original app is mobile-first; 60% gives the desktop editor substantially more room.
  mainWindow.webContents.setZoomFactor(DEFAULT_ZOOM_FACTOR);

  mainWindow.once('ready-to-show', () => mainWindow.show());

  mainWindow.webContents.setWindowOpenHandler(({ url }) => {
    void openAllowedExternalUrl(url);
    return { action: 'deny' };
  });

  mainWindow.webContents.on('will-navigate', (event, targetUrl) => {
    if (targetUrl.startsWith('duelforge://app/')) return;
    event.preventDefault();
    void openAllowedExternalUrl(targetUrl);
  });

  mainWindow.webContents.on('will-redirect', (event, targetUrl) => {
    if (targetUrl.startsWith('duelforge://app/')) return;
    event.preventDefault();
    void openAllowedExternalUrl(targetUrl);
  });

  mainWindow.on('closed', () => {
    mainWindow = null;
  });

  mainWindow.loadURL('duelforge://app/index.html').catch(error => {
    console.error('Could not load DuelForge. Run prepare.ps1 first.', error);
  });
}

const gotSingleInstanceLock = app.requestSingleInstanceLock();
if (!gotSingleInstanceLock) {
  app.quit();
} else {
  app.on('second-instance', () => {
    if (mainWindow) {
      if (mainWindow.isMinimized()) mainWindow.restore();
      mainWindow.focus();
    }
  });

  app.whenReady().then(async () => {
    const indexPath = path.join(WEB_ROOT, 'index.html');
    try {
      await fs.access(indexPath);
    } catch {
      console.error('DuelForge web assets are missing. Run: npm run prepare:web');
      app.quit();
      return;
    }

    protocol.handle('duelforge', handleAppProtocol);

    // The editor uses local assets and does not need browser permission prompts.
    app.on('web-contents-created', (_event, contents) => {
      contents.session.setPermissionRequestHandler((_webContents, _permission, callback) => callback(false));
    });

    const appMenu = Menu.buildFromTemplate([
      {
        label: 'File',
        submenu: [{ role: 'quit', label: 'Exit DuelForge' }]
      },
      {
        label: 'Edit',
        submenu: [
          { role: 'undo' }, { role: 'redo' }, { type: 'separator' },
          { role: 'cut' }, { role: 'copy' }, { role: 'paste' }, { role: 'selectAll' }
        ]
      },
      {
        label: 'View',
        submenu: [
          { role: 'reload' },
          ...(app.isPackaged ? [] : [{ role: 'toggleDevTools' }]),
          { type: 'separator' },
          { label: 'Zoom In (5%)', accelerator: 'CommandOrControl+=', click: () => adjustZoom(0.05) },
          { label: 'Zoom Out (5%)', accelerator: 'CommandOrControl+-', click: () => adjustZoom(-0.05) },
          { label: 'Reset Zoom (60%)', accelerator: 'CommandOrControl+0', click: resetZoom },
          { type: 'separator' },
          { role: 'togglefullscreen' }
        ]
      }
    ]);
    Menu.setApplicationMenu(appMenu);

    createWindow();
  }).catch(error => {
    console.error('DuelForge startup failed:', error);
    app.quit();
  });
}

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) createWindow();
});
