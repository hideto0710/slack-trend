
React = require 'react'
materialUi = require 'material-ui'

Colors = materialUi.Styles.Colors

IconButton = materialUi.IconButton
Avatar = materialUi.Avatar
SvgIcon = materialUi.SvgIcon

ActionAssignment = require './svg-icons/ActionAssignment.cjsx'

FileFolder = React.createClass(
    displayName: 'FileFolder'

    propTypes:
        onTouchTap: React.PropTypes.func

    render: ->
        iconStyle =
            margin: -8

        <IconButton style={{zIndex: 10}} onTouchTap={this.props.onTouchTap} tooltip="Load File">
            <Avatar icon={<ActionAssignment />} backgroundColor={Colors.blue500} style={iconStyle} />
        </IconButton>
)

module.exports = FileFolder