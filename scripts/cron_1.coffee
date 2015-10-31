cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob
	  cronTime: '0 20 22 * * *'
		onTick: ->
		  robot.send {room:"general"}, "もうすぐ1日が終わりますな･･･", null, true, "Asia/Tokyo"

