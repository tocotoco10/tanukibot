cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob(  '0 59 22 * * *', () =>
      robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 21 20 * * *', () =>
      robot.send {room:"general"}, "いち！", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 22 20 * * *', () =>
      robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"

