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
		  article = "Yahooトピック\n"
			for id, entry of data["feed"].entry when id < limit
			  title = entry.title
				link  = entry.id
				article += "{#link}\n" unless /~PR.*/.test(title)
		  robot.send {room:"general"}, article, null, true, "Asis/Tokyo"
#      robot.send {room:"general"}, article

module.exports = (robot) ->
  new cronJob('0 42 1 * * *', () =>
      robot.send {room:"general"}, "さーん！", null ,true, "Asia/Tokyo"
#    robot.send post_topic_news(robot,limit)
#     post_topic_news(robot,limit)
#  , null, true, "Asia/Tokyo"
#	    post_topic_news(robot,limit), null,i true, "Asia/Tokyo"
#      robot.send {room: "general"}, "タイマーのテストぽぽーん", null, true, "Asia/Tokyo"
#       null, true, "Asis/Tokyo"
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
