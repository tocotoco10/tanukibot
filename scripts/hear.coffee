module.exports = (robot) ->
  robot.hear /たぬき/, (msg) ->
	    msg.send msg.random ["ポン？", "ポコポコポーン♪", "タヌタヌタヌッキー！", "緑のどん兵衛？"]