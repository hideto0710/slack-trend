
React = require 'react'

LineChart = React.createClass(
    getInitialState: ->
        data: [{name: "series1", values: [{x: 0, y: 20}, {x: 24, y: 10}]}]

    render: ->
        <div></div>
)

module.exports = LineChart