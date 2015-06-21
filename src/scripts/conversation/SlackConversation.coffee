
moment = require 'moment'
_ = require 'lodash'

Conversation = require './Conversation.coffee'

class SlackConversation extends Conversation

  getAuthor: (id) ->
    @conversation[id].user.name

  getText: (id) ->
    @conversation[id].text

  getCreatedAt: (id) ->
    moment.unix(parseFloat @conversation[id].ts)

  getUrl: (id) ->
    "https://hottolink.slack.com/archives/#{@name}/p#{@conversation[id].ts.replace '.', ''}"

  getDocuments: ->
    super()

module.exports = SlackConversation