import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "TextFieldScreen01Data"
    x: 0
    y: 0
    width: 180
    height: 35

    property alias objectName: textField.objectName
    property alias text: textField.text
    property int textSize: 64
    property int dataMapAddress: 0
    property int dataMapValue: 0
    property alias textColor: textField.color
    property alias bgGolor: textField.bgColor
    property alias borderColor: textField.borderColor
    property alias borderRadius: textField.borderRadius
    property alias borderWidth: textField.borderWidth
    property alias alignment: textField.horizontalAlignment

    Text {
        id: textField
        font: Qt.font({ family: 'Lato Bold', pixelSize: textSize, weight: Font.Bold, italic: false, capitalization: Font.AllUppercase })
        color: "#ffc935"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignRight
		text: displayText
		readonly property real displayText: { if(dataMapValue <100) "0"+Math.round(dataMapValue); else Math.round(dataMapValue) }		
    }
}
