cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 5 02 * * 1-5', () =>
	    robot.send {room: "general"}, "朝会だお"
			  , null, true, "Asia/Tokyo"
