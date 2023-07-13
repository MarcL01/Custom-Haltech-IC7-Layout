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
	property color backgroundColor	:	"#282828"
	property color screenBrightColor : "#ffffff"
	property color screenDarkColor   : "#7f6e0a"
	property color screenRedColor : "red"
	property color screenNeedleColor : "#b94a00"	
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
	
	//Main Background Image
		Rectangle {
			width: 860
			height: 480
			color: "#000000"
		}
		Image {
			id: bgMain2
			width: 860
			height: 480
			x: 0
			y: 0
			z: 0
			opacity: 0.25
			source: "../../images/leather1.png"
		}
        Image {
            id: bgMain
            width: 860
			height: 480
            x: 0
            y: 0
			z: 0
            source: "../../images/retrobg.png"
        }
		Image {
            id: logoImage
			width: 160
			height: 100
            x: 350
            y: -20
			z: 2
			opacity: 0
            source: "../../images/DoubleHeroLogo.png"
			PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
			PropertyAnimation on y { to: -5; duration: Qt.platform.os == "windows" ? 0 : 500 }
			}
		Image {
            id: bgBar
            width: 860
			height: 109
            x: 0
            y: 371
			z: 3
            source: "../../images/retrobar.png"
        }


		Item {
		id: floatingIndicators
		z: 9
		HaltechTellTaleLight {
					id: screen_10_09
					x: 180
					y: 100
					dataMapAddress: DataMapAddress.LEFT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/left.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "40"
					gaugeY: "40"
				}
		HaltechTellTaleLight {
					id: screen_10_10
					x: 630
					y: 100
					dataMapAddress: DataMapAddress.RIGHT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/right.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "40"
					gaugeY: "40"
				}
		HaltechTellTaleLight {
					id: screen_10_11
					x: 290
					y: 100
					dataMapAddress: DataMapAddress.HAND_BRAKE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/ebrake.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "40"
					gaugeY: "40"
				}
		HaltechTellTaleLight {
					id: screen_10_12
					x: 530
					y: 100
					dataMapAddress: DataMapAddress.HIGH_BEAM
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/hibeam.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#11FFFFFF"
					gaugeX: "40"
					gaugeY: "40"
				}
		}
		
		HaltechNewCircularGaugeRetro {
		    id: screen_10_heroCircularGauge_1
			darkColor : screenDarkColor
			/* Start Color Pallet */
			property real outerRadius : 300
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
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            x: 95
            y: 5
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth + 30
            imageHeight: gaugeHeight + 30
            imageX: 0
            imageY: 0 
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_10_heroCircularGauge_1,"screen_10_heroCircularGauge_1");
			}
            dataMapAddress: DataMapAddress.RPM
			dataMapLabel: "RPM x1000"
            gaugeWidth: 300
            gaugeHeight: 300
			labelX: 30
            gaugeX: 15 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 15 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.075
            /*Start:screen_10_heroCircularGauge_1*/
           gaugeMaximumValue: 8
           gaugeMinimumValue: 0
           gaugeRedStartValue: 6.5
           gaugeLowerRedStartValue: 0
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_10_heroCircularGauge_1*/
			gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.23
            gaugeStyleMinimumValueAngle: -135
            gaugeStyleMaximumValueAngle: 135
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
			gaugeLabelFontRatio:  0.15 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
		}
		HaltechBigNumericGauge {
					z: 1
					id: screen_10_01
					x: 200
					y: 250
					width: 120
					height: 40		
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					gaugeUnit: "RPM"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignHCenter
					ualignment: TextInput.AlignHCenter
					unitX: 0
					unitY: 58
					gaugeValueFactor: 1
					valueX: 4
					valueY: 8
					labelX: 0
					labelY: 40
					labelFontSize: 18
					valueFontSize: 18
					unitFontSize: 12
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0	
					imageWidth: width
					imageHeight: height
					imageX: 0
					imageY: 0 
					imageOpacity: 1.0
					imageSource: "../../images/minidigi.png"
					useRetro : true
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
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_01,"screen_10_01");
					}
				}
		
		HaltechNewCircularGaugeRetro {
		    id: screen_10_heroCircularGauge_2
			darkColor : screenDarkColor
			property real outerRadius : 300
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
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            x: 435
            y: 5
			
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +30
            imageHeight: gaugeHeight +30
            imageX: 0
            imageY: 0 
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_10_heroCircularGauge_2,"screen_10_heroCircularGauge_2");
			}
            dataMapAddress: DataMapAddress.VEHICLE_SPEED
			dataMapLabel: "KM/H"
            gaugeWidth: 300
            gaugeHeight: 300
			labelX: 30
            gaugeX: 15 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 15 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.075
           /*Start:screen_10_heroCircularGauge_2*/
           gaugeMaximumValue: 120
           gaugeMinimumValue: 0
           gaugeRedStartValue: 241
           gaugeLowerRedStartValue: 0
           gaugeLabelStepSize: 20
           gaugeStyleTickmarkStepSize: 20
          /*End:screen_10_heroCircularGauge_2*/
			gaugeRedEndValue: gaugeMaximumValue * 1.05
            gaugeStyleLabelInsetRatioToOuterRadius: 0.23
            gaugeStyleMinimumValueAngle: -135
            gaugeStyleMaximumValueAngle: 135
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
			gaugeLabelFontRatio:  0.15 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
		}
		
		HaltechBigNumericGauge {
					z: 1
					id: screen_10_02
					x: 540
					y: 250
					width: 120
					height: 40		
					dataMapAddress: DataMapAddress.VEHICLE_SPEED
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Speed"
					gaugeUnit: "KM/H"
					alignment: TextInput.AlignRight
					valignment: TextInput.AlignHCenter
					ualignment: TextInput.AlignHCenter
					unitX: 0
					unitY: 58
					gaugeValueFactor: 1
					valueX: 4
					valueY: 8
					labelX: 0
					labelY: 40
					labelFontSize: 18
					valueFontSize: 18
					unitFontSize: 12
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0	
					imageWidth: width
					imageHeight: height
					imageX: 0
					imageY: 0 
					imageOpacity: 1.0
					imageSource: "../../images/minidigi.png"
					useRetro: true
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
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_02,"screen_10_02");
					}
				}
		
		HaltechNewCircularGaugeRetro {
		    id: screen_10_heroCircularGauge_3
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
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            x: -5
            y: 280
			
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
            imageX: 0
            imageY: 0 
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_10_heroCircularGauge_3,"screen_10_heroCircularGauge_3");
			}
            dataMapAddress: DataMapAddress.BATTERY_VOLTAGE
			dataMapLabel: "VOLTS"
			labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
			labelX: -40
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.075
           /*Start:screen_10_heroCircularGauge_3*/
           gaugeMaximumValue: 120
           gaugeMinimumValue: 0
           gaugeRedStartValue: 99
           gaugeLowerRedStartValue: 21
           gaugeLabelStepSize: 20
           gaugeStyleTickmarkStepSize: 20
          /*End:screen_10_heroCircularGauge_3*/
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
		}
		
		HaltechNewCircularGaugeRetro {
		    id: screen_10_heroCircularGauge_4
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
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            x: 675
            y: 280
			
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
            imageX: 0
            imageY: 0 
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_10_heroCircularGauge_4,"screen_10_heroCircularGauge_4");
			}
            dataMapAddress: DataMapAddress.MANIFOLD_PRESSURE
			dataMapLabel: "MANI PRESS"
			labelFontSize: 12
            gaugeWidth: 180
            gaugeHeight: 180
			labelX: -40
            gaugeX: 5 // Distance outer radius of gauge is from left of image, in pixels
            gaugeY: 5 // Distance outer radius of gauge is from top of image, in pixels
            gaugeOpacity: 1.0
            gaugeStepSize: 0.01
			gaugeRedThickness: 0.075
           /*Start:screen_10_heroCircularGauge_4*/
           gaugeMaximumValue: 120
           gaugeMinimumValue: 0
           gaugeRedStartValue: 99
           gaugeLowerRedStartValue: 21
           gaugeLabelStepSize: 20
           gaugeStyleTickmarkStepSize: 20
          /*End:screen_10_heroCircularGauge_4*/
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
		}
		
		HaltechNewCircularGaugeRetro {
		    id: screen_10_heroCircularGauge_5
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
			gaugeFaceColor : (topLevelItem.dayTime) ? dayGaugeFaceColor : nightGaugeFaceColor
			gaugeRedColor : (topLevelItem.dayTime) ? dayGaugeRedColor : nightGaugeRedColor
			gaugeNeedleColor : (topLevelItem.dayTime) ? dayGaugeNeedleColor : nightGaugeNeedleColor
			gaugeMajorTickmarkColor : (topLevelItem.dayTime) ? dayMajorTickmarkColor : nightMajorTickmarkColor
			gaugeMinorTickmarkColor : (topLevelItem.dayTime) ? dayMinorTickmarkColor : nightMinorTickmarkColor
			gaugeTickmarkLabelColor : (topLevelItem.dayTime) ? dayTickmarkLabelColor : nightTickmarkLabelColor
			gaugeTickmarkRedLabelColor : (topLevelItem.dayTime) ? dayTickmarkRedLabelColor : nightTickmarkRedLabelColor
			gaugeDayTime : (topLevelItem.dayTime) ? true : false
			/* End Color Pallet */		
            x: 335
            y: 280
			
			scale: 1.0
			property string gaugeSelectedUnit: ""
            imageWidth: gaugeWidth +10
            imageHeight: gaugeHeight +10
            imageX: 0
            imageY: 0 
            imageOpacity: 1.0
            imageSource: "../../images/retro_gaugebg.png"
			dataMapValue : 1000 *(screen_01_heroCircularGauge.gaugeMinimumValue + (screen_01_heroCircularGauge.gaugeMaximumValue - screen_01_heroCircularGauge.gaugeMinimumValue) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_10_heroCircularGauge_5,"screen_10_heroCircularGauge_5");
			}
            dataMapAddress: DataMapAddress.OIL_PRESSURE
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
           /*Start:screen_10_heroCircularGauge_5*/
           gaugeMaximumValue: 16
           gaugeMinimumValue: 9
           gaugeRedStartValue: 15.5
           gaugeLowerRedStartValue: 9.5
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_10_heroCircularGauge_5*/
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
		}
		
		
		
		
		
		
		
		
		
		
		Item {
		id: indicatorArea
		x: 80
		y: 385
		opacity: 1.0
		z: 10
		HaltechTellTaleLightRetro {
					id: screen_10_03
					x: 0
					y: 0
					dataMapAddress: DataMapAddress.LAUNCH_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "Launch"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_03,"screen_10_03");
					}
				}
				
		HaltechTellTaleLightRetro {
					id: screen_10_04
					x: 130
					y: 0
					dataMapAddress: DataMapAddress.NITROUS_STAGE_1_OUTPUT_STATE
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "Nitrous"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_04,"screen_10_04");
					}
				}
				
		HaltechTellTaleLightRetro {
					id: screen_10_05
					x: 260
					y: 0
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "DTC"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_05,"screen_10_05");
					}
				}
				
		HaltechTellTaleLightRetro {
					id: screen_10_06
					x: 390
					y: 0
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "Charge"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_06,"screen_10_06");
					}
				}
				
		HaltechTellTaleLightRetro {
					id: screen_10_07
					x: 520
					y: 0
					dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "Oil"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_07,"screen_10_07");
					}
				}
		

		HaltechTellTaleLightRetro {
					id: screen_10_08
					x: 650
					y: 0
					dataMapAddress: DataMapAddress.TRACTION_CONTROL_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					dataMapLabel: "Traction"
					gaugeImage: "../../images/indicatorlight.png"
					gaugeColor: "red"
					gaugeX: "50"
					gaugeY: "50"
					labelX: "-30"
					labelY: "45"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_10_08,"screen_10_08");
					}
				}
		}
}


