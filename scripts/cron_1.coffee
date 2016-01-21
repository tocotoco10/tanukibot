#
#
#
#

cronJob = require('cron').CronJob
to_json = require('xmljson').to_json
request = require 'request'
limit   = ""

module.exports = (robot) ->
  new cronJob( '0 00 8 * * *', () =>
    url = "http://b.hatena.ne.jp/hotentry/it.rss"
    options =
      url: url
      timeout: 2000
      headers: {'user-agent': 'node title fetcher'}
    request options, (error, response, body) ->
      to_json body, (err, data) =>
        article = "はてブITカテゴリ ホットエントリ\n"
        for id, item of data["rdf:RDF"].item
          title = item.title
          link  = item.link
          article += "#{title} #{link}\n\n"
        robot.send {room:"general"}, article, null, true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 00 6 * * 1-5', () =>
    robot.send {room:"general"}, "おはようございますポン。", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 30 7 * * 0,6', () =>
    robot.send {room:"general"}, "休みの日はゆっくり寝るポン。\n(_ _).｡o○", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 00 15 * * 1-5', () =>
    robot.send {room:"general"}, "15:00をお知らせしますポン。\nお茶どーぞ。", null ,true, "Asia/Tokyo"
  ).start()

  new cronJob( '0 30 17 * * 1,2,4', () =>
    robot.send {room:"general"}, "17:30 定時ですポン。\n今日は残業でしょうかね？", null ,true ,"Asia/Tokyo"
  ).start()

  new cronJob( '0 30 17 * * 3,5', () =>
    robot.send {room:"general"}, "17:30 定時をお知らせします。\n今日は（いちおう）定時退社日ですポン〜。", null ,true ,"Asia/Tokyo"
  ).start()


  new cronJob( '0 1 0 * * 1-5', () =>
    robot.send {room:"general"}, "23:55 今日も１日お疲れでしポン。\nそろそろおやすみ.な..さ...(_ _)zZZ", null ,true ,"Asia/Tokyo"
  ).start()

  new cronJob( '0 57 23 * * *', () =>
    url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=140010"
    options =
      url: url
      timeout: 2000
    request options, (error, response, body) ->
      json = JSON.parse body
      day = 0
      title     = json['title']
      link      = json['link']
			text      = json['description']['text']
			weather   = json['forecasts'][day]
      forecast  = "<#{weather['date']}の#{title}>は「#{weather['telop']}」です。"
      robot.send {room:"test"}, forecast, null, true, "Asia/Tokyo" 
  ).start()
