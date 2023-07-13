import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    x: 0
    y: 0
	z: 0
    width: 180
    height: 35

    objectName: "HaltechSwitchGauge"
	property alias objectName: imageValue.objectName
    property int dataMapAddress: 0
	property real  dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property color gaugeValueColor: "silver"
    property alias labelColor: textLabel.color
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
    property alias valueX: imageValue.x
    property alias valueY: imageValue.y
	property int labelFontSize: 14
	property int valueFontSize: 46
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: imageValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
	property int gaugeDecimal : 1
	property bool gaugeItalic : true
	property bool gaugeLabelItalic : true
	property string gaugeOnImage : ""
	property string gaugeOffImage : ""
	
	property real gaugeValueFactor: 1

    Image {
        id: imageValue
		source: (Math.round(dataMapValue) == 0 ) ? gaugeOffImage : gaugeOnImage
    }
	 Text {
        id: textLabel
        font: Qt.font({ family: 'Arial Black', pixelSize: labelFontSize, weight: Font.Normal, italic: gaugeLabelItalic, capitalization: Font.AllUppercase })
        color: "#00da75"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignLeft
		height: 10
		z:2
    }
}
