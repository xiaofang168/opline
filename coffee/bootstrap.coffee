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
	client.on 'spawn',(msg) ->
		console.log("spawn command:#{msg.command}; args:#{msg.args}")
		proc = spawn("tail", msg.args)
		proc.stdout.on 'data', (data) ->
			client.emit("spawn",data.toString())

	client.on 'exec', (msg) ->
		console.log "exec: #{msg}"


http.listen 8080, ->
	console.log('listening on *:8080')