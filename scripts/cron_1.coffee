cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob '0 32 22 * * *', () =>
		  robot.send {room:"general"}, "もうすぐ1日が終わりますな･･･", null, true, "Asia/Tokyo"


