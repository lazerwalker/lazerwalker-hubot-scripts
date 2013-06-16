RememberTheMilk = require('cafe-au-lait')
stdin = process.stdin

rtm = new RememberTheMilk(process.env.RTM_API_KEY, process.env.RTM_API_SECRET)
rtm.getAuthUrl (url) ->
  console.log "Before continuing, you need to authenticate with Remember The Milk.\
\nGo to the following URL, allow access to the application, and then press \
any key in this terminal window:\n\n#{url}"

  stdin.resume()

  stdin.on 'data', ->
    rtm.getAuthToken (token) ->
      console.log "Store this token and use it as the 'RTM_AUTH_TOKEN' environment variable:"
      console.log "'#{token}'"
