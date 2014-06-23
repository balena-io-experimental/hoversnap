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

# Cleanup code
process.on 'SIGINT', ->
	console.log('Got SIGINT. Cleaning up gpio state')
	piGpio.close(11)

process.on 'uncaughtException', (err) ->
	console.log('Uncaught exception! Cleaning up gpio state')
	piGpio.close(11)
	console.log(err)
	process.exit()
