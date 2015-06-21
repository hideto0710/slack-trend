
clipboard = electronRequire 'clipboard'

React = require 'react';
materialUi = require 'material-ui'

List = materialUi.List
ListItem = materialUi.ListItem
Avatar = materialUi.Avatar
Colors = materialUi.Styles.Colors

Documents = React.createClass(
    displayName: 'Documents'

    propTypes:
        data: React.PropTypes.array
        style: React.PropTypes.object

    render: ->
        style =
            overflow: 'auto'
        componentStyle = if this.props.style then React.addons.update style, {$merge: this.props.style} else style

        self = this
        itemNodes = this.props.data.map (item, i) ->
            initialChar = item.author.charAt(0)

            <ListItem key={i}
                onTouchTap={self._handlItemTouchTap}
                secondaryTextLines={2}
                leftAvatar={<Avatar>{initialChar}</Avatar>}
                secondaryText={
                    <p><span style={{color: Colors.darkBlack}}>{item.author}</span> {item.createdAt}<br />{item.text}</p>
                }>
            </ListItem>

        <List style={componentStyle}>
            {itemNodes}
        </List>


    _handlItemTouchTap: (e) ->
        touchId = e._dispatchIDs.match(/\$(\d+$)/)[1]
        clipboard.writeText this.props.data[touchId].url
)

module.exports = Documents