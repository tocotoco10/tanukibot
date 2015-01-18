rtxt1 = [
  "ポン？",
  "ポコポコポーン♪",
  "タヌタヌタヌッキー！",
  "ぶんぶくちゃがま！",
  "ちゃうよ！キツネだポン！",
  "赤いキツネ食べたい。",
  "緑のどん兵衛？"
]

module.exports = (robot) ->
  robot.hear /(たぬき|タヌキ|そば|うどん)/, (msg) ->
    msg.send msg.random rtxt1

