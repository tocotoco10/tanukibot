cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob(  '0 59 22 * * *', () =>
#	    envelope = room: "general"
#			say      = "タイマーのテストぽぽーん" 
		  robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 27 14 * * *', () =>
	    robot.send {room:"general"}, "いち！", null ,true, "Asia/Tokyo"
  ).start();

	
	new cronJob( '0 28 14 * * *', () =>
      robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start();
