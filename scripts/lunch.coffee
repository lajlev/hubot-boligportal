# Description:
#   A simple command that fetch todays menu from frokost.dk via RSS
#   Remember to change url to your frokost.dk ID, else you will see what BoligPortal.dk is having for lunch :)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lunch
#
# Notes:
#   None
#
# Author:
#   @lajlev & @rkjaer

parser = require 'parse-rss'

url    = "http://e.frokost.dk/Menuplan/RssMenu.aspx?l=aN57ULa4f_"

module.exports = (robot) ->
  robot.respond /lunch|todays lunch|lunch today|lunch menu/i, (msg) ->
    parser url, (err,rss)->
      msg.send err if err
      msg.send rss[0].description
                .replace(/<\/?b>/g, "")
                .replace(/<br\/>/g, "\n")
                .replace(/&#230;/g, "æ")
                .replace(/&#198;/g, "Æ")
                .replace(/&#248;/g, "ø")
                .replace(/&#216;/g, "Ø")
                .replace(/&#229;/g, "å")
                .replace(/&#197;/g, "Å")
                .replace(/&amp;/g, "&")
                .replace(/&#233/g, "é")
                .trim()
