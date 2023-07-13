import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    x: 0
    y: 0
    objectName: "ModernBarGauge"
    property alias objectName: background.objectName
    property int dataMapAddress: 0
    property real dataMapValue: 0
    property string dataMapLabel: ""
    property string gaugeUnit
    property alias valueColor: textValue.color
    property alias valueAlignment: textValue.horizontalAlignment
    property int gaugeX: 0
    property int gaugeY: 0
    property int gaugeHeight : 80
    property int gaugeWidth : 30
    property alias valueX: textValue.x
    property alias valueY: textValue.y
    property int labelFontSize: 20
    property int valueFontSize: 70
    property int unitFontSize: 20
    property alias valueBgColor: textValue.bgColor
    property alias alignment: textValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : 0
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 5
    property bool enableLowerRedStart : true
    property string imageSource : ""
    property int imageX : 0
    property int imageY : 0
    property real imageScale : 1
    property real gaugeValueFactor: 1
    property int gaugeDecimalPlaces : 0
    property color brightColor : "#ffdd14"
    property color darkColor : "#776800"
    property color backgroundColor : "white"
    property color redColor : "red"
    property bool flipX : false

    states: [
        State {
            name: "default"
            when: !flipX
            AnchorChanges {
                target: gaugeIcon
                anchors.right: gaugeBar.left
            }
            AnchorChanges {
                target: textValue
                anchors.left: gaugeBar.right
                anchors.right: undefined
            }
        },
        State {
            name: "flipX"
            when: flipX
            AnchorChanges {
                target: gaugeIcon
                anchors.left: gaugeBar.right
            }
            AnchorChanges {
                target: textValue
                anchors.left: undefined
                anchors.right: gaugeBar.left
            }
        }
    ]

    Component.onCompleted: function() {

    }

    function getWidthDecimal() {
        var result = (((((dataMapValue / gaugeValueFactor) - gaugeMinimumValue) * 100) / (gaugeMaximumValue - gaugeMinimumValue))/100)
        return result;
    }


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

    FontLoader {
        id: dinFont
        source: "../../styles/DINCondensed-Bold.ttf"
    }
    Rectangle {
        id : background

//        color : backgroundColor
        color : "transparent"

        Item {
            id: gaugeBar
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            width: gaugeBarBg.width
            height: gaugeBarBg.height

            Row {
                id: gaugeBarBg
                spacing: 4
                Repeater {
                    model: 4
                    Rectangle {
                        width: 30
                        height: 8
                        radius: 5
                        color: "#8691a2"
                    }
                }
            }

            Item {
                id: gaugeOverlay
                anchors.fill: gaugeBarBg
                visible: false

                Rectangle {
                    id: leftOverlay
                    anchors.top: parent.top
                    anchors.left: parent.left
                    height: gaugeBarBg.height
                    width: gaugeBarBg.width * getWidthDecimal()
                    color: "#00ea8d"
                }

                Rectangle {
                    id: rightOverlay
                    anchors.top: parent.top
                    anchors.left: leftOverlay.right
                    height: gaugeBarBg.height
                    width: gaugeBar.width - (gaugeBarBg.width * getWidthDecimal())
                    color: "transparent"
                }
            }

            OpacityMask {
                anchors.fill: gaugeBarBg
                source: gaugeOverlay
                maskSource: gaugeBarBg
                invert: false
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
            font.family: dinFont.name
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

//        Row {
//            id: gaugeView
//            spacing: 5
//            anchors.verticalCenter: parent.verticalCenter
//            layoutDirection: flipX ? Qt.RightToLeft : Qt.LeftToRight






//        }
    }



//    Rectangle {
//        id: gaugeView
//        x: gaugeX - 12
//        y: gaugeY
//        width: gaugeWidth
//        height: gaugeHeight
//        color: "transparent"

//        Gauge {
//            id: gauge
//            anchors.fill: parent
//            anchors.margins: 0
//            minimumValue: 0
//            maximumValue: 100
//            orientation: Qt.Vertical
//            property real redStartValue : ((gaugeRedStartValue - gaugeMinimumValue) * 100) / (gaugeMaximumValue - gaugeMinimumValue)
//            tickmarkStepSize: 10
//            value : (((dataMapValue / gaugeValueFactor) - gaugeMinimumValue) * 100) / (gaugeMaximumValue - gaugeMinimumValue)

//            style: GaugeStyle {
//                valueBar: Rectangle {
//                   x : -1
//                    implicitWidth: gaugeWidth
//                    color:  gaugeWarningColor()
//                }
//                minorTickmark : null
//                tickmarkLabel: null
//                foreground: null

//                tickmark: Item {
//                    implicitWidth: 8
//                    implicitHeight: 2

//                    Rectangle {
//                        x: 7
//                        width: gaugeWidth
//                        height: parent.height
//                        color: darkColor
//                    }
//                }
//            }
//        }


//    }





}
