
moment = require 'moment'

React = require 'react'
materialUi = require 'material-ui'

LineChart = require './contents/LineChart.cjsx'
Documents = require './contents/Documents.cjsx'
SlackConversation = require '../conversation/SlackConversation.coffee'

Colors = materialUi.Styles.Colors

CATEGORY_FORMAT = 'MM/DD HH:mm'

Contents = React.createClass(
    displayName: 'Contents'

    propTypes:
        conversation: React.PropTypes.array
        conversationName: React.PropTypes.string
        style: React.PropTypes.object

    getInitialState: ->
        {documentData: [], interval: 3600 * 24}

    render: ->
        style =
            height: '100%'
            padding: 10
        componentStyle = if this.props.style then React.addons.update style, {$merge: this.props.style} else style

        documentsStyle =
            height: '50%'

        if this.props.conversation.length > 0
            conversation = new SlackConversation this.props.conversation, this.props.conversationName
            categories = conversation.getCategories(this.state.interval)
            seriesData = conversation.getTrendData(categories)
            xAxis =
                categories: categories
            series = [{data: seriesData}]
            borderStylr =
                display: 'block'
        else
            xAxis =
                categories: []
            series = []
            borderStylr =
                display: 'none'

        <div style={componentStyle}>
            <LineChart xAxis={xAxis} series={series} onClickPoint={this._handleClickPoint}/>
            <div className='borderBottom1' style={borderStylr}></div>
            <Documents style={documentsStyle} data={this.state.documentData} />
        </div>

    _handleClickPoint: (e) ->
        conversation = new SlackConversation this.props.conversation, this.props.conversationName
        categories = conversation.getCategories()
        from = moment(categories[e.x], CATEGORY_FORMAT)
        to = moment(categories[e.x], CATEGORY_FORMAT).add(this.state.interval, 'second')
        documentData = conversation.getDocumentsBetween(from, to)
        this.setState {documentData: documentData}
)

module.exports = Contents