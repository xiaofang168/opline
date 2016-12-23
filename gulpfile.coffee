gulp = require 'gulp'

coffee = require 'gulp-coffee'
watch = require 'gulp-watch'

gulp.task 'coffee', ->
	gulp.src('coffee/**/*.coffee')
	.pipe(coffee({bare: true}))
	.pipe(gulp.dest('.'))

### 监视文件的变化 ###

gulp.task 'watch', ->
	gulp.watch('coffee/**/*.coffee', ['coffee']);

gulp.task('default', ['coffee', 'watch']);