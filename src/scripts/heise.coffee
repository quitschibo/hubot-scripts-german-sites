# Description:
#   Hubot script for getting the latest news from heise.de
#
# Dependencies:
#   "xml2js": "0.2.8"
#
# Configuration:
#   none
#
# Commands:
#   hubot heise - Getting the first five entries from heise.de news site
#
# Author:
#   quitschibo

Parser = require("xml2js").Parser

module.exports = (robot) ->
  robot.respond /heise/i, (msg) ->
    msg.http("https://www.heise.de/newsticker/heise.rdf")
      .get() (err, res, body) ->
        parser = new Parser
        parser.parseString body, (error, items) ->
          msg.send story.title + " -> " + story.link for story in items.rss.channel[0].item[0..5]
