module.exports = (robot) ->
  robot.respond /TIME$/i, (msg) ->
    places = ['jp', 'tokyo', 'kobe', 'kyoto', 'cc', 'akita', 'taiwan' ]
    place = places[Math.floor(Math.random() * places.length)]
    d = new Date
    hour = ('0' + d.getHours()).slice(-2)
    minute = ('0' + d.getMinutes()).slice(-2)
    img = "http://www.bijint.com/assets/pict/" + place + "/pc/" + hour + minute + ".jpg"
    msg.send img
    msg.finish()
