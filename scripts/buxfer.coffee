# Description:
#   Adds an expense to Buxfer
#
# Dependencies:
#   http
#
# Configuration:
#   BUXFER_AUTH_TOKEN: ENV variable set to a valid Buxfer session token
#   See: https://www.buxfer.com/help/API
#
# Commands:
#   $<X> <Name>: <TAGS> - Adds an $X-dollar transaction with the given name and
#   (comma-separated) tags
#
# Author:
#   lazerwalker

https = require 'https'

module.exports = (robot) ->
  robot.respond /\$([0-9]*\.?[0-9]*) ([^\:]*)[\:]? ?(.*)$/i, (msg) ->
    token = process.env.BUXFER_AUTH_TOKEN
    unless token?
      msg.send "Buxfer auth token not found"
      return

    amount = msg.match[1]
    description = msg.match[2]
    tags = msg.match[3]

    text = encodeURIComponent("#{description} #{amount} tags:#{tags}")
    options =
      host: "www.buxfer.com"
      method: "POST"
      port: 443
      path: "/api/add_transaction.json?token=#{token}&format=sms&text=#{text}"
      encoding: "ascii"

    console.log options.path
    req = https.request options, (res) ->
      res.setEncoding('ascii')

      res.on 'data', (d) ->
        response = JSON.parse(d)
        if response?.response?.transactionAdded?
          msg.send "Transaction added."
        else
          msg.send "Failure"
    req.end()