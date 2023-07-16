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
    anchors.horizontalCenter: parent.horizontalCenter
    //width: 180
    //height: 35

    property alias objectName: textField.objectName
    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property string dataMapLabel: ""
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 6
    property real gaugeRedStartValue : gaugeMaximumValue
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false
    property real gaugeValueFactor: 1
    property int gaugeTextSize: 110
    property int gaugeSwitch: 0

    Text {
        id: textField
        font.family: CustomFonts.rajdhani.name
        font.styleName: CustomFonts.rajdhaniRegular
        font.pixelSize: 170
        font.capitalization: Font.AllUppercase
        color: (dataMapValue.toFixed(0) < gaugeRedStartValue) ? "#ffffff" : "red"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: displayText
        readonly property string displayText: (dataMapValue.toFixed(0) == -8 ) ? "O" :(dataMapValue.toFixed(0) == -7 ) ? "L" :(dataMapValue.toFixed(0) == -6 ) ? "M" :(dataMapValue.toFixed(0) == -5 ) ? "S"  :(dataMapValue.toFixed(0) == -4 ) ? "D"
                                                        :(dataMapValue.toFixed(0) == -3 ) ? "U" :(dataMapValue.toFixed(0) == -2 ) ? "P" :(dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : dataMapValue.toFixed(0)
    }
}
