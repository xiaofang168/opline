class SocketController
	constructor: (msgCallBack)->
		@socket = io()
		@socket.on 'connect', ->
			console.log('connected')
		@socket.on 'message', (data) ->
			msgCallBack(data)
		@socket.on 'disconnect', ->
			console.log('disconnected')

	tail: (file)=>
		@socket.send(file)
		