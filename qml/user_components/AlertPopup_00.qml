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
    objectName: "AlertPopup_00"
    x: 0
    y: 400
    width: 800
    height: 80

    property alias objectName: textField.objectName
    property alias text: textField.text
    property alias textColor: textField.color
    property alias bgGolor: textField.bgColor
    property alias borderColor: textField.borderColor
    property alias borderRadius: textField.borderRadius
    property alias borderWidth: textField.borderWidth
    property alias margins: textField.margins

	Rectangle{
		id: selectionRect
		height: 70
		width: 140
		x: 100
		y: 400
		z: 10
		color: "transparent"
		border.color: "aqua"
		border.width: 3
		visible: true
	}	
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
            color: textField.bgColor
            border.color: textField.borderColor
            radius: textField.borderRadius
            border.width: 3
        }
    }
}


