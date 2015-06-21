'use strict';

var app = require('app');
var BrowserWindow = require('browser-window');
var Menu = require('menu');

require('crash-reporter').start();

var mainWindow = null;

app.on('window-all-closed', function() {
    if (process.platform != 'darwin')
        app.quit();
});

app.on('ready', function() {
    Menu.setApplicationMenu(menu);

    mainWindow = new BrowserWindow({
        width: 800,
        height: 700,
        'max-height': 700,
        fullscreen: false
    });

    mainWindow.loadUrl('file://' + __dirname + '/index.html');
    mainWindow.on('closed', function() {
        mainWindow = null;
    });
});

var template = [
    {
        label: 'SlackTrend',
        submenu: [
            {
                label: 'About SlackTrend',
                selector: 'orderFrontStandardAboutPanel:'
            },
            {
                label: 'Quit',
                accelerator: 'Command+Q',
                click: function () {
                    app.quit();
                }
            }
        ]
    }, {
        label: 'View',
        submenu: [
            {
                label: 'Reload',
                accelerator: 'Command+R',
                click: function() {
                    BrowserWindow.getFocusedWindow().reloadIgnoringCache();
                }
            }
        ]
    }, {
        label: 'Window',
        submenu: [
            {
                label: 'Minimize',
                accelerator: 'Command+M',
                selector: 'performMiniaturize:'
            },
            {
                type: 'separator'
            },
            {
                label: 'Bring All to Front',
                selector: 'arrangeInFront:'
            }
        ]
    }, {
        label: 'Help',
        submenu: []
    }
];

var menu = Menu.buildFromTemplate(template);