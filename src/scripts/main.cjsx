
React = require 'react'

materialUi = require 'material-ui'
ThemeManager =  new materialUi.Styles.ThemeManager();

injectTapEventPlugin = require "react-tap-event-plugin"
injectTapEventPlugin();

AppBar = materialUi.AppBar
Dialog = materialUi.Dialog

Contents = require './components/Contents.cjsx'
FileFolder = require './components/FileFolder.cjsx'

mountNode = document.getElementById 'app'

SlackTrendApp = React.createClass(
    displayName: 'SlackTrendApp'

    childContextTypes:
        muiTheme: React.PropTypes.object

    getChildContext: ->
        {muiTheme: ThemeManager.getCurrentTheme()}

    getInitialState: ->
        {conversation: [], conversationName: ''}

    render: ->
        <div className="height100" onDragOver={this._handleDragOver} onDrop={this._handleFileSelect}>
            <AppBar title="SlackTrend" iconElementLeft={<FileFolder onTouchTap={this._handleFileLoadTouchTap} />} />
            <input type="file" style={{display: 'none'}} ref="fileInput" onChange={this._handleFileSelect} />
            <Contents conversation={this.state.conversation} conversationName={this.state.conversationName} />
        </div>

    _handleFileLoadTouchTap: (e) ->
        React.findDOMNode(this.refs.fileInput).click()

    _handleDragOver: (e) ->
        # TODO:アクションを追加したい
        e.stopPropagation()
        e.preventDefault()
        e.dataTransfer.dropEffect = 'copy'

    _handleFileSelect: (e) ->
        e.stopPropagation()
        e.preventDefault()
        # D&DもしくはFile読み込みで分岐
        if e.dataTransfer
            files = e.dataTransfer.files
        else if e.target
            files = e.target.files
        else
            alert 'error'
        # Fileオブジェクトを読み込み
        this._readFile file for i, file of files when file instanceof File

    _readFile: (file) ->
        self = this
        # TODO:対応形式を増やす
        if file.name.match 'log$'
            reader = new FileReader()
            reader.onload = (e) ->
                dataArray = e.target.result.split(/\r\n|\r|\n/)
                # 行毎にパース
                conversation =  for item in dataArray when item isnt ''
                    JSON.parse item if item isnt ''
                # FIXME:複数ファイルの場合の上書きを回避
                self.setState({conversation: conversation, conversationName: file.name.replace '.log', ''})
            reader.readAsText(file)
        else
            alert 'not text file.'
)

React.render(<SlackTrendApp />, mountNode)