import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "TextFieldScreen01Normal"
    x: 0
    y: 0
    width: 200
    height: 16

    property alias objectName: textField.objectName
    property alias text: textField.text
    property alias textColor: textField.color
    property alias bgGolor: textField.bgColor
    property alias borderColor: textField.borderColor
    property alias borderRadius: textField.borderRadius
    property alias borderWidth: textField.borderWidth

    TextField {
        id: textField
        font: Qt.font({ family: 'Courier', pixelSize: 20, weight: Font.Normal, capitalization: Font.AllUppercase })
        color: "#ffffff"
        property color bgColor: "#00000000"
        property color borderColor: "#ffc935"
        property int borderRadius: 0
        property int borderWidth: 0

        background: Rectangle {
            color: textField.bgColor
            border.color: textField.borderColor
            radius: textField.borderRadius
            border.width: textField.borderWidth
        }
    }
}
