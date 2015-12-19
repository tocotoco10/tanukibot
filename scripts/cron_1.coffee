#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

module.exports = (robot) ->
  new cronJob( '0 14 2 * * *', () =>
    url = "http://b.hatena.ne.jp/hotentry/it.rss"
		options =
		  url: url
			timeout: 2000
			headers: {'user-agent': 'node title fetcher'}
		request options, (error, response, body) ->
		  to_json body, (err, data) =>
			article = "はてブITカテゴリ ホットエントリ¥n"
			for id, item of data["rdf:RDF"].item
			  title = item.title
		    link  = item.link
				article += "#{title} #{link}¥n"
		  robot.send {room:"general"}, article
  , null, true, "Asia/Tokyo"
#robot.send {room:"general"}, post_news(), null ,true, "Asia/Tokyo"
  ).start()
#
#  new cronJob( '0 55 1 0 * * *', () =>
#    robot.send {room:"general"}, "にぃ！", null ,true, "Asia/Tokyo"
#  ).start()
