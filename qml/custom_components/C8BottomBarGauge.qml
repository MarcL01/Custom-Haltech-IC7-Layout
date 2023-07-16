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
    property int gaugeHeight : 4
    property int gaugeWidth : 200
    property int labelFontSize: 30
    property int valueFontSize: 60
    property int unitFontSize: valueFontSize
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 200
    property real gaugeRedStartValue: 120
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 5
    property bool enableLowerRedStart : true
    property real gaugeValueFactor: 1
    property int gaugePrecision : 3
    property int gaugeDecimalPlaces : 0
    property color brightColor : "#ffdd14"
    property color darkColor : "#776800"
    property color backgroundColor : "white"
    property color redColor : "red"
    property string imageSource : ""
    property string gaugeUnit
    property real gaugeStyleTickmarkStepSize: 10.0

    function gaugeWarningColor() {
        var str = "";
        if((enableRedStart && dataMapValue > gaugeRedStartValue* gaugeValueFactor ) ||
        (enableLowerRedStart && dataMapValue < gaugeLowerRedStartValue* gaugeValueFactor ) )
        {
          str = redColor;
        }
        else
        {
          str = brightColor;
        }
        return str;
    }

    function getColorByIndex(index) {
        if (index === 0) {
            return Qt.rgba(255, 255, 255, .25)
        } else if (index === 1) {
            return "red"
        }
    }

    property int numOfSteps: (gaugeMaximumValue - gaugeMinimumValue) / gaugeStyleTickmarkStepSize

    property real numToRedZone: gaugeRedStartValue / gaugeStyleTickmarkStepSize

    function getLengthByIndex(parentComp, index) {
        var widthPerStep = (parentComp.height / numOfSteps)
        if (index === 0) {
            if (!enableRedStart || (gaugeRedStartValue > gaugeMaximumValue && gaugeRedStartValue < gaugeMinimumValue)) {
                return parentComp.height
            }

            return widthPerStep * numToRedZone
        } else if (index === 1) {
            return (numOfSteps - numToRedZone) * widthPerStep
        }
    }

    property bool flipX : false

    states: [
        State {
            name: "default"
            when: !flipX
            AnchorChanges {
                target: gaugeIcon
                anchors.right: gauge.left
            }
            AnchorChanges {
                target: textValue
                anchors.left: gauge.right
                anchors.right: undefined
            }
        },
        State {
            name: "flipX"
            when: flipX
            AnchorChanges {
                target: gaugeIcon
                anchors.left: gauge.right
            }
            AnchorChanges {
                target: textValue
                anchors.left: undefined
                anchors.right: gauge.left
            }
        }
    ]

    Gauge {
        anchors.horizontalCenter: parent.horizontalCenter
        width: gaugeWidth
        height: gaugeHeight
        id: gauge
        //anchors.fill: parent
        minimumValue: gaugeMinimumValue.toPrecision(gaugePrecision)
        maximumValue: gaugeMaximumValue.toPrecision(gaugePrecision)
        orientation: Qt.Horizontal
        property real redStartValue : gaugeRedStartValue.toPrecision(gaugePrecision)
        property real lowerRedStartValue : gaugeLowerRedStartValue.toPrecision((gaugePrecision))
        tickmarkStepSize: gaugeMaximumValue / 4
        minorTickmarkCount: 0
        value : (dataMapValue / gaugeValueFactor)
        style: GaugeStyle {
            foreground: null
            valueBar: Item {
                id: valueBarItem
                implicitWidth: gauge.height

                Rectangle {
                    id: valueBarRecBg
                    width: valueBarItem.width + 3
                    x: -1.5
                    height: valueBarItem.height
                    color: "white"
                    opacity: .8
                }

                Rectangle {
                    id: valueBarTip
                    anchors.horizontalCenter: valueBarRecBg.horizontalCenter
//                    anchors.left: valueBarRecBg.right
                    anchors.top: valueBarRecBg.top
//                    x: -35
                    width: valueBarItem.width + 9
                    height: 2
                    color: "red"
                }

                Glow {
                        opacity: 0.5
                        anchors.fill: valueBarTip
                        radius: 7
                        samples: 20
                        spread: 0.5
                        color: "red"
                        source: valueBarTip
                        visible: true
                        transparentBorder: true
                    }
            }

            background: Column {
                id: backgroundColumn
                spacing: 0

                Repeater {
                    model: !enableRedStart || (gaugeRedStartValue > gaugeMaximumValue && gaugeRedStartValue < gaugeMinimumValue) ? 1 : 2


                    Rectangle {
                        width: gaugeHeight
                        height: getLengthByIndex(backgroundColumn, index)
                        color: getColorByIndex(index)
                    }
                }

                transform: Scale {
                    origin.x: backgroundColumn.width / 2
                    origin.y: backgroundColumn.height / 2
                    yScale: -1
                }
            }

            minorTickmark : null
            tickmark: Item {
                implicitWidth: 12
                implicitHeight: 2

                Rectangle {
                    id: tickmarkInnerRect
//                        x: 7
                    x: gaugeHeight * -1
                    width: gaugeHeight
                    height: 2
                    color: "black"
                    opacity: styleData.value > dataMapValue || dataMapValue - styleData.value >= 2000 ? .5 :
                                dataMapValue - styleData.value < 1000 ? 0 :
                                    (dataMapValue - styleData.value - 1000) / 2000
                }

                Rectangle {
                    x: (gaugeHeight * -1) - 6
                    width: 4
                    height: 2
                    color: (styleData.value >= gauge.redStartValue && enableRedStart) ? redColor :
                            (styleData.value <= gauge.lowerRedStartValue && enableLowerRedStart) ? redColor : "white"
                }
            }
            tickmarkLabel: null

        }
    }

    Item {
            id: gaugeIcon
            anchors.verticalCenter: parent.verticalCenter
            height: gaugeIconImg.height
            width: gaugeIconImg.width

//            transform: Scale {
//                xScale: imageScale
//                yScale: imageScale
//                origin.x: gaugeIcon.width / 2
//                origin.y: gaugeIcon.height / 2
//            }

            Image {
                id: gaugeIconImg
                smooth: true
                opacity: 1.0
                source: imageSource
                width: 30
                height: 30
            }

            Rectangle {
                id: gaugeIconOverlay
                width: gaugeIconImg.width
                height: gaugeIconImg.width
                color: "#ffffff"
                visible: false
            }
            OpacityMask {
                anchors.fill: gaugeIconOverlay
                source: gaugeIconOverlay
                maskSource: gaugeIconImg
                invert: false
            }
        }

        Text {
            id: textValue
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 3
            anchors.rightMargin: flipX ? 4 : 0
            anchors.leftMargin : flipX ? 0 : 4
            font.weight : Font.Medium
            font.family: CustomFonts.rajdhani.name
            font.styleName: CustomFonts.rajdhaniSemiBold
            font.pixelSize: valueFontSize
            color: gaugeWarningColor()
            property color bgColor: "#00000000"
            property color borderColor: "#4286f4"
            property int borderRadius: 0
            property int borderWidth: 0
            horizontalAlignment: TextInput.AlignLeft
            verticalAlignment: TextInput.AlignVCenter
    //        text: displayText
    //        readonly property string displayText: ((dataMapAddress == 1 ) ? ((gauge.maximumValue < 50) ? dataMapValue * 1000 : dataMapValue ).toFixed(0) : dataMapValue.toFixed(gaugeDecimalPlaces))
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 2
                horizontalOffset: 2
                color: "#F0000000"
                radius: 5
                samples: 8
                }
            text: dataMapValue.toFixed(0) + " " + gaugeUnit
        }
}
