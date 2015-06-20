
gulp = require 'gulp'
$ = require('gulp-load-plugins')(
  rename:
    'gulp-concat-css': 'concatCss'
    'gulp-minify-css': 'minifyCss'
)

# .css -> ./bundle/index.min.css
gulp.task 'styles', ->
  gulp.src './src/styles/**/*.css'
  .pipe $.concatCss 'index.css'
  .pipe $.minifyCss()
  .pipe $.rename { suffix: '.min' }
  .pipe gulp.dest './bundle'
