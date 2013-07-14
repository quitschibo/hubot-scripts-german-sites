# Description:
#   Hubot script for getting the latest news from golem.de
#
# Dependencies:
#   xml2js
#
# Configuration:
#   none
#
# Commands:
#   hubot golem - Getting the first five entries from golem.de news site
#
# Author:
#   quitschibo

Parser = require("xml2js").Parser

module.exports = (robot) ->
  robot.respond /golem/i, (msg) ->
    msg.http("http://golem.de.dynamic.feedsportal.com/pf/578068/http://rss.golem.de/rss.php?feed=RSS2.0")
      .get() (err, res, body) ->
        parser = new Parser
        parser.parseString body, (error, items) ->
          msg.send story.title[0] + " -> " + story.link[0] for story in items.rss.channel[0].item[0..5]