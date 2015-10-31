cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob(  '0 59 22 * * *', () =>
#	    envelope = room: "general"
#			say      = "タイマーのテストぽぽーん" 
		  robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
  ).start()

