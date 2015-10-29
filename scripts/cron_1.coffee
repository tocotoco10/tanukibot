cronJob = require('cron').CronJob

module.exports = (robot) ->
  send = (room, msg) ->
	  response = new robot.Response(robot, {user : {id : -1, name : room}
		response.send msg

  new cronJob('0 31 1 * * 1-5', ()  ->
	  send 'general', "cronテスト"
  ).start()


