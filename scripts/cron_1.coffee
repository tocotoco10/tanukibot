#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

post_news = (limit) ->
  url = "http://feed.rssad.jp/rss/nikkansports/professional/atom.xml"
	options =
	  url: url
		timeout: 2000
		headers: {'user-agent':'node title fetcher'}

  request options, (error, response, body) ->
    to_json body, (err, data) =>
      limit = "今日のニュース\n"
      for id, entry of data["feed"].entry when id < 3
		    title = entry.title
				link  = entry.id
				limit += "#{link}\n" unless /^PR.*/.test(title)
		  limit = limit

module.exports = (robot) ->
  new cronJob( '0 54 1 * * *', () =>
    robot.send {room:"general"}, post_news(limit), null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 55 1 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
