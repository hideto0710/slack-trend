
React = require 'react'

materialUi = require 'material-ui'
ThemeManager = require('material-ui/lib/styles/theme-manager')()
injectTapEventPlugin = require "react-tap-event-plugin"
injectTapEventPlugin();

AppBar = materialUi.AppBar

Timer = require './components/Timer.cjsx'

mountNode = document.getElementById 'app'

TodoList = React.createClass(
    displayName: 'TodoList'

    render: ->
        itemNodes = this.props.items.map (itemText, i) ->
            <li key={i}>{itemText}</li>

        <ul>{itemNodes}</ul>
)

TodoApp = React.createClass(
    displayName: 'TodoApp'

    childContextTypes:
        muiTheme: React.PropTypes.object

    getChildContext: ->
        { muiTheme: ThemeManager.getCurrentTheme() }

    getInitialState: ->
        { items: [], text: '' }

    showLeftBar: (e) ->
        console.log e

    onChange: (e) ->
        this.setState({ text: e.target.value })

    handleSubmit: (e) ->
        e.preventDefault()
        nextItems = this.state.items.concat([this.state.text])
        nextText = ''
        this.setState({ items: nextItems, text: nextText })

    render: ->
        (
            <div>
                <AppBar title='Slack Trend' onLeftIconButtonTouchTap={this.showLeftBar} />
                <h3>TODO</h3>
                <TodoList items={this.state.items} />
                <form onSubmit={this.handleSubmit}>
                    <input onChange={this.onChange} value={this.state.text} />
                    <button>{'Add #' + (this.state.items.length + 1)}</button>
                </form>
                <Timer />
            </div>
        )
)

React.render(<TodoApp />, mountNode);