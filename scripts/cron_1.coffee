cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob
	  cronTime: '0 11 22 * * 1-7'
		onTick: ->
		  robot.send {room:"general"}, "起きてますか？", null, true, "Asia/Tokyo"

