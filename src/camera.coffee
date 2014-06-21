{spawn} = require 'child_process'

ps = spawn('gphoto2', ['--shell'])

exports.captureStream = ->
	ps.stdin.write('capture-image\n')
