Parser = require("xml2js").Parser

module.exports = (robot) ->
  robot.respond /heise/i, (msg) ->
    msg.http("http://heise.de.feedsportal.com/c/35207/f/653902/index.rss")
      .get() (err, res, body) ->
        parser = new Parser
        parser.parseString body, (error, items) ->
          msg.send story.title + " -> " + story.link for story in items.rss.channel[0].item[0..5]
