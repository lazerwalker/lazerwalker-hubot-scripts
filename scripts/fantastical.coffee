# Description:
#   Adds calendar events to Fantastical
#
# Dependencies:
#   AppleScript
#
# Configuration:
#   None
#
# Commands:
#   cal <string> - Tells Fantastical to create an event from parsing <string>
#
# Author:
#   lazerwalker

AppleScript = require('AppleScript')
module.exports = (robot) ->
  robot.respond /cal (.*) ?$/i, (msg) ->
    event = msg.match[1]

    string = "tell application \"Fantastical\"
    to parse sentence \"#{event}\"
    with add immediately"

    AppleScript.execString string, (err, rtn) ->
      if err
        msg.send "Fantastical error! #{err}"
      else
        msg.send "Added calendar event."

