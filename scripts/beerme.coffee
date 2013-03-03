# Description:
#   Given a beer, returns a link to its BeerAdvocate profile
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   beer <BEER> - Returns a URL that resolves to the BA page for the given  beer
#
# Author:
#   lazerwalker

AppleScript = require('AppleScript')
module.exports = (robot) ->
  robot.respond /beer (.*) ?$/i, (msg) ->
    beerName = encodeURIComponent(msg.match[1])
    msg.send "http://www.google.com/search?btnI=I2+Feeling+Lucky&q=site:beeradvocate.com+#{beerName}"