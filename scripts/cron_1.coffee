cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = 2

post_news = (limit) ->
  limit

#  url = 'http://feed.rssad.jp/rss/nikkansports/professional/atom.xml'
#	options =
#	  url: "http://news.yahoo.co.jp/pickup/rss.xml"
#    url: "http://feed.rssad.jp/rss/nikkansports/professional/atom.xml"
#    timeout: 2000
#		headers: {'user-agent': 'node title fetcher'}
#  request options, (error, response, body) ->
#	  to_json body, (err, data) =>
#		  article = "Yahooトピック\n"
#			for id, entry of data["feed"].entry when id < limit
#			  title = entry.title
#				link  = entry.id
#				article += "#{link}\n" unless /^PR.*/.test(title)
#        robot.send {room:"general"}, article

module.exports = (robot) ->
  new cronJob( '0 58 0 * * *', () =>
    robot.send {room:"general"}, "いち", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 59 0 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()
