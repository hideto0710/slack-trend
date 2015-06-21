
gulp = require 'gulp'
$ = require('gulp-load-plugins')()

# browserify
browserify = require 'browserify'
watchify = require 'watchify'
coffee_reactify = require 'coffee-reactify'

source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'

# .jsx -> ./bundle/index.min.js
gulp.task 'scripts', ->

  bundler = watchify browserify({
    entries: ['./src/scripts/main.cjsx']
    transform: [coffee_reactify]
    insertGlobals: true
    debug: true
    cache: {}
    packageCache: {}
    fullPaths: true
  })

  rebundle = ->
    bundler.bundle()
      .on 'error', $.util.log.bind $.util, 'Browserify Error'
      .pipe source 'index.js'
      .pipe buffer()
      .pipe $.sourcemaps.init { loadMaps: true }
      .pipe $.rename { suffix: '.min' }
      .pipe $.sourcemaps.write()
      .pipe gulp.dest './bundle'

  bundler.on 'update', rebundle

  rebundle()