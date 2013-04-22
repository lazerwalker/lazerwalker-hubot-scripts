# Description:
#   Adds a task to the OmniFocus inbox
#
# Dependencies:
#   Nodemailer
#
# Configuration:
#   (currently assumes you're using Gmail)
#   HUBOT_GMAIL_USERNAME: Gmail username
#   HUBOT_GMAIL_PASSWORD: Gmail password
#   OMNI_MAIL_DROP_ADDRESS: Private OmniSyncServer address (see http://www.omnigroup.com/support/omnifocus-mail-drop)
#
# Commands:
#   of Todo - Adds an inbox item in OmniFocus with text 'Todo'
#
# Author:
#   lazerwalker

module.exports = (robot) ->
  robot.respond /of (.*) ?$/i, (msg) ->
    todo = msg.match[1]

    mail = require('nodemailer').createTransport "SMTP",
      service: "Gmail"
      auth:
        user: process.env.HUBOT_GMAIL_USERNAME
        pass: process.env.HUBOT_GMAIL_PASSWORD

    from = process.env.HUBOT_EMAIL_SENDER
    to = process.env.OMNI_MAIL_DROP_ADDRESS

    options = {from, to, subject: todo}
    mail.sendMail options, (err, response) ->
      if err
        msg.send "OmniFocus error! #{err}"
      else
        msg.send "Added inbox item."

