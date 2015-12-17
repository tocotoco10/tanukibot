#
#
#

cronJob = require('cron').CronJob
#to_json = require('xmljson').to_json
request = require 'request'

module.exports = (robot) ->
  new cronJob( '0 07 0 * * *', () =>
    robot.send {room:"general"}, "あ", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 08 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
