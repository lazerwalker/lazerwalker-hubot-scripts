# Description:
#   Adds calendar events to Google Calendar
#
# Dependencies:
#   googleapi
#
# Configuration:
#   GOOGLE_CLIENT_ID: Client ID for your Google API app
#   GOOGLE_CLIENT_SECRET: Client secret for your Google API app
#   GOOGLE_REDIRECT_URI: Redirect URL for your Google API app
#   GOOGLE_ACCESS_TOKEN: Access token for your Google user account
#   GOOGLE_REFRESH_TOKEN: Refresh token for your Google user account
#
#   To get these:
#     1. Register for an app at https://code.google.com/apis/console/
#     2. Generate a client ID for web applications.
#     3. That will give your client ID, secret, and redirect URL.
#     4. In your web browser, go to
#        https://accounts.google.com/o/oauth2/auth?access_type=offline&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar&response_type=code&client_id={CLIENT_ID}&redirect_uri={REDIRECT_URI}
#        and follow the login flow
#     5. When complete, it will hit your redirect URL with a ?code={CODE} query param.
#     6. Send a POST request with the following settings:
#        POST https://accounts.google.com/o/oauth2/token HTTP/1.1
#        Content-Type: application/x-www-form-urlencoded
#        Body:
#            code={CODE}&
#            client_id={CLIENT_ID}&
#            client_secret={CLIENT_SECRET}&
#            redirect_uri={REDIRECT_URI}&
#            grant_type=authorization_code
#     7. The JSON response returned will include your access and refresh tokens
#
# Commands:
#   cal <string> - Tells Google Calendar to create an event from parsing <string>
#
# Author:
#   lazerwalker

module.exports = (robot) ->
  robot.respond /cal (.*) ?$/i, (msg) ->
    handleError = (err, complete=false) ->
      if err
        msg.send "Google Calendar error! #{err}"
      else if complete
        msg.send "Added calendar event."

    event = msg.match[1]
    details =
      calendarId:"primary"
      text: event

    googleapis = require('googleapis')

    clientID = process.env.GOOGLE_CLIENT_ID
    secret = process.env.GOOGLE_CLIENT_SECRET
    redirectURI = process.env.GOOGLE_REDIRECT_URI
    oauth2Client = new googleapis.OAuth2Client(clientID, secret, redirectURI)
    oauth2Client.credentials =
      access_token: process.env.GOOGLE_ACCESS_TOKEN
      refresh_token: process.env.GOOGLE_REFRESH_TOKEN

    googleapis.discover('calendar', 'v3')
      .execute (err, client) ->
        handleError(err)

        client.calendar.events.quickAdd(details)
          .withAuthClient(oauth2Client)
          .execute (err, client) ->
            handleError(err, true)