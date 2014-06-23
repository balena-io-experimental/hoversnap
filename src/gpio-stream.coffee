es = require 'event-stream'
{Gpio} = require 'onoff'
piGpio = require 'pi-gpio'

module.exports = ->
	# Create a raw event stream from the Gpio
	gpioEventStream = es.through()

	# pi-gpio uses physical pin numbering
	piGpio.open(11, 'input pullup', (err) ->
		if err then return console.log(err)

		# onoff uses gpio pin numbering
		gpio = new Gpio(17, 'in', 'both')
		gpio.watch (err, value) ->
			if not err then gpioEventStream.write(Number(value))
	)
	
	return gpioEventStream
