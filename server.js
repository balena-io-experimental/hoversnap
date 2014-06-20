var Gpio = require('onoff').Gpio
var pad = new Gpio(17, 'in', 'both')

var spawn = require('child_process').spawn;
var ps = spawn('gphoto2', ['--shell']);

ps.stdout.pipe(process.stdout);
ps.stderr.pipe(process.stderr);

var padDown = 0;
var timeout = 0;

pad.watch(function(err, value) {
	if (value === 0 && padDown === 0) {
		padDown = Date.now()
		console.log('Stay there for at least 3 seconds...');
		timeout = setTimeout(function() {
			console.log('Ready! Waiting for jump...');
		}, 3000)
	} else {
		if (Date.now() - padDown < 3000) {
			console.log('Jump before 3 seconds detected. Try again.');
			clearTimeout(timeout);
		} else {
			ps.stdin.write('capture-image\n');
			console.log('Jump detected! Picture captured!');
		}
		padDown = 0;
	}
});
