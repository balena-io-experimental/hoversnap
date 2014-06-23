fs = require 'fs'
path = require 'path'
{spawn} = require 'child_process'

TMP_DIR = '/tmp/hoversnap'

fs.mkdirSync(TMP_DIR)
ps = spawn('gphoto2', ['--shell'], cwd: '/tmp/hoversnap')

# Data existence means we should trigger a photo
module.exports = es.through (data) ->
	ps.stdin.write('capture-image-and-download\n')
