import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import "../../styles"
import "../user_components"
import "../factory_components"

Item {
    objectName: "AlertPopup_01"
    x: 0
    y: 0
    width: 800
    height: 480

    property alias objectName: textField.objectName
    property alias text: textField.text
    property alias textColor: textField.color
    property alias bgGolor: textField.bgColor
    property alias borderColor: textField.borderColor
    property alias borderRadius: textField.borderRadius
    property alias borderWidth: textField.borderWidth
    property alias margins: textField.margins

    TextField {
        id: textField
        anchors.fill: parent
        anchors.centerIn: parent
        anchors.margins: margins
        horizontalAlignment : TextInput.AlignHCenter
        verticalAlignment: TextInput.AlignVCenter
        font: Qt.font({ family: 'Courier', pixelSize: 48, weight: Font.Bold, capitalization: Font.AllUppercase })
        color: "#ffffff"
        property color bgColor: "#E74C3C"
        property color borderColor: "#000000"
        property int borderRadius: 10
        property int borderWidth: 0
        property int margins: 4

        background: Rectangle {
			id: rect
            color: textField.bgColor
            border.color: textField.borderColor
            radius: textField.borderRadius
            border.width: textField.borderWidth
			Behavior on color {
					SequentialAnimation {
						loops: 20
						ColorAnimation { from: "#E74C3C"; to: "black"; duration: 500 }
						ColorAnimation { from: "black"; to: "#E74C3C";  duration: 500 }
					}       
			}
		}
    }
}


