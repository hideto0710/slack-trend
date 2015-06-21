
React = require 'react'
Highcharts = require 'react-highcharts'

LineChart = React.createClass(
    displayName: 'LineChart'

    propTypes:
        onClickPoint: React.PropTypes.func
        xAxis: React.PropTypes.object
        series: React.PropTypes.array
        style: React.PropTypes.object

    getInitialState: ->
        config:
            title:
                text: null
            credits:
                enabled: false
            chart:
                height: 230
            legend:
                enabled: false
            yAxis:
                title:
                    text: null
                min: 0
            plotOptions:
                series:
                    point:
                        events: {}
            tooltip:
                pointFormat: 'Slack: <b>{point.y}</b>件'
        xAxis:
            tickInterval: 20


    render: ->
        self = this
        config =
            xAxis: React.addons.update this.state.xAxis, {$merge: this.props.xAxis}
            series: this.props.series

        componentConfig = React.addons.update this.state.config, {$merge: config}
        componentConfig.plotOptions.series.point.events.click = ->
            self.props.onClickPoint this

        <Highcharts config={componentConfig} />
)

module.exports = LineChart