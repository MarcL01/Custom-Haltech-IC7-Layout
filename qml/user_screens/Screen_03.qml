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
	//y: 480
	//PropertyAnimation on y { to: 0; duration: Qt.platform.os == "windows" ? 0 : 250 }
	transformOrigin: Item.Center
	//rotation: 180
	width: 860
	height: 480
    id: topLevelItem
    visible: true
    focus: true

    signal upKeyPressed()
    signal downKeyPressed()
	property real randVal1 : 0
	property real outerRadius : 240
	property bool dayTime: true
	property color screenBrightColor : "#ffdd14"
	property color screenDarkColor   : "#7f6e0a"
	property color screenRedColor : "red"
	property color screenNeedleColor : "#7f0000"	
	property color dayGaugeBackgroundColor : "#000000"
	property color nightGaugeBackgroundColor : "#000000"
    /* The following color has to be used to color the background. Not yet implemented */	
	property color backgroundColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor

    Keys.onSpacePressed:
    {
       randVal1 = Math.random();
    }

    Keys.onPressed: {
        if (event.key == Qt.Key_Up) {
			topLevelItem.upKeyPressed();
        } else if (event.key == Qt.Key_Down) {
			topLevelItem.downKeyPressed();
        }
    }

	Image {
            id: bgImage
			width: 860
			height: 480
            x: 0
            y: 0
			z: 0
            source: "../../images/DoubleHeroBG.png"
			}
	Rectangle {
			id: backgroundOverlay
			x: 0
			y: 0
			z: 0
			width: 860
			height: 480
			color: backgroundColor
			opacity: 0.15
			}
	Image {
            id: bezelImage
			width: 860
			height: 480
            x: 0
            y: 0
			z: 5
            source: "../../images/DoubleHeroBezels.png"
			}
	Image {
            id: logoImage
			width: 184
			height: 115
            x: 338
            y: -20
			z: 10
			opacity: 0
            source: "../../images/DoubleHeroLogo.png"
			PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
			PropertyAnimation on y { to: 0; duration: Qt.platform.os == "windows" ? 0 : 500 }
			}
	Image {
			id: insetImageLeft
			width: 177
			height: 170
			x: 230
			y: 236
			z: 3
			source: "../../images/DoubleHeroInset.png"
			}
	Image {
			id: insetImageRight
			width: 177
			height: 170
			x: 670
			y: 236
			z: 3
			source: "../../images/DoubleHeroInset.png"
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
Item {
			id: topIndicators
			x: 0
			y: 0
			z: 5
			width: 860
			height: 480
			HaltechTellTaleLight {
						id: screen_03_14
						x: 10
						y: 5
						dataMapAddress: DataMapAddress.LEFT_INDICATOR
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/left.png"
						gaugeOnColor: "#00FF00"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
			HaltechTellTaleLight {
						id: screen_03_15
						x: 795
						y: 5
						dataMapAddress: DataMapAddress.RIGHT_INDICATOR
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/right.png"
						gaugeOnColor: "#00FF00"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
		}
	Item {
	
		transform: Rotation { id: rot1
					origin.x: screen_03_heroLeftGauge.height / 2
					origin.y: screen_03_heroLeftGauge.height / 2
					axis.x:0; axis.y:1; axis.z:0
					angle: 70 }
					
		NumberAnimation {
		easing.type: Easing.OutCirc;
        target: rot1
        property: "angle"
        from: 70
		to: 0
        duration: Qt.platform.os == "windows" ? 0 : 500
		running: true
		}
		opacity: 0
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		x: 12
		y: 12
		id: leftGaugeGroup
			Rectangle {
			x: 0
			y: 0
			z: 0
	        width: 395
            height: width
			radius: width*0.5
			color: "black"
			}
		Item {
			id: leftGaugeLights
			x: 0
			y: 0
			z: 1
			width: 860
			height: 480
			HaltechTellTaleLight {
						id: screen_03_10
						x: 140
						y: 130
						dataMapAddress: DataMapAddress.HAND_BRAKE
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/ebrake.png"
						gaugeOnColor: "#FF0000"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
			HaltechTellTaleLight {
						id: screen_03_11
						x: 200
						y: 130
						dataMapAddress: DataMapAddress.HIGH_BEAM
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/hibeam.png"
						gaugeOnColor: "#0000FF"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
		}
		HaltechNewCircularGauge {
            id: screen_03_heroLeftGauge
			darkColor : screenDarkColor
			/* Start Color Pallet */
			property color dayGaugeFaceColor : screenBrightColor
			property color nightGaugeFaceColor : "white"
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
            width: 395
            height: 395
			x: -10
            y: -11
			z: 6
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: width
            imageHeight: height
            imageX: x 
            imageY: y 
            imageOpacity: 1.0
            //imageSource: "../../images/HeroScreenTacho.png"
			//dataMapValue : 0
			dataMapValue : 1000 *(screen_03_heroLeftGauge.gaugeMinimumValue + (screen_03_heroLeftGauge.gaugeMaximumValue - screen_03_heroLeftGauge.gaugeMinimumValue) * topLevelItem.randVal1)
            needleImageWidth: 18
            needleImageHeight: 160
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_03_heroLeftGauge,"screen_03_heroLeftGauge");
			}
            dataMapAddress: DataMapAddress.RPM
            gaugeWidth: 395
            gaugeHeight: 395
            gaugeX: 20 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 22 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.32
           /*Start:screen_03_heroLeftGauge*/
           gaugeMaximumValue: 8
           gaugeMinimumValue: 0
           gaugeRedStartValue: 6.5
           gaugeLowerRedStartValue: 0
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_03_heroLeftGauge*/
			gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -180
            gaugeStyleMaximumValueAngle: 90
            gaugeStyleTickmarkLabel: null
			gaugeUnit: "x1000r/min"
			gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
			gaugeMinorTickmarkCount: 3
			gaugeMinorTickmarkInsetRatio : 0.02
			gaugeTickmarkInsetRatio : 0.075
			gaugeFontRatio: 0.5
			gaugeLabelFontRatio:  0.20 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
		}
		}
	Item {
		transform: Rotation { id: rot
					origin.x: screen_03_heroRightGauge.width / 2
					origin.y: screen_03_heroRightGauge.width / 2
					axis.x:0; axis.y:1; axis.z:0
					angle: -70 }
					
		NumberAnimation {
		easing.type: Easing.OutCirc;
        target: rot
        property: "angle"
        from: -70
		to: 0
        duration: Qt.platform.os == "windows" ? 0 : 550
		running: true
		}
		opacity: 0
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
        
		id: rightGaugeGroup
		x: 452
		y: 12
			Rectangle {
			x: 0
			y: 0
			z: 0
	        width: 395
            height: width
			radius: width*0.5
			color: "black"
			}
		Item {
			id: rightGaugeLights
			x: 0
			y: 0
			z: 5
			width: 860
			height: 480
			HaltechTellTaleLight {
						id: screen_03_12
						x: 140
						y: 130
						dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/cel.png"
						gaugeOnColor: "#FF0000"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
			HaltechTellTaleLight {
						id: screen_03_13
						x: 200
						y: 130
						dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
						dataMapValue: Math.round(topLevelItem.randVal1)
						gaugeImage: "../../images/oil.png"
						gaugeOnColor: "#FF0000"
						gaugeOffColor: "#66666666"
						gaugeX: "50"
						gaugeY: "50"
					}
		}
	HaltechNewCircularGauge {
            id: screen_03_heroRightGauge
			darkColor : screenDarkColor
			/* Start Color Pallet */
			property color dayGaugeFaceColor : screenBrightColor
			property color nightGaugeFaceColor : "white"
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
            width: 395
            height: 395
            x: -10
            y: -11
			z: 6
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: width
            imageHeight: height
            imageX: x 
            imageY: y 
            imageOpacity: 1.0
            //imageSource: "../../images/HeroScreenTacho.png"
			//dataMapValue : 0
			dataMapValue : 1000 *(screen_03_heroRightGauge.gaugeMinimumValue + (screen_03_heroRightGauge.gaugeMaximumValue - screen_03_heroRightGauge.gaugeMinimumValue) * topLevelItem.randVal1)
            needleImageWidth: 18
            needleImageHeight: 160
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_03_heroRightGauge,"screen_03_heroRightGauge");
			}
            dataMapAddress: DataMapAddress.VEHICLE_SPEED
            gaugeWidth: 395
            gaugeHeight: 395
            gaugeX: 20 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 22 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.32
           /*Start:screen_03_heroRightGauge*/
           gaugeMaximumValue: 30
           gaugeMinimumValue: -15
           gaugeRedStartValue: 28
           gaugeLowerRedStartValue: 0
           gaugeLabelStepSize: 5
           gaugeStyleTickmarkStepSize: 5
          /*End:screen_03_heroRightGauge*/
			gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.2
            gaugeStyleMinimumValueAngle: -180
            gaugeStyleMaximumValueAngle: 90
			
            gaugeStyleTickmarkLabel: null
			gaugeUnit: "x1000r/min"
			gaugeValueFactor : (dataMapAddress == 1)? 1000 : 1
			  
            gaugeStyleNeedleRotationOffsetY: 0 // Centre of needle from base of needle image, in pixels
            gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.054
            gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 0.80
			gaugeMinorTickmarkCount: 3
			gaugeMinorTickmarkInsetRatio : 0.02
			gaugeTickmarkInsetRatio : 0.075
			gaugeFontRatio: 0.5
			gaugeLabelFontRatio:  0.20 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
			//PropertyAnimation on dataMapAddress { duration: Qt.platform.os == "windows" ? 0 : 250 }
		}
	}
	Item {
		z: 4
		id: fadeIn2
		opacity: 0
		//y: 20
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		//PropertyAnimation on y { to: 0; duration: Qt.platform.os == "windows" ? 0 : 500 }
	Item {
		id: firstRowOne
		x: 235
		y: 238
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_05
					x: 0
					y: 0
					width: 150
					height: 75			
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
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "r/min"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: 65
					unitX: 0
					unitY: 13
					labelFontSize: 18
					valueFontSize: 50
					unitFontSize: 16
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_05,"screen_03_05");
					}
				}	
	}	
	
	Item {
		id: firstRowTwo
		x: 675
		y: 238
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_06
					x: 0
					y: 0
					width: 150
					height: 75			
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
					dataMapLabel: "Speed"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "km/h"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: 65
					unitX: 0
					unitY: 13
					labelFontSize: 18
					valueFontSize: 50
					unitFontSize: 16
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_06,"screen_03_06");
					}			
				}	
	}	
	
	Item {
		id: secondRowOne
		x: 236
		y: 322
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_07
					x: 0
					y: 0
					width: 80
					height: 50			
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
					dataMapAddress: DataMapAddress.MANIFOLD_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "BOOST"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "psi"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: 43
					unitX: 15
					unitY: 13
					labelFontSize: 16
					valueFontSize: 28
					unitFontSize: 14
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_07,"screen_03_07");
					}			
				}	
	}	
	
	Item {
		id: secondRowTwo
		x: 676
		y: 322
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_08
					x: 0
					y: 0
					width: 80
					height: 50			
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
					dataMapAddress: DataMapAddress.FUEL_COMPOSITION
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "eflex"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "%"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: 43
					unitX: 15
					unitY: 13
					labelFontSize: 16
					valueFontSize: 28
					unitFontSize: 14
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_08,"screen_03_08");
					}			
				}	
		}
		Item {
		id: secondRowGear
		x: 380
		y: 290
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_09
					x: 0
					y: 0
					width: 100
					height: 140			
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
					dataMapLabel: "GEAR"
					alignment: TextInput.AlignHCenter
					valignment: TextInput.AlignHCenter
					ualignment: TextInput.AlignRight
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -20
					unitX: 0
					unitY: 0
					labelFontSize: 16
					valueFontSize: 90
					unitFontSize: 14
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: -1
					gaugeMaximumValue: 10
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_09,"screen_03_09");
					}			
				}	
		}
	}
	Item {
		id: fadeIn
		opacity: 0
		y: 20
		PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		PropertyAnimation on y { to: 0; duration: Qt.platform.os == "windows" ? 0 : 500 }
		
	Item {
		id: fourthRowOne
		x: 7
		y: 408
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_01
					x: 0
					y: 0
					width: 186
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
					dataMapAddress: DataMapAddress.COOLANT_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "COOLANT TEMP"
					alignment: TextInput.AlignHCenter
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "°C"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: -12
					unitX: 10
					unitY: 52
					labelFontSize: 28
					valueFontSize: 50
					unitFontSize: 18
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_01,"screen_03_01");
					}			
				}	
	}
	Item {
		id: fourthRowTwo
		x: 220
		y: 408
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_02
					x: 0
					y: 0
					width: 186
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
					dataMapAddress: DataMapAddress.WIDEBAND_OVERALL
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "wideband"
					alignment: TextInput.AlignHCenter
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					gaugeUnit: "AFR-Petrol"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: -12
					unitX: 10
					unitY: 52
					labelFontSize: 28
					valueFontSize: 50
					unitFontSize: 18
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_02,"screen_03_02");
					}			
				}	
	}
	Item {
		id: fourthRowThree
		x: 435
		y: 408
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_03
					x: 0
					y: 0
					width: 186
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
					dataMapAddress: DataMapAddress.FUEL_TRIM_SHORT_TERM_BANK_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "o2 trim"
					alignment: TextInput.AlignHCenter
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					gaugeUnit: "%"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: -12
					unitX: 10
					unitY: 52
					labelFontSize: 28
					valueFontSize: 50
					unitFontSize: 18
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_03,"screen_03_03");
					}			
				}	
	}
	Item {
		id: fourthRowFour
		x: 647
		y: 408
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_03_04
					x: 0
					y: 0
					width: 186
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
					dataMapAddress: DataMapAddress.BATTERY_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "batt volts"
					alignment: TextInput.AlignHCenter
					valignment: TextInput.AlignRight
					ualignment: TextInput.AlignRight
					gaugeUnit: "V"
					gaugeValueFactor: 1
					valueX: 8
					valueY: 14
					labelX: 10
					labelY: -12
					unitX: 10
					unitY: 52
					labelFontSize: 28
					valueFontSize: 50
					unitFontSize: 18
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_03_04,"screen_03_04");
					}			
				}	
	}
	
	}
}
		