
gulp = require 'gulp'
packager = require 'electron-packager'

gulp.task 'electron:darwin', ->
  packager(
    dir: '.'
    out: 'release/darwin'
    name: 'SlackTrend'
    arch: 'x64'
    platform: 'darwin'
    version: '0.28.2'
    ignore: 'node_modules/'
    icon: 'dist/SlackTrend.icns'
    prune: true
    'app-version': 'Version 0.1.0'
  , (err, path) ->
  )

gulp.task 'electron:win32', ->
  packager(
    dir: '.'
    out: 'release/win32'
    name: 'SlackTrend'
    arch: 'x64'
    platform: 'win32'
    version: '0.28.2'
    ignore: 'node_modules/'
    prune: true
    'app-version': 'Version 0.1.0'
  , (err, path) ->
  )

gulp.task 'electron', ['electron:darwin', 'electron:win32']