import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "Gauge_01_TickMarkLabel"
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
    property alias fontPixelSize: textField.font.pixelSize

    TextField {
        id: textField
        font: Qt.font({ family: 'Impact', pixelSize: 36, weight: Font.Normal, capitalization: Font.AllUppercase })
        color: "#ffffff"
        property color bgColor: "#000000"
        property color borderColor: "#4286f4"
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
