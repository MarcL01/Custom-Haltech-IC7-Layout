import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "HaltechGearGauge"
    x: 0
    y: 0
    //width: 180
    //height: 35

	property alias objectName: textField.objectName
    property int dataMapAddress: 0
	property real  dataMapValue: 0
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 6
	property real gaugeRedStartValue : gaugeMaximumValue
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false		
	property alias imageSource: bigButton.source	
	property real gaugeValueFactor: 1
	property int gaugeTextSize: 90
	property int gaugeSwitch: 0

     Image {
        id: bigButton
        height: 200
        width: 200
        smooth: true
        x: 0
        y: 0
        opacity: 1.0
        source: "../../images/Option_07_big_button.png"
        Text {
			id: textField
			x: (bigButton.width + 20 -gaugeTextSize)/ 2
			font: Qt.font({ family: 'Arial Black', pixelSize: gaugeTextSize, weight: Font.Normal, italic: true, capitalization: Font.AllUppercase })
			color: (dataMapValue.toFixed(0) < gaugeRedStartValue) ? "#ffffff" : "red"
			property color bgColor: "#00000000"
			property color borderColor: "#4286f4"
			property int borderRadius: 0
			property int borderWidth: 0
			width: parent.width
			anchors.horizontalCenter: TextInput.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter		
			text: displayText
			readonly property string displayText: (dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : dataMapValue.toFixed(0)
        }
    }
}
