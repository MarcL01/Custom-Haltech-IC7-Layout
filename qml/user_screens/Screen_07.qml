import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.4
import Qt3D.Core 2.0
import Qt3D.Render 2.0

import "../../styles"
import "../user_components"
import "../factory_components"
import "../custom_components"
import DataMapAddressEnums 1.0
//import "DataMapEnums.js" as DataMapAddress
import "GaugeConfig.js" as GaugeConfig

Item {
    transformOrigin: Item.Center

    //rotation: 180
    width: 860
    height: 480
    id: topLevelItem
    //anchors.fill: parent
    visible: true
    focus: true
    property bool dayTime: false
    property color dayGaugeBackgroundColor: "#ffffff"
    property color nightGaugeBackgroundColor: "#ffffff"
    property int sweeperRotation: -90
    property int sweeperMaxRotation: -50
    property int sweeperMinRotation: -180
    property color mainColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor

    property color screenBrightColor : "#ffffff"
    property color screenDarkColor   : "#7f6e0a"
    property color screenRedColor : "red"
    property color screenNeedleColor : "#b94a00"

    signal upKeyPressed
    signal downKeyPressed
    property real randVal1: 0
    property int rpmLineHeight: 79
    property int rpmLineY: 0
    property int valueFontSize: 48

    property bool showLeftOver: false

    Keys.onSpacePressed: {
        randVal1 = Math.random()
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            topLevelItem.upKeyPressed()
        } else if (event.key === Qt.Key_Down) {
            topLevelItem.downKeyPressed()
        }
    }

//    MouseArea{
//        id: mouseArea1
//        anchors.fill : parent
//        acceptedButtons: Qt.LeftButton | Qt.RightButton
//        z:10
//            onClicked: {
//                print("X:" + mouseArea1.mouseX + ";Y:" + mouseArea1.mouseY)
//        }
//         onDoubleClicked: {
//                print("X:" + mouseArea1.mouseX + ";Y:" + mouseArea1.mouseY)
//        }
//    }

    HaltechTellTaleLight {
        id: parkLights
        x: 0
        y: 0
        dataMapAddress: DataMapAddress.PARK_LIGHTS
        dataMapValue: Math.round(topLevelItem.randVal1)
        gaugeX: "1"
        gaugeY: "1"
    }

    Item {
        id: screen_07_RPM
        anchors.horizontalCenter: parent.horizontalCenter
        x: 0
        y: 0
        opacity: 1.0
        z: 4

        MarcRpmGauge {
            anchors.horizontalCenter: parent.horizontalCenter
            id: screen_07_RPM_GAUGE
            x: 0
            y: 0

            transform: Scale {
                xScale: 0.6
                yScale: 0.6
                origin.x: screen_07_RPM_GAUGE.width / 2
                origin.y: 25
            }

            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            gaugeUnit: ""
            gaugeValueFactor: 1
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_RPM_GAUGE, "screen_07_RPM_GAUGE")
            }
        }
    }

    // Gear Display
    Item {
        id: gearArea
        x: parent.width/2 - (screen_07_gear.width/2)
        y: 325
        opacity: 1.0
        z: 4
        GearIndicator {
            //anchors.top: parent.bottom
            id: screen_07_gear
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            gaugeValueFactor: 1
            gaugeMinimumValue: -10
            gaugeMaximumValue: 10
            gaugeTextSize: 60
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_gear, "screen_07_gear")
            }
        }
    }

    Item {
        id: indicatorArea
        x: parent.width/2 - (tellTales.width/2)
        y: 125
        opacity: 1.0
        z: 4

        Row {
            id: tellTales
            spacing: 10

            TellTaleLight {
                id: screen_07_18
                dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/drag.png"
                gaugeOnColor: "#FF0000"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "50"
                gaugeY: "50"
                gaugeScale: 0.8
            }
            TellTaleLight {
                id: screen_07_19
                dataMapAddress: DataMapAddress.NITROUS_STAGE_1_OUTPUT_STATE
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/nos.png"
                gaugeOnColor: "#0000FF"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "60"
                gaugeY: "60"
                gaugeScale: 0.8
            }
            TellTaleLight {
                id: screen_07_20
                dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/cel.png"
                gaugeOnColor: "#FF0000"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "50"
                gaugeY: "50"
                gaugeScale: 0.8
            }
            TellTaleLight {
                id: screen_07_21
                dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/batt.png"
                gaugeOnColor: "#FF0000"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "50"
                gaugeY: "50"
                gaugeScale: 0.8
            }
            TellTaleLight {
                id: screen_07_22
                dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/oil.png"
                gaugeOnColor: "#FF0000"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "50"
                gaugeY: "50"
                gaugeScale: 0.8
            }
            TellTaleLight {
                id: screen_07_23
                dataMapAddress: DataMapAddress.TRACTION_CONTROL_LIGHT
                dataMapValue: Math.round(topLevelItem.randVal1)
                gaugeImage: "../../images/trac.png"
                gaugeOnColor: "#FF0000"
                gaugeOffColor: "#8691a2"
                gaugeOffOpacity: 0.1
                gaugeX: "50"
                gaugeY: "50"
                gaugeScale: 0.8
            }
        }
    }
    Item {
        id: floatingIndicators
        x: 0
        y: 0
        z: 10
        width: 860
        height: 480
        anchors.top: parent.top
        anchors.left: parent.left
        Blinker {
            id: screen_07_24
            anchors.left: parent.left
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: -50
            sourceTop: "../../images/turn-left-top.png"
            sourceBottom: "../../images/turn-left-bottom.png"
            isLeftBlinker: true

            dataMapAddress: DataMapAddress.LEFT_INDICATOR
            dataMapValue: Math.round(topLevelItem.randVal1)
            gaugeOnColor: "#00FF00"
            gaugeOffColor: "#00000000"

            transform: Scale {
                xScale: 0.5
                yScale: 0.5
                origin.x: 5
                origin.y: 182
            }
        }

        Blinker {
            id: screen_07_25
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.top: parent.top
            anchors.topMargin: -50
            sourceTop: "../../images/turn-right-top.png"
            sourceBottom: "../../images/turn-right-bottom.png"
            isLeftBlinker: false

            dataMapAddress: DataMapAddress.RIGHT_INDICATOR
            dataMapValue: Math.round(topLevelItem.randVal1)
            gaugeOnColor: "#00FF00"
            gaugeOffColor: "#00000000"

            transform: Scale {
                xScale: 0.5
                yScale: 0.5
                origin.x: 281
                origin.y: 182
            }
        }

        HaltechTellTaleLight {
            id: screen_07_26
            x: 15
            y: 0
            dataMapAddress: DataMapAddress.HAND_BRAKE
            dataMapValue: Math.round(topLevelItem.randVal1)
            gaugeImage: "../../images/ebrake.png"
            gaugeOnColor: "#FF0000"
            gaugeOffColor: "#00000000"
            gaugeX: "80"
            gaugeY: "80"
        }
        HaltechTellTaleLight {
            id: screen_07_27
            x: 770
            y: 0
            dataMapAddress: DataMapAddress.HIGH_BEAM
            dataMapValue: Math.round(topLevelItem.randVal1)
            gaugeImage: "../../images/hibeam.png"
            gaugeOnColor: "#0000FF"
            gaugeOffColor: "#00000000"
            gaugeX: "80"
            gaugeY: "80"
        }
    }

    Item {
        id: firstRowOne
        anchors.horizontalCenter: parent.horizontalCenter
        x: 0
        y: 0
        opacity: 1.0
        z: 4
        visible: showLeftOver

        HaltechBigNumericGauge {
            anchors.horizontalCenter: parent.horizontalCenter
            id: screen_07_02
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            valignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelX: 10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_02, "screen_07_02")
            }
        }
    }
    Item {
        id: firstRowTwo
        x: ((parent.width * .33) - (screen_07_03.width / 2))
        y: 445
        opacity: 1.0
        z: 4
        ModernBarGauge {
            //anchors.top: parent.bottom
            id: screen_07_03
            x: 0
            y: 0
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            brightColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.COOLANT_TEMPERATURE
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "Coolant Temp"
            alignment: TextInput.AlignRight
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: -8
            valueY: 8
            labelFontSize: 22
            valueFontSize: 22
            unitFontSize: 22
            gaugeMinimumValue: 0
            gaugeMaximumValue: 500
            imageSource: "../../images/coolant-temperature.png"
            imageScale: 0.3
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_03, "screen_07_03")
            }
        }
    }
    Item {
        id: firstRowThree
        x: 500
        y: 85
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_04
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            valignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelX: 10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_04, "screen_07_04")
            }
        }
    }
    Item {
        id: firstRowFour
        x: 680
        y: 85
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_05
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            valignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelX: 10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_05, "screen_07_05")
            }
        }
    }
    Item {
        id: secondRowOne
        x: 0
        y: 185
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_06
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignRight
            valignment: TextInput.AlignRight
            ualignment: TextInput.AlignLeft
            unitX: 5
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: -8
            valueY: 8
            labelX: -10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 1
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_06, "screen_07_06")
            }
        }
    }
    Item {
        id: secondRowTwo
        x: parent.width/2 - (screen_07_07.width/2)
        y: 200
        opacity: 1.0
        z: 4

        SpeedGauge {
            anchors.top: parent.top
            id: screen_07_07
            x: 0
            y: 0
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            //width: 140
            //height: 200
            dataMapAddress: DataMapAddress.VEHICLE_SPEED
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "Speed"
            alignment: TextInput.AlignCenter
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueFontSize: 150
            unitFontSize: 18
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: -1
            gaugeMaximumValue: 6
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_07, "screen_07_07")
            }
        }
    }
    Item {
        id: secondRowThree
        x: (topLevelItem.width * .25) - (screen_07_08.width/2)
        y: 200
        opacity: 1.0
        z: 4
        BetterCircularGauge {
            //anchors.top: parent.bottom
            id: screen_07_08
            darkColor : screenDarkColor
            property real outerRadius : 150
            /* Start Color Pallet */
            property color dayGaugeFaceColor : screenBrightColor
            property color nightGaugeFaceColor : screenBrightColor
            property color dayGaugeRedColor : screenRedColor
            property color nightGaugeRedColor : screenRedColor
            property color dayGaugeNeedleColor : screenNeedleColor
            property color nightGaugeNeedleColor : screenNeedleColor
            property color dayMajorTickmarkColor : "black"
            property color nightMajorTickmarkColor : "black"
            property color dayMinorTickmarkColor : "black"
            property color nightMinorTickmarkColor : "black"
            property color dayTickmarkLabelColor : "white"
            property color nightTickmarkLabelColor : "white"
            property color dayTickmarkRedLabelColor : "white"
            property color nightTickmarkRedLabelColor : "white"
//            gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
            gaugeFaceColor : "#aabbcc00"
            backgroundColor: "#ffffff"
            gaugeCircleVisible: false
            gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
            gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
            gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
            gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
            gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
            gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
            gaugeDayTime : (topLevelItem.dayTime) ? true : false
            /* End Color Pallet */

            scale: 1.0
            property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
//            imageX: 0
//            imageY: 0
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapAddress: DataMapAddress.FUEL_PRESSURE
            dataMapLabel: "FUEL PRESS"
            labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
            labelX: -40
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
            gaugeRedThickness: 0.075
           /*Start:screen_07_08*/
           gaugeMaximumValue: 16
           gaugeMinimumValue: 9
           gaugeRedStartValue: 15.5
           gaugeLowerRedStartValue: 9.5
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_07_08*/
            gaugeRedEndValue: (gaugeMaximumValue < gaugeMinimumValue ? gaugeMinimumValue : gaugeMaximumValue ) * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -60
            gaugeStyleMaximumValueAngle: 60
            gaugeStyleTickmarkLabel: null
            gaugeUnit: "x1000r/min"
            gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
            /*
            gaugeStyleNeedleSource:  Image {
                    //anchors.centerIn: parent
                    x: parent.width/2 - 10
                    y: parent.height/2 - 100
                    z: 6
                    antialiasing: true
                    smooth: true
                    source: "../../images/HeroScreenNeedle.png"
            }  */
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
            gaugeMinorTickmarkCount: 3
            gaugeMinorTickmarkInsetRatio : 0.00
            gaugeTickmarkInsetRatio : 0.03
            gaugeFontRatio: 0.25
            gaugeLabelFontRatio:  0.13 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_08, "screen_07_08")
            }
        }
    }
    Item {
        id: secondRowFour
        x: (topLevelItem.width * .75) - (screen_07_09.width / 2)
        y: 200
        opacity: 1.0
        z: 4
        BetterCircularGauge {
            //anchors.top: parent.bottom
            id: screen_07_09
            darkColor : screenDarkColor
            property real outerRadius : 150
            /* Start Color Pallet */
            property color dayGaugeFaceColor : screenBrightColor
            property color nightGaugeFaceColor : screenBrightColor
            property color dayGaugeRedColor : screenRedColor
            property color nightGaugeRedColor : screenRedColor
            property color dayGaugeNeedleColor : screenNeedleColor
            property color nightGaugeNeedleColor : screenNeedleColor
            property color dayMajorTickmarkColor : "black"
            property color nightMajorTickmarkColor : "black"
            property color dayMinorTickmarkColor : "black"
            property color nightMinorTickmarkColor : "black"
            property color dayTickmarkLabelColor : "white"
            property color nightTickmarkLabelColor : "white"
            property color dayTickmarkRedLabelColor : "white"
            property color nightTickmarkRedLabelColor : "white"
//            gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
            gaugeFaceColor : "#aabbcc00"
            backgroundColor: "#ffffff"
            gaugeCircleVisible: false
            gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
            gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
            gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
            gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
            gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
            gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
            gaugeDayTime : (topLevelItem.dayTime) ? true : false
            /* End Color Pallet */

            scale: 1.0
            property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
            dataMapAddress: DataMapAddress.OIL_PRESSURE
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "OIL PRESS"
            labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
            labelX: -40
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
            gaugeRedThickness: 0.075
           /*Start:screen_07_08*/
           gaugeMaximumValue: 16
           gaugeMinimumValue: 9
           gaugeRedStartValue: 15.5
           gaugeLowerRedStartValue: 9.5
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_07_08*/
            gaugeRedEndValue: (gaugeMaximumValue < gaugeMinimumValue ? gaugeMinimumValue : gaugeMaximumValue ) * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -60
            gaugeStyleMaximumValueAngle: 60
            gaugeStyleTickmarkLabel: null
            gaugeUnit: "x1000r/min"
            gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
            /*
            gaugeStyleNeedleSource:  Image {
                    //anchors.centerIn: parent
                    x: parent.width/2 - 10
                    y: parent.height/2 - 100
                    z: 6
                    antialiasing: true
                    smooth: true
                    source: "../../images/HeroScreenNeedle.png"
            }  */
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
            gaugeMinorTickmarkCount: 3
            gaugeMinorTickmarkInsetRatio : 0.00
            gaugeTickmarkInsetRatio : 0.03
            gaugeFontRatio: 0.25
            gaugeLabelFontRatio:  0.13 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_09, "screen_07_09")
            }
        }
    }
    Item {
        id: thirdRowOne
        x: 0
        y: 285
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_10
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignRight
            valignment: TextInput.AlignRight
            ualignment: TextInput.AlignLeft
            unitX: 5
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: -8
            valueY: 8
            labelX: -10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_10, "screen_07_10")
            }
        }
    }
    Item {
        id: thirdRowTwo
        x: 180
        y: 285
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_11
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignRight
            valignment: TextInput.AlignRight
            ualignment: TextInput.AlignLeft
            unitX: 5
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: -8
            valueY: 8
            labelX: -10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_11, "screen_07_11")
            }
        }
    }
    Item {
        id: thirdRowThree
        x: 500
        y: 285
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_12
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            valignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelX: 10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_12, "screen_07_12")
            }
        }
    }
    Item {
        id: thirdRowFour
        x: (topLevelItem.width * .75) - (screen_07_13.width / 2)
        y: 200
        opacity: 1.0
        z: 4
        BetterCircularGauge {
            //anchors.top: parent.bottom
            id: screen_07_13
            darkColor : screenDarkColor
            property real outerRadius : 150
            /* Start Color Pallet */
            property color dayGaugeFaceColor : screenBrightColor
            property color nightGaugeFaceColor : screenBrightColor
            property color dayGaugeRedColor : screenRedColor
            property color nightGaugeRedColor : screenRedColor
            property color dayGaugeNeedleColor : screenNeedleColor
            property color nightGaugeNeedleColor : screenNeedleColor
            property color dayMajorTickmarkColor : "black"
            property color nightMajorTickmarkColor : "black"
            property color dayMinorTickmarkColor : "black"
            property color nightMinorTickmarkColor : "black"
            property color dayTickmarkLabelColor : "white"
            property color nightTickmarkLabelColor : "white"
            property color dayTickmarkRedLabelColor : "white"
            property color nightTickmarkRedLabelColor : "white"
//            gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
            gaugeFaceColor : "#aabbcc00"
            backgroundColor: "#00000000"
            gaugeCircleVisible: false
            upsideDown: true
            gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
            gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
            gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
            gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
            gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
            gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
            gaugeDayTime : (topLevelItem.dayTime) ? true : false
            /* End Color Pallet */

            scale: 1.0
            property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
//            imageX: 0
//            imageY: 0
            dataMapAddress: DataMapAddress.OIL_TEMPERATURE
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "OIL TEMP"
            labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
            labelX: 30
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
            gaugeRedThickness: 0.075
           /*Start:screen_07_08*/
           gaugeMaximumValue: 16
           gaugeMinimumValue: 9
           gaugeRedStartValue: 15.5
           gaugeLowerRedStartValue: 9.5
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_07_08*/
            gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -60
            gaugeStyleMaximumValueAngle: 60
            gaugeStyleTickmarkLabel: null
            gaugeUnit: "x1000r/min"
            gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
            /*
            gaugeStyleNeedleSource:  Image {
                    //anchors.centerIn: parent
                    x: parent.width/2 - 10
                    y: parent.height/2 - 100
                    z: 6
                    antialiasing: true
                    smooth: true
                    source: "../../images/HeroScreenNeedle.png"
            }  */
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
            gaugeMinorTickmarkCount: 3
            gaugeMinorTickmarkInsetRatio : 0.00
            gaugeTickmarkInsetRatio : 0.03
            gaugeFontRatio: 0.25
            gaugeLabelFontRatio:  0.13 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_13, "screen_07_13")
            }
        }
    }
    Item {
        id: fourthRowOne
        x: 0
        y: 385
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_14
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignRight
            valignment: TextInput.AlignRight
            ualignment: TextInput.AlignLeft
            unitX: 5
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: -8
            valueY: 8
            labelX: -10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_14, "screen_07_14")
            }
        }
    }
    Item {
        id: fourthRowTwo
        x: (topLevelItem.width * .25) - (screen_07_15.width/2)
        y: 200
        opacity: 1.0
        z: 5
        BetterCircularGauge {
            //anchors.top: parent.bottom
            id: screen_07_15
            darkColor : screenDarkColor
            property real outerRadius : 150
            /* Start Color Pallet */
            property color dayGaugeFaceColor : screenBrightColor
            property color nightGaugeFaceColor : screenBrightColor
            property color dayGaugeRedColor : screenRedColor
            property color nightGaugeRedColor : screenRedColor
            property color dayGaugeNeedleColor : screenNeedleColor
            property color nightGaugeNeedleColor : screenNeedleColor
            property color dayMajorTickmarkColor : "black"
            property color nightMajorTickmarkColor : "black"
            property color dayMinorTickmarkColor : "black"
            property color nightMinorTickmarkColor : "black"
            property color dayTickmarkLabelColor : "white"
            property color nightTickmarkLabelColor : "white"
            property color dayTickmarkRedLabelColor : "white"
            property color nightTickmarkRedLabelColor : "white"
//            gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
            gaugeFaceColor : "#aabbcc00"
            backgroundColor: "#00000000"
            gaugeCircleVisible: false
            upsideDown: true
            gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
            gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
            gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
            gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
            gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
            gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
            gaugeDayTime : (topLevelItem.dayTime) ? true : false
            /* End Color Pallet */

            scale: 1.0
            property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
//            imageX: 0
//            imageY: 0
//            imageOpacity: 1.0
//            imageSource: "../../images/retro_gaugebg.png"
            dataMapAddress: DataMapAddress.FUEL_TEMPERATURE
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "FUEL TEMP"
            labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
            labelX: 30
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
            gaugeRedThickness: 0.075
           /*Start:screen_07_08*/
           gaugeMaximumValue: 16
           gaugeMinimumValue: 9
           gaugeRedStartValue: 15.5
           gaugeLowerRedStartValue: 9.5
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_07_08*/
            gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -60
            gaugeStyleMaximumValueAngle: 60
            gaugeStyleTickmarkLabel: null
            gaugeUnit: "x1000r/min"
            gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
            /*
            gaugeStyleNeedleSource:  Image {
                    //anchors.centerIn: parent
                    x: parent.width/2 - 10
                    y: parent.height/2 - 100
                    z: 6
                    antialiasing: true
                    smooth: true
                    source: "../../images/HeroScreenNeedle.png"
            }  */
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
            gaugeMinorTickmarkCount: 3
            gaugeMinorTickmarkInsetRatio : 0.00
            gaugeTickmarkInsetRatio : 0.03
            gaugeFontRatio: 0.25
            gaugeLabelFontRatio:  0.13 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_15, "screen_07_15")
            }
        }
    }
    Item {
        id: fourthRowThree
        x: ((parent.width * (1-.33)) - (screen_07_03.width / 2))
        y: 445
        opacity: 1.0
        z: 4
        ModernBarGauge {
            //anchors.top: parent.bottom
            id: screen_07_16
            x: 0
            y: 0
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

//            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
//            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
//            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            brightColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            flipX: true
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.FUEL_LEVEL
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "Fuel Level"
            alignment: TextInput.AlignLeft
//            valignment: TextInput.AlignLeft
//            ualignment: TextInput.AlignRight
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
//            labelX: 10
//            labelY: 72
            labelFontSize: 22
            valueFontSize: 22
            unitFontSize: 22
//            gaugeLabelItalic: false
//            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 100
            //gaugeDecimalPlaces: 0
            imageSource: "../../images/gas-pump.png"
            imageScale: 0.25
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_16, "screen_07_16")
            }
        }
    }
    Item {
        id: fourthRowFour
        x: 680
        y: 385
        opacity: 1.0
        z: 4
        visible: showLeftOver
        HaltechBigNumericGauge {
            //anchors.top: parent.bottom
            id: screen_07_17
            x: 0
            y: 0
            width: 180
            height: 100
            /* Start Color Pallet */
            property color dayValueColor: "black"
            property color nightValueColor: "black"
            property color dayUnitColor: "silver"
            property color nightUnitColor: "silver"
            property color dayLabelColor: "black"
            property color nightLabelColor: "black"
            property color dayValueRedColor: "red"
            property color nightValueRedColor: "red"

            gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
            gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
            labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
            unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue)
                           * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            valignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelX: 10
            labelY: 72
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic: false
            gaugeItalic: false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted: {
                GaugeConfig.initGauge(screen_07_17, "screen_07_17")
            }
        }
    }

    //Background Box
    Rectangle {
        color: mainColor
        id: topLevelRectangle
        x: 0
        y: 0
        z: 0
        width: 860
        height: 480
        Image {
            id: bg2
            width: 860
            height: 480
            smooth: true
            x: 0
            y: 0
            z: 1
            opacity: 1
            source: "../../images/screen-7-bg.png"
        }
    }
}
