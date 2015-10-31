cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob
	  cronTime: "0 05 22 * * *"
		onTick: ->
		  robot.send {room:"general"}, "起きてますか？"
			  return
		  start: true
			timeZone: "Asia/Tokyo"

