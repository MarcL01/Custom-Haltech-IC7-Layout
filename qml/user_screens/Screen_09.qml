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
	width: 860
	height: 480
	transformOrigin: Item.Center
	//rotation: 180
    id: topLevelItem
    anchors.fill: parent
    visible: true
    focus: true

    property int columnWidth: 200
    property int startX: 0
    property int startY: 130
    property int rowHeight: 100
    property int rpmLineGap: (740 / 8)
    property int rpmLineWidth: rpmLineGap - 6
    property int rpmLineHeight: 4
    property int rpmLineY: 75
	property real randVal1 : 0
	property bool dayTime: true
	property color screenBrightColor : "#ffdd14"
	property color screenDarkColor   : "#7f6e0a"
	property color screenRedColor : "red"
	property color screenNeedleColor : "#7f0000"	
	property color dayGaugeBackgroundColor : "#000000"
	property color nightGaugeBackgroundColor : "#000000"	
	property color mainColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor
	signal upKeyPressed()
    signal downKeyPressed()

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
	
    Rectangle {
        id: topLevelRectangle
		x: 0
		y: 0
		width: 860
		height: 480
        color: mainColor
		
		//Main Background Image
        Image {
            id: bgMain
            width: 860
			height: 480
            x: 0
            y: 0
            opacity: 0.9
			z: 0
            source: "../../images/BasicRace.png"
        }
		//Logo Overlay
		Image {
			id: bg2
			width: 860
			height: 480
			smooth: true
			x: 0
			y: 0
			z: 1
			opacity: 0.15
			source: "../../images/haltech_bg.png"
			}		
		//Top Bar
		Image {
            id: bgBar
            width: 860
			height: 33
            x:0
            y: 0
            opacity: 1.0
            source: "../../images/BasicRaceBar.png"
        }
		//Top Bar Colour Overlay
		Rectangle {
			id: overlayBar
			width: bgBar.width
			height: bgBar.height
			x: bgBar.x
			y: bgBar.y
			color: mainColor
			visible: false
		}
		OpacityMask {
			anchors.fill: overlayBar
			source: overlayBar
			maskSource: bgBar
			invert: false
			opacity: 0.75
		}
		
		// RPM bar with repeater
		Item{
			id: screen_09_RPM
			x: -4
			y: 0
			property int rpmLine: 820 / ((screen_09_RPM_GAUGE.gaugeMaximumValue - screen_09_RPM_GAUGE.gaugeMinimumValue) / ((screen_09_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1))
			property int rpmLineW: rpmLine - 6
			Row {
				Repeater {
					model: (screen_09_RPM_GAUGE.gaugeMaximumValue - screen_09_RPM_GAUGE.gaugeMinimumValue) / ((screen_09_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1)
					Item{
						x: 26 + (screen_09_RPM.rpmLine * index)
						y: rpmLineY
						Rectangle {
							width: screen_09_RPM.rpmLineW
							height: rpmLineHeight
							color: "white"
						}
					}
				}
			}	
			Row {
				Repeater {
					model: (screen_09_RPM_GAUGE.gaugeMaximumValue - screen_09_RPM_GAUGE.gaugeMinimumValue)  / ((screen_09_RPM_GAUGE.gaugeMaximumValue > 100) ? 1000 : 1) + 1
					Item{
						x: 20 + (screen_09_RPM.rpmLine * index)
						y: rpmLineY - 25
						Text {
							font: Qt.font({ family: 'Lato Bold', pixelSize: 16, weight: Font.Normal, italic: true, capitalization: Font.AllUppercase })
							z: 3
							color: "white"
							text: screen_09_RPM_GAUGE.gaugeMinimumValue + index
						}
					}
				}
			}		
			HaltechBarGauge{
				id: screen_09_RPM_GAUGE
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
				labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
				redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
				backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
			/* End Color Pallet */	
				property string gaugeSelectedunit : ""
				x: 0
				y: rpmLineY + 10
				width: 820
				height: 20
				dataMapAddress: DataMapAddress.RPM
				dataMapValue: topLevelItem.randVal1 * gaugeMaximumValue
				labelX: -40
				labelY: 4
				valueX: -999
				valueY: -999
				unitX: 0
				unitY: 4
				dataMapLabel: "RPM X1000"
				unitFontSize: 0
				gaugeDirection: Qt.Horizontal
				gaugeValueFactor: 1
				gaugeX : 20
				gaugeY : 0
				gaugeHeight: 820
				gaugeWidth: 20
				gaugeMaximumValue: 10000
				gaugeMinimumValue: 0
				gaugeRedStartValue: 8500
				gaugePrecision: 5
				valueFontSize: 0
				Component.onCompleted:
				{
					GaugeConfig.initGauge(screen_09_RPM_GAUGE,"screen_09_RPM_GAUGE");
				}			
			}	
		}
		
		Item {
		id: floatingIndicators
		x: 20
		y: 5
		z: 10
		width: 860
		height: 80
		HaltechTellTaleLight {
					id: screen_09_24
					x: 20
					y: 0
					dataMapAddress: DataMapAddress.LEFT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/left.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_25
					x: 760
					y: 0
					dataMapAddress: DataMapAddress.RIGHT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/right.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_26
					x: 120
					y: 0
					dataMapAddress: DataMapAddress.HAND_BRAKE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/ebrake.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_27
					x: 660
					y: 0
					dataMapAddress: DataMapAddress.HIGH_BEAM
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/hibeam.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		}
		
		Item {
		id: indicatorArea
		x: 90
		y: 425
		opacity: 1.0
		z: 10
		HaltechTellTaleLight {
					id: screen_09_18
					x: 0
					y: 0
					dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/drag.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_19
					x: 130
					y: 0
					dataMapAddress: DataMapAddress.NITROUS_STAGE_1_OUTPUT_STATE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/nos.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "60"
					gaugeY: "60"
				}
		HaltechTellTaleLight {
					id: screen_09_20
					x: 260
					y: 0
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/cel.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_21
					x: 390
					y: 0
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/batt.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_22
					x: 520
					y: 0
					dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/oil.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		HaltechTellTaleLight {
					id: screen_09_23
					x: 650
					y: 0
					dataMapAddress: DataMapAddress.TRACTION_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/trac.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "50"
					gaugeY: "50"
				}
		}
		
		
		
        // Row dividers

        Line01 {
            id: topLine
            x:0
            y: 130
            z: 5
            width: 860
            height: 1
        }

        Line01 {
            id: midLine
            x:0
            y: 130 + rowHeight
            z: 5
            width: 860
            height: 1
        }

        Line01 {
            id: bottomLine
            x: 0
            y: 130 + (rowHeight * 2)
            z: 5
            width: 860
            height: 1
        }

		HaltechBigNumericGauge {
					id: screen_09_01
					x: startX
					y: startY
					width: 180
					height: 120		
					z: 4
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "ENGINE RPM"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "RPM"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_01,"screen_09_01");
					}			
				}	

		HaltechBigNumericGauge {
					id: screen_09_02
					x: startX+ (columnWidth)
					y: startY
					width: 180
					height: 120
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.TARGET_LAMBDA
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "TARGET LAMBDA"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "LA"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 2
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_02,"screen_09_02");
					}			
				}

		HaltechBigNumericGauge {
					id: screen_09_03
					x: startX+ (columnWidth * 2)
					y: startY
					width: 180
					height: 120	
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.OIL_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "OIL TEMP"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "°C"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 150
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_03,"screen_09_03");
					}			
				}
				
		HaltechBigNumericGauge {
					id: screen_09_04
					x: startX+ (columnWidth * 3)
					y: startY
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.OIL_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "OIL PRESS"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "PSI"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 150
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_04,"screen_09_04");
					}			
				}
		
        // Row 2
		
		HaltechBigNumericGauge {
					id: screen_09_05
					x: startX
					y: startY+ (rowHeight * 1)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.FUEL_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "FUEL PRESS"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "PSI"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 150
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_05,"screen_09_05");
					}			
				}

		HaltechBigNumericGauge {
					id: screen_09_06
					x: startX+ (columnWidth * 1)
					y: startY+ (rowHeight * 1)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.WIDEBAND_SENSOR_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "LAMBDA 1"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "LA"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 2
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_06,"screen_09_06");
					}			
				}		

		HaltechBigNumericGauge {
					id: screen_09_07
					x: startX+ (columnWidth * 2)
					y: startY+ (rowHeight * 1)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.THROTTLE_POSITION
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "TPS"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "%"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_07,"screen_09_07");
					}			
				}		


		HaltechBigNumericGauge {
					id: screen_09_08
					x: startX+ (columnWidth * 3)
					y: startY+ (rowHeight * 1)
					width: 180
					height: 120	
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.MANIFOLD_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "MANIFOLD PRESSURE"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "PSI"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: -15
					gaugeMaximumValue: 45
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_08,"screen_09_08");
					}			
				}				
		

        // Row 3
		HaltechBigNumericGauge {
					id: screen_09_09
					x: startX+ (columnWidth * 0)
					y: startY+ (rowHeight * 2)
					width: 180
					height: 120
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.BATTERY_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "VOLTS"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "V"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_09,"screen_09_09");
					}			
				}
				
		HaltechBigNumericGauge {
					id: screen_09_10
					x: startX+ (columnWidth * 1)
					y: startY+ (rowHeight * 2)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.VEHICLE_SPEED
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "VEHICLE SPEED"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "KMH"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 200
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_10,"screen_09_10");
					}			
				}
				
		HaltechBigNumericGauge {
					id: screen_09_11
					x: startX+ (columnWidth * 2)
					y: startY+ (rowHeight * 2)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.COOLANT_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "ENGINE TEMP"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "°C"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 200
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_11,"screen_09_11");
					}			
				}
				
		HaltechBigNumericGauge {
					id: screen_09_12
					x: startX+ (columnWidth * 3)
					y: startY+ (rowHeight * 2)
					width: 180
					height: 120		
					z: 4					
					/* Start Color Pallet */
				    property color dayValueColor : "#FFC72C"
					property color nightValueColor : "#FFC72C"
					property color dayUnitColor : "white"
					property color nightUnitColor : "white"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.AIR_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "AIR TEMP"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 80
					gaugeUnit: "°C"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 24
					labelX: 0
					labelY: 5
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 200
					gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_09_12,"screen_09_12");
					}			
				}
    }
/*
    PropertyAnimation {
        target: control
        property: "value"
        from: 0.2
        to: 0.95
        easing.type: Easing.InQuad
        duration: Qt.platform.os == "windows" ? 0 : 4000
        running: true
        loops: Animation.Infinite

    }

    // Intro

    PropertyAnimation {
        target: bgTop
        property: "y"
        from: -30
        to: 00
        duration: Qt.platform.os == "windows" ? 0 : 250
        running: true
        easing.type: Easing.Bezier
    }

    PropertyAnimation {
        target: fuelGauge
        property: "y"
        from: -30
        to: 3
        duration: Qt.platform.os == "windows" ? 0 : 250
        running: true
        easing.type: Easing.Bezier
    }

    // RPM intro
    PropertyAnimation {
        target: label0
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 50
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar1
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 100
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label1
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 100
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar2
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 200
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label2
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 200
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar3
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 300
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label3
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 300
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar4
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 400
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label4
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 400
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar5
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 500
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label5
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 500
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar6
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 600
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label6
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 600
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar7
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 700
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label7
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 700
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: rpmbar8
        property: "y"
        from: rpmLineY-15
        to: rpmLineY
        duration: Qt.platform.os == "windows" ? 0 : 800
        running: true
        easing.type: Easing.Bezier
    }
    PropertyAnimation {
        target: label8
        property: "y"
        from: rpmLineY - 40
        to: rpmLineY - 25
        duration: Qt.platform.os == "windows" ? 0 : 800
        running: true
        easing.type: Easing.Bezier
    }
	*/

}


