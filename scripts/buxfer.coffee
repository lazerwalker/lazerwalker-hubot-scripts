# Description:
#   Adds an expense to Buxfer
#
# Dependencies:
#   http
#
# Configuration:
#   BUXFER_USER: ENV variable set to your Buxfer username
#   BUXFER_PW: ENV variable set to your Buxfer password
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
    user = process.env.BUXFER_USER
    pw = process.env.BUXFER_PW

    if user? and pw?
      getAuthToken(msg, user, pw, postTransaction)
    else
      msg.send "Your Buxfer username and password have not been configured correctly"

getAuthToken = (msg, user, pw, callback) ->
  options =
      host: "www.buxfer.com"
      method: "POST"
      port: 443
      path: "/api/login.json?userid=#{user}&password=#{pw}"
      encoding: "ascii"

  req = https.request options, (res) ->
    res.setEncoding('ascii')
    res.on 'data', (d) ->
      response = JSON.parse(d)
      if (response?.response?.status == "OK")
        token = response.response.token
        callback?(msg, token)
      else
        msg.send "Authentication failure. Double-check your username and password are correct."
  req.end()

postTransaction = (msg, token) ->
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

    req = https.request options, (res) ->
      res.setEncoding('ascii')
      res.on 'data', (d) ->
        response = JSON.parse(d)
        if response?.response?.transactionAdded?
          msg.send "Transaction added."
        else
          msg.send "Transaction failure."
    req.end()
