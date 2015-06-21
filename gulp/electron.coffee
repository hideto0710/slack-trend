
gulp = require 'gulp'
packager = require 'electron-packager'

gulp.task 'electron', ->
  packager(
    dir: '.'
    out: 'release/darwin'
    name: 'SlackTrend'
    arch: 'x64'
    platform: 'darwin'
    version: '0.28.0'
    'app-version': 'Version 0.1.0'
  , (err, path) ->
  )
  packager(
    dir: '.'
    out: 'release/win32'
    name: 'SlackTrend'
    arch: 'x64'
    platform: 'win32'
    version: '0.28.0'
    'app-version': 'Version 0.1.0'
  , (err, path) ->
  )