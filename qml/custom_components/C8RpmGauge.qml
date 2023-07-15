import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    id: c8BarRoot
    x: 0
    y: 0
    objectName: "HaltechBarGauge"
    property alias objectName: gauge.objectName
    property int dataMapAddress: 0
    property real dataMapValue: 0
    property string dataMapLabel: ""
    property int gaugeX: 0
    property int gaugeY: 0
    property int gaugeHeight : 100
    property int gaugeWidth : 10
    property int labelFontSize: 30
    property int valueFontSize: 30
    property int unitFontSize: valueFontSize
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 7000
    property real gaugeRedStartValue: 6000
    property bool enableRedStart: false
    property real gaugeValueFactor: 1
    property int gaugePrecision : 3
    property int gaugeDecimalPlaces : 0
    property string gaugeSelectedUnit : ""
    property color brightColor : "#ffdd14"
    property color darkColor : "#776800"
    property color backgroundColor : "white"
    property color redColor : "red"

    function getColorByIndex(index) {
        if (index === 0) {
            return Qt.rgba(255, 255, 255, .25)
        } else if (index === 1) {
            return "#ffe609"
        } else if (index === 2) {
            return "#ff960c"
        } else {
            return "#fc4a1b"
        }
    }

    property int numOf500Rpms: (gaugeMaximumValue - gaugeMinimumValue) / 500
    property real widthPer500Rpm: (gauge.width / numOf500Rpms)-2.2
    property real numToRedZone: gaugeRedStartValue / 500
    property real numToOrangeZone: numToRedZone - 1
    property real numToYellowZone: numToRedZone - 2

    function getLengthByIndex(index) {
        if (index === 0) {
            if (!enableRedStart || (gaugeRedStartValue > gaugeMaximumValue && gaugeRedStartValue < gaugeMinimumValue)) {
                return gauge.width
            }

            const numToYellow = numToRedZone - 2
            return widthPer500Rpm * numToYellow
        } else if (index === 1 || index === 2) {
            return widthPer500Rpm
        } else if (index === 3) {
            return (numOf500Rpms - numToRedZone) * widthPer500Rpm
        }
    }

    FontLoader {
        id: rajdhaniFont
        source: "../../styles/Rajdhani-SemiBold.ttf"
    }

    Gauge {
        x: 0
        y: 0
        width: c8BarRoot.width
        height: c8BarRoot.height
        id: gauge
        //anchors.fill: parent
        minimumValue: gaugeMinimumValue.toPrecision(gaugePrecision)
        maximumValue: gaugeMaximumValue.toPrecision(gaugePrecision)
        orientation: Qt.Horizontal
        property real redStartValue : gaugeRedStartValue.toPrecision(gaugePrecision)
        tickmarkStepSize: 1000
        minorTickmarkCount: 1
        value : (dataMapValue / gaugeValueFactor)
        style: GaugeStyle {
            foreground: null
            valueBar: Item {
                id: valueBarItem
                implicitWidth: gauge.height

                Rectangle {
                    id: valueBarRecBg
                    width: valueBarItem.width
                    height: valueBarItem.height

                    gradient: Gradient {
                        GradientStop { position: 0.0; color: Qt.rgba(255, 255, 255, 1) }
//                        GradientStop { position: 0.33; color: "yellow" }
                        GradientStop { position: 1.0; color: Qt.rgba(255, 255, 255, .1) }
                    }
                }

                Rectangle {
                    id: valueBarTip
                    anchors.left: valueBarRecBg.right
                    anchors.top: valueBarRecBg.top
                    anchors.leftMargin: -35
//                    x: -35
                    width: valueBarItem.width + 5
                    height: 3
                    color: "white"
                }

                Glow {
                        opacity: 0.5
                        anchors.fill: valueBarTip
                        radius: 7
                        samples: 20
                        spread: 0.5
                        color: "white"
                        source: valueBarTip
                        visible: true
                        transparentBorder: true
                    }
            }

            background:                 Column {
                id: backgroundColumn
                spacing: 0

                Repeater {
                    model: !enableRedStart || (gaugeRedStartValue > gaugeMaximumValue && gaugeRedStartValue < gaugeMinimumValue) ? 1 : 4


                    Rectangle {
                        width: c8BarRoot.height
                        height: getLengthByIndex(index)
                        color: getColorByIndex(index)
                    }
                }

                transform: Scale {
                    origin.x: backgroundColumn.width / 2
                    origin.y: backgroundColumn.height / 2
                    yScale: -1
                }
            }

            minorTickmark : Rectangle {
                x: c8BarRoot.height * -1
                width: c8BarRoot.height
                height: 1
                color: "black"

                opacity: enableRedStart && styleData.value >= gaugeRedStartValue - 1000 ? 0 : styleData.value <= dataMapValue ? 0 : .3
            }
            tickmark: Item {
                implicitWidth: 12
                implicitHeight: 2

                Rectangle {
//                        x: 7
                    x: c8BarRoot.height * -1
                    width: c8BarRoot.height
                    height: 2
                    color: "black"
                    opacity: styleData.value > dataMapValue || dataMapValue - styleData.value >= 2000 ? .5 :
                                dataMapValue - styleData.value < 1000 ? 0 :
                                    (dataMapValue - styleData.value - 1000) / 2000
                }

                Rectangle {
                    x: 0
                    width: 4
                    height: 2
                    color: (styleData.value < gauge.redStartValue) ? "white" : redColor
                }
            }
            tickmarkLabel: Text {
                x: -2
                font.family: rajdhaniFont.name
                font.pixelSize: 20
                font.bold : true
                font.italic: true
                text:  (styleData.value / 1000).toFixed(0)
                color: (styleData.value < gauge.redStartValue) ? "white" : redColor
                antialiasing: true
            }

        }
    }
}
