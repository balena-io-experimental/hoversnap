fs = require 'fs'
path = require 'path'
{spawn} = require 'child_process'
express = require 'express'
serveIndex = require 'serve-index'

TMP_DIR = '/tmp/hoversnap'

fs.mkdirSync(TMP_DIR)
ps = spawn('gphoto2', ['--shell'], cwd: '/tmp/hoversnap')

module.exports = ->
	ps.stdin.write('capture-image-and-download\n')

app = express()
app.use(express.static(TMP_DIR))
app.use(serveIndex(TMP_DIR, icons: true))
app.listen(process.env.PORT || 8080)
