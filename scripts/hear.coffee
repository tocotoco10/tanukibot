module.exports = (robot) ->
  robot.hear /たぬき/, (msg) ->
	    msg.send msg.random ["ポン？","ポコポコポーン♪","タヌタヌタヌッキー！","ぶんぶくちゃがま！","ちゃうよ！キツネだポン！","赤いキツネ食べたい。","緑のどん兵衛？"]
