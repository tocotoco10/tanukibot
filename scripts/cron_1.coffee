#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = "い"

post_news = (limit) ->
  limit += "ーち"

module.exports = (robot) ->
  new cronJob( '0 29 0 * * *', () =>
    robot.send {room:"general"}, post_news(limit), null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 30 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
