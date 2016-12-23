'use strict'

path = require('path')
spawn = require('child_process').spawn
express = require('express')
app = express()
http = require('http').Server(app)
io = require('socket.io')(http)

indexRoute = require('./controller/index')

app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs')
app.use(express.static(__dirname + '/public'))

app.use('/', indexRoute)

io.on 'connection',(client)->
	client.on 'message',(path) ->
		console.log("gots a path: #{path}" )
		tail_f(path, client);

tail_f = (file, client) ->
	proc = spawn('tail', ['-f', file])
	proc.stdout.on 'data', (data) ->
		client.send(data.toString())

http.listen 8080, ->
	console.log('listening on *:8080')