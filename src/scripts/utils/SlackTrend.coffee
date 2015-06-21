
Trend = require './Trend.coffee'

class SlackTrend extends Trend
  console: ->
    console.log @conversation[9]

module.exports = SlackTrend