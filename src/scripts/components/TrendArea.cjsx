
React = require 'react';

SlackTrend = require '../utils/SlackTrend.coffee'

TrendArea = React.createClass(
    propTypes:
        conversation: React.PropTypes.array
        style: React.PropTypes.object

    render: ->
        style =
            maxHeight: 400
            overflow: 'auto'
        componentStyle = if this.props.style then React.addons.update style, {$merge: this.props.style} else style

        itemNodes = this.props.conversation.map (item, i) ->
            <li key={i}>{item.text}</li>

        trend = new SlackTrend this.props.conversation
        trend.console()

        <div style={componentStyle}>
            <ul>{itemNodes}</ul>
        </div>
)

module.exports = TrendArea