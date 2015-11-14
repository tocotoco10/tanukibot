cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = 3

post_topic_news = (robot, limit) ->
#  url = 'http://feed.rssad.jp/rss/nikkansports/professional/atom.xml'
	options =
	  url: 'http://news.yahoo.co.jp/pickup/rss.xml'
		timeout: 2000
		headers: {'user-agent': 'node title fetcher'}
  request options, (error, response, body) ->
	  to_json body, (err, data) =>
		  article = "☆YYahooトピック☆ \n"
			for id, entry of data["feed"].entry when id < limit
			  title = entry.title
				link = entry.id
				article += "{link}\n" unless /~PR.*/.test(title)
		  robot.send {room:"general"}, article, null, true, "Asis/Tokyo"

module.exports = (robot) ->
  new cronJob(  '0 39 2 * * *', () =>
	     post_topic_news(robot,limit),
#      robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
       null, true, "Asis/Tokyo"
  ).start()

  new cronJob( '0 20 21 * * *', () =>
      robot.send {room:"general"}, "いち！", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 21 21 * * *', () =>
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
