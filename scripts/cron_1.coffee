#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'

post_news = (limit) ->
  limit = limit + 1
	string(limit)

module.exports = (robot) ->
  new cronJob( '0 24 0 * * *', () =>
    robot.send {room:"general"}, post_news(limit = 2), null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 25 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
