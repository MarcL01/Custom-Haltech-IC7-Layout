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
//import DataMapAddressEnums 1.0
import "DataMapEnums.js" as DataMapAddress
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
	property bool dayTime: true
	property color dayGaugeBackgroundColor : "#fcfcfc"
	property color nightGaugeBackgroundColor : "#fcfcfc"	
    property color screenBrightColor : "#ffdd14"
    property color screenDarkColor   : "#7f6e0a"
	property int sweeperRotation: -90
	property int sweeperMaxRotation: -50
	property int sweeperMinRotation: -180
	property color mainColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor

    signal upKeyPressed()
    signal downKeyPressed()
	property real randVal1 : 0
    property int rpmLineHeight: 79
    property int rpmLineY: 0
	property int valueFontSize: 48
    property bool unusedVisible: false

    Keys.onSpacePressed:
    {
       randVal1 = Math.random();
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            topLevelItem.upKeyPressed();
            randVal1 = randVal1 * 1.1;
        } else if (event.key === Qt.Key_Down) {
            topLevelItem.downKeyPressed();
            randVal1 = randVal1 * 0.9;
        }
    }
	
	// RPM bar with repeater
	Item{
		id: screen_07_RPM
        x:20
        y:35
        z:1
		// Hidden to make the segments work...
        C8RpmGauge {
            id: screen_07_RPM_GAUGE
			x: 0
            y: 0
            /* Start Color Pallet */
            property color dayDarkColor : screenDarkColor
            property color nightDarkColor : screenDarkColor
            property color dayBrightColor : screenBrightColor
            property color nightBrightColor : screenBrightColor
            property color dayLabelColor : "white"
            property color nightLabelColor : "white"
            property color dayRedColor : "red"
            property color nightRedColor : "red"
            property color dayBackgroundColor : screenDarkColor
            property color nightBackgroundColor : screenDarkColor
            darkColor: (topLevelItem.dayTime) ? dayDarkColor : nightDarkColor
            brightColor: (topLevelItem.dayTime) ? dayBrightColor : nightBrightColor
            redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
            backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
        /* End Color Pallet */
            width: 820
            height: 35
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "RPM X1000"
            unitFontSize: 0
            gaugeValueFactor: 1
            gaugeMaximumValue: 10000
            gaugeMinimumValue: 0
            gaugeRedStartValue: 8500
            gaugePrecision: 5
            valueFontSize: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_07_RPM_GAUGE,"screen_07_RPM_GAUGE");
			}			
		}

	}
	// Gear Display
	Item {
		id: gearArea
        x: parent.width / 2
        y: 165
		opacity: 1.0
		z: 4
        C8GearIndicator{
            anchors.top: parent.top
            id: screen_07_gear
            x: 0
            y: 0
            width: 100
            dataMapAddress: DataMapAddress.GEAR
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "Gear"
            gaugeValueFactor: 1
            gaugeMinimumValue: -3
            gaugeMaximumValue: 6
            Component.onCompleted:
            {
                GaugeConfig.initGauge(screen_07_gear,"screen_07_gear");
            }

        }

        Rectangle {
            anchors.top: screen_07_gear.bottom
            anchors.topMargin: 65
            anchors.horizontalCenter: parent.horizontalCenter
            width: 120
            height: 2
            color: "white"
        }
	}
	Item {
		id: indicatorArea
		x: 372
		y: 300
		opacity: 1.0
		z: 4
        HaltechTellTaleLight {
					id: screen_07_18
					x: 0
                    y: 40
					dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/drag.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"

                    transform: Scale {
                        origin.x: screen_07_18.width / 2
                        origin.y: screen_07_18.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_19
					x: 55
                    y: 40
					dataMapAddress: DataMapAddress.NITROUS_STAGE_1_OUTPUT_STATE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/nos.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#11111111"
					gaugeX: "60"
					gaugeY: "60"

                    transform: Scale {
                        origin.x: screen_07_19.width / 2
                        origin.y: screen_07_19.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_20
					x: 0
                    y: 90
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/cel.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"

                    transform: Scale {
                        origin.x: screen_07_20.width / 2
                        origin.y: screen_07_20.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_21
					x: 60
                    y: 90
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/batt.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"

                    transform: Scale {
                        origin.x: screen_07_21.width / 2
                        origin.y: screen_07_21.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_22
					x: 5
					y: 125
					dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/oil.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"

                    transform: Scale {
                        origin.x: screen_07_22.width / 2
                        origin.y: screen_07_22.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_23
					x: 60
					y: 125
					dataMapAddress: DataMapAddress.TRACTION_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/trac.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"

                    transform: Scale {
                        origin.x: screen_07_23.width / 2
                        origin.y: screen_07_23.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
	}
	Item {
		id: floatingIndicators
		x: 0
        y: -15
		z: 10
		width: 860
		height: 80
		HaltechTellTaleLight {
					id: screen_07_24
					x: 20
					y: 0
					dataMapAddress: DataMapAddress.LEFT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/left.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"

                    transform: Scale {
                        origin.x: screen_07_24.width / 2
                        origin.y: screen_07_24.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_25
					x: 760
					y: 0
					dataMapAddress: DataMapAddress.RIGHT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/right.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"

                    transform: Scale {
                        origin.x: screen_07_25.width / 2
                        origin.y: screen_07_25.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_26
					x: 120
					y: 0
					dataMapAddress: DataMapAddress.HAND_BRAKE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/ebrake.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"

                    transform: Scale {
                        origin.x: screen_07_26.width / 2
                        origin.y: screen_07_26.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
		HaltechTellTaleLight {
					id: screen_07_27
					x: 660
					y: 0
					dataMapAddress: DataMapAddress.HIGH_BEAM
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/hibeam.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"

                    transform: Scale {
                        origin.x: screen_07_27.width / 2
                        origin.y: screen_07_27.height / 2
                        xScale: .5
                        yScale: .5
                    }
				}
	}
	
	Item {
		id: firstRowOne
		x: 0
		y: 85
		opacity: 1.0
        z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_02
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_02,"screen_07_02");
					}			
				}	
	}
	Item {
		id: firstRowTwo
        x: parent.width * .25
        y: 400
		opacity: 1.0
		z: 4
        C8BottomBarGauge {
            //anchors.top: parent.bottom
            id: screen_07_03
            x: 0
            y: 0
            /* Start Color Pallet */
            darkColor: "#7f6e0a"
            brightColor: "white"
            redColor: "red"
            backgroundColor: "#7f6e0a"
        /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "RPM X1000"
            unitFontSize: 0
            gaugeValueFactor: 1
            gaugeMaximumValue: 10000
            gaugeMinimumValue: 0
            gaugeRedStartValue: 8500
            gaugePrecision: 5
            valueFontSize: 25
            flipX: true
            Component.onCompleted:
            {
                GaugeConfig.initGauge(screen_07_03,"screen_07_03");
            }
        }
	}
	Item {
		id: firstRowThree
        x: parent.width * .75
        y: 400
		opacity: 1.0
        z: 4
        C8BottomBarGauge {
            //anchors.top: parent.bottom
            id: screen_07_04
            x: 0
            y: 0
            /* Start Color Pallet */
            darkColor: "#7f6e0a"
            brightColor: "white"
            redColor: "red"
            backgroundColor: "#7f6e0a"
        /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "RPM X1000"
            unitFontSize: 0
            gaugeValueFactor: 1
            gaugeMaximumValue: 10000
            gaugeMinimumValue: 0
            gaugeRedStartValue: 8500
            gaugePrecision: 5
            valueFontSize: 25
            Component.onCompleted:
            {
                GaugeConfig.initGauge(screen_07_04,"screen_07_04");
            }
        }
	}
	Item {
		id: firstRowFour
		x: 680
		y: 85
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_05
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_05,"screen_07_05");
					}			
				}	
	}
	Item {
		id: secondRowOne
		x: 0
		y: 185
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_06
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_06,"screen_07_06");
					}			
				}	
	}
	Item {
		id: secondRowTwo
        x: parent.width / 2
        y: 225
		opacity: 1.0
		z: 4
        C8SpeedGauge {
            //anchors.top: parent.bottom
            id: screen_07_07
            x: 0
            y: 0
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            gaugeUnit: ""
            gaugeValueFactor: 1
            unitFontSize: 22
            gaugeLabelItalic : false
            gaugeItalic : false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted:
            {
                GaugeConfig.initGauge(screen_07_07,"screen_07_07");
            }
        }
	}
	Item {
		id: secondRowThree
		x: 500
		y: 185
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_08
					x: 0
					y: 0
					width: 180
					height: 100			
                    /* Start Color Pallet */
                    property color dayValueColor : "black"
                    property color nightValueColor : "black"
                    property color dayUnitColor : "silver"
                    property color nightUnitColor : "silver"
                    property color dayLabelColor : "black"
                    property color nightLabelColor : "black"
                    property color dayValueRedColor : "red"
                    property color nightValueRedColor : "red"

                    gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
                    gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor
                    labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
                    unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_08,"screen_07_08");
					}			
				}	
	}
	Item {
		id: secondRowFour
        x: parent.width * .25 - 180
        y: 140
		opacity: 1.0
		z: 4
        C8SquareNumGauge {
            //anchors.top: parent.bottom
            id: screen_07_09
            x: 0
            y: 0
            /* Start Color Pallet */
            gaugeValueColor: "white"
            gaugeValueRedColor: "red"
            unitColor: "silver"
            /* End Color Pallet */
            dataMapAddress: DataMapAddress.RPM
            dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
            dataMapLabel: "RPM"
            alignment: TextInput.AlignLeft
            ualignment: TextInput.AlignRight
            unitX: -10
            unitY: 5
            gaugeUnit: ""
            gaugeValueFactor: 1
            valueX: 8
            valueY: 8
            labelFontSize: 22
            valueFontSize: 62
            unitFontSize: 22
            gaugeLabelItalic : false
            gaugeItalic : false
            gaugeMinimumValue: 0
            gaugeMaximumValue: 9999
            //gaugeDecimalPlaces: 0
            Component.onCompleted:
            {
                GaugeConfig.initGauge(screen_07_09,"screen_07_09");
            }
        }
	}
	Item {
		id: thirdRowOne
		x: 0
		y: 285
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_10
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_10,"screen_07_10");
					}			
				}	
	}
	Item {
		id: thirdRowTwo
		x: 180
		y: 285
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_11
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_11,"screen_07_11");
					}			
				}	
	}
	Item {
		id: thirdRowThree
		x: 500
		y: 285
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_12
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_12,"screen_07_12");
					}			
				}	
	}
	Item {
		id: thirdRowFour
		x: 680
		y: 285
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_13
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_13,"screen_07_13");
					}			
				}	
	}
	Item {
		id: fourthRowOne
		x: 0
		y: 385
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_14
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_14,"screen_07_14");
					}			
				}	
	}
	Item {
		id: fourthRowTwo
		x: 180
		y: 385
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_15
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_15,"screen_07_15");
					}			
				}	
	}
	Item {
		id: fourthRowThree
		x: 500
		y: 385
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_16
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_16,"screen_07_16");
					}			
				}	
	}
	Item {
		id: fourthRowFour
		x: 680
		y: 385
		opacity: 1.0
		z: 4
        visible: unusedVisible
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_17
					x: 0
					y: 0
					width: 180
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
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
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_17,"screen_07_17");
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
            id: bg
            height: 480
            width: 860
            smooth: true
            x: 0
            y: 0
			z: 2
            opacity: 1.0
            source: "../../images/C8Background.png"
        }
	}		
}
