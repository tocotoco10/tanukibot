# Description:
#   たぬきbot占い
#
# Commands:
#   tanukibot 今日の運勢
#
#


#random = (n) -> Math.floor(Math.random() * n)
#
#module.exports = (robot) ->
#  robot.respond /今日の運勢/i, (msg) ->
#	  fortunes = ["大吉","中吉","小吉","末吉","凶","大凶"]
#		result = fortunes[random(6)]
#		msg.send "今日の運勢は『#{result}』だポン。"

uranai = [
  "今日の運勢は『大吉』だポン。",
	"今日の運勢は『中吉』らしいぽん。",
	"今日の運勢は『小吉』だポン。",
	"今日の運勢は『末吉』ポン。",
	"今日の運勢は『凶』だポン。",
	"今日の運勢は『大凶』だポン。"
]

module.exports = (robot) ->
  robot.respond /今日の運勢/i, (msg) ->
	  msg.send msg.random uranai


