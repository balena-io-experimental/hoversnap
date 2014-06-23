es = require 'event-stream'
camera = require './camera'
filters = require './filters'
gpioStream = require './gpio-stream'

JUMP_WAIT = process.env.JUMP_WAIT or 3

logGetReady = (data) ->
	if data is 0 then console.log("Get ready to jump in #{JUMP_WAIT} seconds!")
	@emit('data', data)

es.pipeline(
	# Get raw GPIO stream
	gpioStream()

	# Remove duplicate events (GPIO sends noise sometimes)
	es.through filters.dedup()

	# Throttle state changes to max 1 per JUMP_WAIT seconds
	es.through filters.lowPass(JUMP_WAIT * 1000)

	# Remove duplicate events (Can happen due to previous filtering)
	es.through filters.dedup()

	# Tell the user to get ready
	es.through logGetReady

	# Create the shutter trigger event stream
	es.through filters.threshold(0.5)

	# Map each trigger event to a JPEG capture
	es.through camera.captureStream()
)
