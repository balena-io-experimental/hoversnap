es = require 'event-stream'
{Gpio} = require 'onoff'

module.exports = (pin) ->
	# Create a raw event stream from the Gpio
	gpioEventStream = es.through()

	gpio = new Gpio(pin, 'in', 'both')
	gpio.watch (err, value) ->
		if not err then gpioEventStream.write(Number(value))
	
	return gpioEventStream
