import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"
//import DataMapAddressEnums 1.0

Item {
    x: 0
    y: 0
    z: 0
    width: 50
    height: 50

    objectName: "HaltechTellTaleLight"
    property alias objectName: imageValue.objectName
    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property alias labelColor: textLabel.color
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
    property alias valueX: imageValue.x
    property alias valueY: imageValue.y
    property int labelFontSize: 14
    property int valueFontSize: 46
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: imageValue.horizontalAlignment
    //property color gaugeValueColor: "silver"
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false
    property int gaugeDecimal : 1
    property bool gaugeItalic : true
    property bool gaugeLabelItalic : true
    property string gaugeImage : ""
    property string gaugeX : "50"
    property string gaugeY : "50"
    property real gaugeScale: 1
    property string gaugeOnColor : ""
    property string gaugeOffColor : "#cccccc"
    property real gaugeOffOpacity : 1
    property real gaugeValueFactor: 1

    opacity: dataMapValue == 0 ? gaugeOffOpacity : 1

    Image {
        id: imageValue
        width: gaugeX
        height: gaugeY
        source: gaugeImage
        visible: false

        transform: Scale {
            xScale: gaugeScale
            yScale: gaugeScale
            origin.x: imageValue.implicitWidth / 2
            origin.y: imageValue.implicitHeight / 2
        }
    }
    Glow {
        opacity: 0.5
        anchors.fill: imageValue
        radius: 15
        samples: 20
        spread: 0.4
        color: gaugeOnColor
        source: imageValue
        visible: dataMapValue == 0 ? false : true
        transparentBorder: true
    }

    Rectangle {
        id: overlayThing
        width: gaugeX
        height: gaugeY
        color: dataMapValue == 0 ? gaugeOffColor : gaugeOnColor
        visible: false
        }
    OpacityMask {
            anchors.fill: overlayThing
            source: overlayThing
            maskSource: imageValue
            invert: false
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
