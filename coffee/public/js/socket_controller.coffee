class SocketController
	constructor: (msgCallBack)->
		@socket = io()
		@socket.on 'connect', ->
			console.log('connected')
		@socket.on 'spawn', (msg) ->
			msgCallBack(msg)
		@socket.on 'exec', (msg) ->
			msgCallBack(msg)
		@socket.on 'disconnect', ->
			console.log('disconnected')

	spawn: (msg)=>
		@socket.emit("spawn",msg)
	
	exec: (msg)=>
		@socket.emit("exec",msg)