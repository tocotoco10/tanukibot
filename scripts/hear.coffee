module.exports = (robot) ->
  robot.hear /たぬき/, (msg) ->
	    msg.send msg.random [
			  "ポン？", 
				"ポコポコポーン♪",
				"タヌタヌタヌッキー！",
				"ぶんぶく茶釜！",
				"ちゃうよ！キツネだポン！",
				"赤いキツネ食べたい。",
				"緑のどん兵衛？"
		  ]
