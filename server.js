var Gpio = require('onoff').Gpio
var pad = new Gpio(17, 'in', 'both')

var spawn = require('child_process').spawn;
var ps = spawn('gphoto2', ['--shell']);

ps.stdout.pipe(process.stdout);
ps.stderr.pipe(process.stderr);

var padDown = 0;

pad.watch(function(err, value) {
	if (value === 0 && padDown === 0) {
		padDown = Date.now()
	} else {
		if (Date.now() - padDown < 3000) {
			padDown = 0;
		} else {
			ps.stdin.write('capture-image\n');
		}
	}
});
