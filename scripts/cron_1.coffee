cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 42 0 * * 1-5', () =>
	    robot.send {room: "general"}, "cron"
			  , null, true, "Asia/Tokyo"
