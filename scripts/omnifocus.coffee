# Description:
#   Adds a task to the OmniFocus inbox
#
# Dependencies:
#   AppleScript
#
# Configuration:
#   None
#
# Commands:
#   of Todo - Adds an inbox item in OmniFocus called 'Todo'
#
# Author:
#   lazerwalker

AppleScript = require('AppleScript')
module.exports = (robot) ->
  robot.respond /of (.*) ?$/i, (msg) ->
    todo = msg.match[1]
    
    string = "tell application \"OmniFocus\" to
    tell default document
    to parse tasks with transport text \"#{todo}\""

    AppleScript.execString string, (err, rtn) ->
      if err
        msg.send "OmniFocus error! #{err}"
      else
        msg.send "Added inbox item."

