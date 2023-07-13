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
	//transformOrigin: Item.Center
	//rotation: 180
    id: topLevelItem
	width: 860
	height: 480
	x: 0
	y: 0
    anchors.fill: parent
    visible: true
    focus: true
	z: 1

	property bool dayTime: true
	property color screenBrightColor : "#ffdd14"
	property color screenDarkColor   : "#7f6e0a"
	property color screenRedColor : "red"
	property color screenNeedleColor : "#7f0000"
	property color dayGaugeBackgroundColor : "#000000"
	property color nightGaugeBackgroundColor : "#000000"
    /* The following color has to be used to color the background. Not yet implemented */	
	property color backgroundColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor
    signal upKeyPressed()
    signal downKeyPressed()
	property real randVal1 : 0;
	property real outerRadius : 240

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

    Rectangle {
        color: "transparent"
        width: 860
        height: 490
        Image {
            id: bgBottom
            height: 480
            width: 860
            smooth: true
            x: 0
            y: 0
            opacity: 1.0
            source: "../../images/HeroScreen_Background_860.png"
        }
         Image {
            id: bgSide
            height: 480
            width: 860
            smooth: true
            x: 0
            y: 0
            opacity: 1.0
            source: "../../images/HeroScreenSideGauges_860.png"
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
		Item{
		   id:switchGauges
		   x: 335 
		   y: 240
	       opacity: 1.0		
				HaltechTellTaleLight {
					id: screen_01_15
					x: 5
					y: 0
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/cel.png"
					gaugeOnColor: "#ff0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "35"
					gaugeY: "35"
				}
				HaltechTellTaleLight {
					id: screen_01_16
					x: 52
					y: 0
					dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/oil.png"
					gaugeOnColor: "#ff0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "35"
					gaugeY: "35"
				}
				HaltechTellTaleLight {
					id: screen_01_17
					x: 5
					y: 32
					dataMapAddress: DataMapAddress.TRACTION_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/trac.png"
					gaugeOnColor: "#ff0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "35"
					gaugeY: "35"
				}
				HaltechTellTaleLight {
					id: screen_01_18
					x: 50
					y: 32
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/batt.png"
					gaugeOnColor: "#ff0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "35"
					gaugeY: "35"
				}
				HaltechTellTaleLight {
					id: screen_01_19
					x: 50
					y: 70
					dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/drag.png"
					gaugeOnColor: "#ff0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "35"
					gaugeY: "35"
				}
				
				
		   
		}

		HaltechNewCircularGauge {
			id: screen_01_heroCircularGauge
			darkColor : screenDarkColor
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
  			property color dayTickmarkLabelColor : "black"
 			property color nightTickmarkLabelColor : "black" 
  			property color dayTickmarkRedLabelColor : "white"
 			property color nightTickmarkRedLabelColor : "white"     			
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            width: 480
            height: 480
            x: ((parent.width / 2) - (width / 2)) / 2 + 2
            y: (parent.height / 2) - (height / 2) - 5
			
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: width
            imageHeight: height
            imageX: x 
            imageY: y 
            imageOpacity: 1.0
            imageSource: "../../images/HeroScreenTacho.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
            needleImageWidth: 18
            needleImageHeight: 160
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_heroCircularGauge,"screen_01_heroCircularGauge");
			}
            dataMapAddress: DataMapAddress.RPM
            gaugeWidth: 438
            gaugeHeight: 438
            gaugeX: 20 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 22 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.32
           /*Start:screen_01_heroCircularGauge*/
           gaugeMaximumValue: 8
           gaugeMinimumValue: 0
           gaugeRedStartValue: 6.5
           gaugeLowerRedStartValue: 0
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_01_heroCircularGauge*/
			gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -180
            gaugeStyleMaximumValueAngle: 90
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
			gaugeMinorTickmarkInsetRatio : 0.02
			gaugeTickmarkInsetRatio : 0.03
			gaugeFontRatio: 0.5
			gaugeLabelFontRatio:  0.25 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
		}
		Item{
			id: indicatorGauges
			width: 860
			x: 0
			y: -2
			z: 10
			opacity: 1.0
			HaltechTellTaleLight {
					id: screen_01_20
					x: 100
					y: 0
					dataMapAddress: DataMapAddress.LEFT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/left.png"
					gaugeOnColor: "#00ee00"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "45"
					gaugeY: "45"
				}
			HaltechTellTaleLight {
					id: screen_01_21
					x: 720
					y: 0
					dataMapAddress: DataMapAddress.RIGHT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/right.png"
					gaugeOnColor: "#00ee00"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "45"
					gaugeY: "45"
				}
			HaltechTellTaleLight {
					id: screen_01_22
					x: 200
					y: 0
					dataMapAddress: DataMapAddress.HAND_BRAKE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/ebrake.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "45"
					gaugeY: "45"
				}
			HaltechTellTaleLight {
					id: screen_01_23
					x: 620
					y: 0
					dataMapAddress: DataMapAddress.HIGH_BEAM
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/hibeam.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#2b2b2b"
					gaugeX: "45"
					gaugeY: "45"
				}
			}
		Item{
				id:digitalChannels
				x: parent.width/2 + 15
				y: parent.height/2 + 24
				opacity: 1.0	
				HaltechBigNumericGauge{
					id: screen_01_11
					x: 10
					y: 15
					width: 50
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "white"
					property color nightValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "white"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.GEAR
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Gear"
					alignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 15
					valueY: 5
					labelX: 15
					labelY: 65
					unitX: 0
					unitY: 0
					labelFontSize: 20
					valueFontSize: 50
					unitFontSize: 0
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: -1
					gaugeMaximumValue: 10
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_01_11,"screen_01_11");
					}			
				}
				HaltechBigNumericGauge {
					id: screen_01_10
					x: 16
					y: 15
					z: 1
					height: 100
					width: 100
					/* Start Color Pallet */
				    property color dayValueColor : "white"
					property color nightValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
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
					alignment: TextInput.AlignLeft
					ualignment: TextInput.AlignLeft
					valueY : 5
					valueX : 62
					unitX: 62
					unitY: 45
					labelX: 62
					labelY: 65
					labelFontSize: 20
					unitFontSize: 18
					valueFontSize: 40
					gaugeItalic: false
					gaugeLabelItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 300
					dataMapLabel: "Speed"
					gaugeUnit: "km/h"
					gaugeDecimalPlaces: 0					
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_01_10,"screen_01_10");
					}
				}
				HaltechBigNumericGauge{
					id: screen_01_09
					x: 18
					y: 25
					width: 100
					height: 100			
					/* Start Color Pallet */
				    property color dayValueColor : "white"
					property color nightValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
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
					dataMapLabel: "Engine RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: ""
					valueX: 5
					valueY: 88
					labelX: 5
					labelY: 130
					gaugeLabelItalic : false
					gaugeItalic: false
					unitX: 10
					unitY: 88
					labelFontSize: 16
					valueFontSize: 40
					unitFontSize: 14
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9000
					gaugeRedStartValue : 6500
					gaugeValueFactor: 1000
					gaugeDecimalPlaces: 0					
					//unitColor: "white"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_01_09,"screen_01_09");
					}			
				}
		}
		Item {
		id: slideInLeft
		opacity: 0
		x: -50
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		PropertyAnimation on x { to: 0; duration: Qt.platform.os == "windows" ? 0 : 500 }
		HaltechNewBarGauge{
			id: screen_01_01
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
			x: 0
			y: 10
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : -20
			gaugeY : 34
			gaugeHeight: 90
			valueX: 45
			valueY: 38
			labelX: 45
			labelY: 100
			unitX: 70
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_01,"screen_01_01");
			}
		}
		HaltechNewBarGauge{
			id: screen_01_02
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
			x: 0
			y: 119
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : -20
			gaugeY : 34
			gaugeHeight: 90
			valueX: 45
			valueY: 38
			labelX: 45
			labelY: 100
			unitX: 43
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_02,"screen_01_02");
			}
		}
		HaltechNewBarGauge{
			id: screen_01_03
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
			x: 0
			y: 226
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : -20
			gaugeY : 34
			gaugeHeight: 90
			valueX: 45
			valueY: 38
			labelX: 45
			labelY: 100
			unitX: 55
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_03,"screen_01_03");
			}
		}
		HaltechNewBarGauge{
			id: screen_01_04
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
			x: 0
			y: 333
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : -20
			gaugeY : 34
			gaugeHeight: 90
			valueX: 45
			valueY: 38
			labelX: 45
			labelY: 100
			unitX: 90
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_04,"screen_01_04");
			}
		}
		}
		Item {
		id: slideInRight
		opacity: 0
		x: 50
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		PropertyAnimation on x { to: 0; duration: Qt.platform.os == "windows" ? 0 : 500 }
		HaltechNewBarGauge{
			id: screen_01_05
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
			x: 783
			y: 10
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : 11
			gaugeY : 34
			gaugeHeight: 90
			valueX: -100
			valueY: 38
			labelX: -110
			labelY: 100
			unitX: -90
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_05,"screen_01_05");
			}
		}							
		HaltechNewBarGauge{
			id: screen_01_06
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
			x: 783
			y: 119
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : 11
			gaugeY : 34
			gaugeHeight: 90
			valueX: -100
			valueY: 38
			labelX: -85
			labelY: 100
			unitX: -90
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_06,"screen_01_06");
			}
		}							
		HaltechNewBarGauge{
			id: screen_01_07
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
			x: 783
			y: 226
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : 11
			gaugeY : 34
			gaugeHeight: 90
			valueX: -100
			valueY: 38
			labelX: -100
			labelY: 100
			unitX: -90
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_07,"screen_01_07");
			}
		}
		HaltechNewBarGauge{
			id: screen_01_08
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
			x: 783
			y: 333
			width: 120
			height: 80	
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Coolant Temp"
			gaugeUnit: "°C"
			gaugeValueFactor: 1
			labelAlignment: TextInput.AlignLeft
			valueAlignment: TextInput.AlignHCenter
			unitAlignment: TextInput.AlignRight
			gaugeX : 11
			gaugeY : 34
			gaugeHeight: 90
			valueX: -100
			valueY: 38
			labelX: -140
			labelY: 100
			unitX: -90
			unitY: 100
			gaugeMinimumValue : 0
			gaugeMaximumValue: 0
			gaugeRedStartValue: 0
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_01_08,"screen_01_08");
			}
		}
	}		
  }
}

