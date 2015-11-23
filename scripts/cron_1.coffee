cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = 2

post_news = (limit, article) ->
#  url = 'http://feed.rssad.jp/rss/nikkansports/professional/atom.xml'
	options =
#	  url: "http://news.yahoo.co.jp/pickup/rss.xml"
    url: "http://feed.rssad.jp/rss/nikkansports/professional/atom.xml"
    timeout: 2000
		headers: {'user-agent': 'node title fetcher'}
  request options, (error, response, body) ->
	  to_json body, (err, data) =>
		  article = "Yahooトピック\n"
			for id, entry of data["feed"].entry when id < limit
			  title = entry.title
				link  = entry.id
				article += "#{link}\n" unless /^PR.*/.test(title)
#		  return
#        robot.send {room:"general"}, article

module.exports = (robot) ->
  new cronJob( '0 51 22 * * *', () =>
    robot.send {room:"general"}, "いち！", null ,true, "Asia/Tokyo"
#    robot.send {room:"general"}, post_news(limit, article), null, true, "Asia/Tokyo"
).start()

  new cronJob( '0 50 22 * * *', () =>
    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
  ).start()


#module.exports = (robot) ->
#  robot.respond /start cron_1/i, (msg) ->
#  	msg.send "『CronJob_1』ジョブ開始しますね..."
#	  cronJob.start()
#	
#	robot.respond /stop cron_1/i, (msg) ->
#	  msg.send "『CronJob_1』ジョブ停止しますね..."
#	  cronJob.stop()
