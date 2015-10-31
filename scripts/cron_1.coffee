cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob ('0 47 22 * * *', () =>
	    envelope = room: "general"
			say      = "タイマーのテストぽぽーん" 
		  robot.send envelope, say, null, true, "Asia/Tokyo"
  )


