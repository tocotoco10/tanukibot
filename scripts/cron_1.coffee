#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

post_news = (limit) ->
  limit += "ーち"

module.exports = (robot) ->
  new cronJob( '0 20 1 * * *', () =>
    robot.send {room:"general"}, post_news(limit), null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 21 1 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
