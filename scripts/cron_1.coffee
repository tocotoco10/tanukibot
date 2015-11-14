cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob(  '0 59 22 * * *', () =>
      robot.send {room: "general"}, "タイマーのテストぽぽーん", null, false, "Asia/Tokyo"
  ).start()

  new cronJob( '0 41 20 * * *', () =>
      robot.send {room:"general"}, "いち！", null ,false, "Asia/Tokyo"
  ).start()

  new cronJob( '0 42 20 * * *', () =>
      robot.send {room:"general"}, "にぃ！", null ,false, "Asia/Tokyo"
  ).start()

module.exports = (robot) ->
  robot.respond /start cron_1/i, (msg) ->
	msg.send "『CronJob_1』ジョブ開始しますね..."
	cronJob.start()
	
	robot.respond /stop cron_1/i, (msg) ->
	msg.send "『CronJob_1』ジョブ停止しますね..."
	cronJob.stop()
