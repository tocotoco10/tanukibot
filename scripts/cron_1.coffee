cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob('0 17 1 * * 1-5',  =>
	    envelope = {room: 'general'}
			say      = 'cronテスト'
	    robot.send envelope, say, null, true
  )

