
React = require 'react'

Timer = React.createClass(
    getInitialState: ->
        {secondsElapsed: 0}

    tick: ->
        this.setState({secondsElapsed: this.state.secondsElapsed + 1})

    componentDidMount: ->
        this.interval = setInterval(this.tick, 1000)

    componentWillUnmount: ->
        clearInterval(this.interval)

    render: ->
        <div>Seconds Elapsed: {this.state.secondsElapsed}</div>
)

module.exports = Timer