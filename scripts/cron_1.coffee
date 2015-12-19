#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

post_news = () ->
  url = "http://feed.rssad.jp/rss/nikkansports/professional/atom.xml"
	options =
	  url: url
		timeout: 2000
		headers: {'user-agent':'node title fetcher'}

  request options, (error, response, body) ->
    to_json body, (err, data) =>
      article = "今日のニュース\n"
      for id, entry of data["feed"].entry when id < 3
		    title = entry.title
				link  = entry.id
				article += "#{link}\n" unless /^PR.*/.test(title)

module.exports = (robot) ->
  new cronJob( '0 08 2 * * *', () =>
    robot.send {room:"general"}, post_news(), null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 55 1 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
