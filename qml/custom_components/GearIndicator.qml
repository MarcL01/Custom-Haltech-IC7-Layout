import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Rectangle {
    objectName: "HaltechGearGauge"
    anchors.horizontalCenter: parent.horizontalCenter

    color: "#cccccc"

    property alias objectName: textField.objectName
    property int dataMapAddress: 0
    property real dataMapValue: 0
    property real gaugeMinimumValue: -10
    property real gaugeMaximumValue: 10
    property real gaugeRedStartValue : gaugeMaximumValue
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false
    property real gaugeValueFactor: 1
    property int gaugeTextSize: 90
    property int gaugeSwitch: 0

    Text {
        id: textField
        anchors.horizontalCenter: parent.horizontalCenter
        font: Qt.font({ family: 'Arial Black', pixelSize: gaugeTextSize, weight: Font.Normal, italic: true, capitalization: Font.AllUppercase })
        color: (dataMapValue.toFixed(0) < gaugeRedStartValue) ? "#ffffff" : "red"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        height: 200
        width: 200
//        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: TextInput.AlignHCenter
        text: displayText
        readonly property string displayText: (dataMapValue.toFixed(0) == -8 ) ? "O" :(dataMapValue.toFixed(0) == -7 ) ? "L" :(dataMapValue.toFixed(0) == -6 ) ? "M" :(dataMapValue.toFixed(0) == -5 ) ? "S"  :(dataMapValue.toFixed(0) == -4 ) ? "D"
                                                :(dataMapValue.toFixed(0) == -3 ) ? "U" :(dataMapValue.toFixed(0) == -2 ) ? "P" :(dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : "M" + dataMapValue.toFixed(0)
    }
}
