_ = require 'lodash'

module.exports =
	dedup: (prev=null) -> (data) ->
		if data isnt prev then @emit('data', data)
		prev = data

	lowPass: (wait) ->
		fn = (data) -> @emit('data', data)
		_.throttle(fn, wait, trailing: false)

	threshold: (threshold) -> (data) ->
		if data > threshold then @emit('data', data)

