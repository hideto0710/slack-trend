
React = require 'react'

materialUi = require 'material-ui'
ThemeManager =  new materialUi.Styles.ThemeManager();

injectTapEventPlugin = require "react-tap-event-plugin"
injectTapEventPlugin();

AppBar = materialUi.AppBar
Dialog = materialUi.Dialog

FileFolder = require './components/FileFolder.cjsx'
Timer = require './components/Timer.cjsx'
TrendArea = require './components/TrendArea.cjsx'

mountNode = document.getElementById 'app'

SlackTrendApp = React.createClass(
    displayName: 'SlackTrendApp'

    childContextTypes:
        muiTheme: React.PropTypes.object

    getChildContext: ->
        {muiTheme: ThemeManager.getCurrentTheme()}

    getInitialState: ->
        {conversation: []}

    handleStandardDialogTouchTap: (e) ->
        React.findDOMNode(this.refs.fileInput).click()

    handleDragOver: (e) ->
        # TODO:アクションを追加したい
        e.stopPropagation()
        e.preventDefault()
        e.dataTransfer.dropEffect = 'copy'

    handleFileSelect: (e) ->
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

    render: ->
        <div className="height100" onDragOver={this.handleDragOver} onDrop={this.handleFileSelect}>
            <AppBar title="SlackTrend" iconElementLeft={<FileFolder onTouchTap={this.handleStandardDialogTouchTap} />} />
            <input type="file" style={{display: 'none'}} ref="fileInput" onChange={this.handleFileSelect} />
            <Timer />
            <TrendArea conversation={this.state.conversation} />
        </div>


    _readFile: (file) ->
        self = this
        # TODO:対応形式を増やす
        if file.name.match 'log$'
            reader = new FileReader()
            reader.onload = (e) ->
                dataArray = e.target.result.split(/\r\n|\r|\n/)
                console.log JSON.parse dataArray[0]
                # 行毎にパース
                conversation =  for item in dataArray when item isnt ''
                    JSON.parse item if item isnt ''
                # FIXME:複数ファイルの場合の上書きを回避
                self.setState({conversation: conversation})
            reader.readAsText(file)
        else
            alert 'not text file.'
)

React.render(<SlackTrendApp />, mountNode)