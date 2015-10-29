cronJob = require('cron').CronJob

module.exports = (robot) ->
  new cronJob('0 59 0 * * 1-5', () =>
	    envelope = room:"general"
			say      = """
			```
			cronテスト
			```
			testcron
			"""
	    robot.send envelope, say, null, true
  )

