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
  "『大吉』だポン。",
	"『中吉』らしいぽん。",
	"『小吉』だポン。",
	"『末吉』ポン。",
	"『凶』だポン。",
	"『大凶』だポン。"
]

module.exports = (robot) ->
  robot.respond /(今日|きょう)の運勢/i, (msg) ->
    msg.send "#{msg.message.user.name}ちゃんの運勢は \n"
    msg.send msg.random uranai

#    text =
#		"今日の#{msg.message.user.name}ちゃんの運勢は \n"+
#    "123 \n"+
#		"だポン。"
#
#   msg.send text


