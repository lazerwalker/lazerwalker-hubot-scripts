# Description:
#   Adds a task to Remember The Milk
#
# Dependencies
#   Cafe Au Lait (http://github.com/lazerwalker/CafeAuLait)
#
# Configuration:
#   RTM_API_SECRET: Your RTM API Secret
#   RTM_API_KEY: Your RTM API Key
#   RTM_AUTH_TOKEN: Your user RTM token (run 'misc/rtm_token.coffee' to generate)
#
# Commands:
#   r Todo - Adds an item in Remember The Milk with text 'Todo' (using Smart Add)
#
# Author:
#   lazerwalker

module.exports = (robot) ->
  robot.respond /r (.*) ?$/i, (msg) ->
    todo = msg.match[1]

    RememberTheMilk = require('cafe-au-lait')
    rtm = new RememberTheMilk(process.env.RTM_API_KEY, process.env.RTM_API_SECRET, process.env.RTM_AUTH_TOKEN)

    rtm.get 'rtm.timelines.create', (response) ->
      timeline = response.timeline

      params =
        timeline: timeline
        name: todo
        parse: 1

      rtm.get 'rtm.tasks.add', params, (response) ->
        if response.stat is 'ok'
          msg.send "Added inbox item"
        else if response.err?
          msg.send "Error! #{response.err.msg} (Code #{response.err.code})"
        else
          msg.send "Error!"