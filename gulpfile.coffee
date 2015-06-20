
require('require-dir')('./gulp')

gulp = require 'gulp'
del = require 'del'

gulp.task 'watch', ->
  gulp.watch './src/styles/**/*.css', ['styles']

gulp.task 'default', ['scripts', 'styles', 'watch']

# delete bundle.js
gulp.task 'clean', (cb) ->
  del ['./bundle'], cb