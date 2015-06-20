
gulp = require 'gulp'
packager = require 'electron-packager'

gulp.task 'electron', ->
  packager(
    dir: '.'
    out: 'release/darwin'
    name: 'SlackTrend'
    arch: 'x64'
    platform: 'darwin'
    version: '0.28.1'
  , (err, path) ->
  )