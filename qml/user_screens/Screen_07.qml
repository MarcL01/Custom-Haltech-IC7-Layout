import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt3D.Core 2.0
import Qt3D.Render 2.0

import "../../styles"
import "../user_components"
import "../factory_components"
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
	property bool dayTime: true
	property color dayGaugeBackgroundColor : "#fcfcfc"
	property color nightGaugeBackgroundColor : "#fcfcfc"	
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

    Keys.onSpacePressed:
    {
       randVal1 = Math.random();
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            topLevelItem.upKeyPressed();
        } else if (event.key === Qt.Key_Down) {
            topLevelItem.downKeyPressed();
        }
    }
	HaltechTellTaleLight {
			id: parkLights
			x: 0
			y: 0
			dataMapAddress: DataMapAddress.PARK_LIGHTS
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeX: "1"
			gaugeY: "1"
	  }						
	
	// RPM bar with repeater
	Item{
		id: screen_07_RPM
		x:0
		y:0
		z:1
		FontLoader {
			id: dinFont
			source: "../../styles/DINCondensed-Bold.ttf"
		}
		property int rpmLine: 860 / ((screen_07_RPM_GAUGE.gaugeMaximumValue - screen_07_RPM_GAUGE.gaugeMinimumValue) / ((screen_07_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1))
		property int rpmLineW: 3
		Row {
			Repeater {
				model: (screen_07_RPM_GAUGE.gaugeMaximumValue - screen_07_RPM_GAUGE.gaugeMinimumValue) / ((screen_07_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1)
				Item{
					id: rpmDivider
					x: 0 + (screen_07_RPM.rpmLine * index)
					y: rpmLineY
					z: 1
					Rectangle {
						id: rpmRect
						width: screen_07_RPM.rpmLineW
						height: rpmLineHeight
						color: screen_07_gear.gaugeValueColor
					}
				}
			}
		}
		Row {
		Repeater {
				model: (screen_07_RPM_GAUGE.gaugeMaximumValue - screen_07_RPM_GAUGE.gaugeMinimumValue) / ((screen_07_RPM_GAUGE.gaugeMaximumValue > 100) ? 250 : 0.25)
				Item{
					x: (screen_07_RPM.rpmLine * index) + (screen_07_RPM.rpmLine / 2)
					y: rpmLineY
					z: 1
					Rectangle {
						width: screen_07_RPM.rpmLineW
						height: rpmLineHeight
						color: screen_07_gear.gaugeValueColor
						opacity: 0.1
					}
				}
			}
		}		
		Row {
			Repeater {
				model: (screen_07_RPM_GAUGE.gaugeMaximumValue - screen_07_RPM_GAUGE.gaugeMinimumValue)  / ((screen_07_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1) + 1
				Item{
					x: (index < 10) ? ((screen_07_RPM.rpmLine * index) - 25) : ((screen_07_RPM.rpmLine * index) - 40)
					y: rpmLineY + 90 - valueFontSize
					z: 1
					Text {
						//font: Qt.font({ family: 'DINCondensed-Bold', pixelSize: 16, weight: Font.Bold, capitalization: Font.AllUppercase })
						font.weight : Font.Bold
						font.family: dinFont.name
						font.pixelSize: valueFontSize
						horizontalAlignment: Text.AlignRight
						z: 1
						color: screen_07_gear.gaugeValueColor
						text: screen_07_RPM_GAUGE.gaugeMinimumValue + index
					}
				}
			}
		}		
		// Hidden to make the segments work...
		HaltechBarGauge{
			id: screen_07_RPM_GAUGE
			property string gaugeSelectedunit : ""
			x: 0
			y: 0
			z: -999
			width: 0
			height: 0
			dataMapAddress: DataMapAddress.RPM
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1 * 1)
			labelX:0
			labelY:0
			labelColor: "black"
			dataMapLabel: "RPM X1000"
			unitFontSize: 12
			gaugeDirection: Qt.Horizontal
			gaugeValueFactor: 1000
			gaugeX : 0
			gaugeY : 0
			gaugeHeight: 1
			gaugeWidth: 1
			gaugeMaximumValue: 4
			gaugeMinimumValue: 0
			gaugeRedStartValue: 3.5
			gaugePrecision: 5
			valueFontSize: 1
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_07_RPM_GAUGE,"screen_07_RPM_GAUGE");
			}			
		}
		ProgressBar {
		   z: 40
           property int dataMapAddress
           property real dataMapValue
		   property real gaugeMaximumValue
		   dataMapAddress: DataMapAddress.RPM
		   dataMapValue: topLevelItem.randVal1
		   gaugeMaximumValue: screen_07_RPM_GAUGE.gaugeMaximumValue
           id: control
           value: 1 - dataMapValue / gaugeMaximumValue / 1000
           height: 80
           clip: true
           background: Rectangle {
				z: 40
                implicitWidth: 860
                implicitHeight: 79
                color: "transparent"
                radius: 0
            }
            contentItem: Item {
                implicitWidth: 860
                implicitHeight: 80

                Rectangle {
					anchors.right: parent.right
					anchors.rightMargin: 0
					z: 999
                    id: bar
                    width: control.value * parent.width
                    height: parent.height
					transformOrigin: Item.Right
                    radius: 0
                    color: Qt.darker(mainColor)
                }
            }

			

		}
	}
	// Gear Display
	Item {
		id: gearArea
		x: 360
		y: 85
		opacity: 1.0
        z: 4
		HaltechBigNumericGauge{
					anchors.top: parent.top
					id: screen_07_gear
					x: 0
					y: 0
					height: 200
					width: 100
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
					//width: 140
					//height: 200			
					dataMapAddress: DataMapAddress.GEAR
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Gear"
					alignment: TextInput.AlignCenter
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 26
					valueY: 10
                    valueStyle: Text.Outline
                    valueStyleColor: "red"
					labelX: 90
					labelY: 172
					labelFontSize: 22
					valueFontSize: 150
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: -1
					gaugeMaximumValue: 6
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_07_gear,"screen_07_gear");
					}			
					
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
					y: 0
					dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/drag.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_07_19
					x: 55
					y: 0
					dataMapAddress: DataMapAddress.NITROUS_STAGE_1_OUTPUT_STATE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/nos.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#11111111"
					gaugeX: "60"
					gaugeY: "60"
				}
		HaltechTellTaleLight {
					id: screen_07_20
					x: 0
					y: 70
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/cel.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_07_21
					x: 60
					y: 70
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/batt.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11111111"
					gaugeX: "50"
					gaugeY: "50"
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
				}
	}
	Item {
		id: floatingIndicators
		x: 0
		y: 0
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
				}
	}
	
	Item {
		id: firstRowOne
		x: 0
		y: 85
		opacity: 1.0
		z: 4
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
		x: 180
		y: 85
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_03
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
						GaugeConfig.initGauge(screen_07_03,"screen_07_03");
					}			
				}	
	}
	Item {
		id: firstRowThree
		x: 500
		y: 85
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_04
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
		x: 180
		y: 185
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_07
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
		x: 680
		y: 185
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_07_09
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
            source: "../../images/DigitalMitch.png"
			}
		Image {
			id: bg2
			width: 860
			height: 480
			smooth: true
			x: 0
			y: 0
			z: 1
			opacity: 0.25
			source: "../../images/haltech_bg.png"
			}		
	}		
}
