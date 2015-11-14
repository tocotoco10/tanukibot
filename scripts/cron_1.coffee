cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob(  '0 59 22 * * *', () =>
#	    envelope = room: "general"
#			say      = "タイマーのテストぽぽーん" 
		  robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 25 13 * * *', () =>
	    robot.send {room:"general"}, "いち！", null ,true, "Asia/Tokyo"
  ).start()

	
	nJob( '0 26 13 * * *', () =>
	 11       robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
	  12   ).start()
