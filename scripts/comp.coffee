#タスク完了通知に反応用

rtxt = [
  "おつかれちゃーん♪",
	"ポン菓子食べる？",
  "( ´・ω・)つ旦",
	"ホンマに終わったぬ？？？",
	"(｀･ω･´)ゞお勤めご苦労様たぬ！"
]

module.exports = (robot) ->
  robot.hear /(完了し|終わり|終了し|)(ました|たで|ましたわ|やで)/, (msg) ->
		  msg.send msg.random rtxt

