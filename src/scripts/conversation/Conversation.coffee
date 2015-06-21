
moment = require 'moment'
_ = require 'lodash'

CATEGORY_FORMAT = 'MM/DD HH:mm'
DOCUMENT_FORMAT = 'YYYY/MM/DD HH:mm:ss'

class Conversation
  # Array
  constructor: (@conversation, @name) ->

  getDocuments: ->
    self = this
    for doc, i in @conversation
      {
        author: self.getAuthor i
        text: self.getText i
        createdAt: self.getCreatedAt(i).format DOCUMENT_FORMAT
        url: self.getUrl i
      }

  getDocumentsBetween: (from, to) ->
    self = this
    docs = for doc, i in @conversation
      createdAt = self.getCreatedAt(i)
      if createdAt.isBetween(from, to)
        {
          author: self.getAuthor i
          text: self.getText i
          createdAt: self.getCreatedAt(i).format DOCUMENT_FORMAT
          url: self.getUrl i
        }
    _.compact(docs).sort((a, b) ->
         if moment(a.createdAt, DOCUMENT_FORMAT) < moment(b.createdAt, DOCUMENT_FORMAT) then -1 else 1
    )

  getCategories: (interval = 3600) ->
    self = this
    timeStampArray = for item, i in @conversation
      self.getCreatedAt(i).valueOf()

    minTime = moment _.min(timeStampArray)
    maxTime = moment _.max(timeStampArray)

    categoriesArray = []
    categoryMoment = moment(minTime.startOf('hour'))
    loop
      categoriesArray.push categoryMoment.format(CATEGORY_FORMAT)
      categoryMoment.add(interval, 'second')
      break if maxTime.isBefore categoryMoment

    categoriesArray

  getTrendData: (categories) ->
    self = this
    trendHash = {}
    trendHash[category] = 0 for category in categories
    for doc, i in @conversation
      trendHash[self.getCreatedAt(i).startOf('hour').format(CATEGORY_FORMAT)] += 1
    for category, count of trendHash
      count

module.exports = Conversation