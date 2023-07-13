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
	property color screenBrightColor : "white"
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
	
	Rectangle { 	//Main Background Image
		width: 860
		height: 480
		color: "#000000" //mainColor
	}
	Image {
		id: bgMain
		width: 860
		height: 480
		x: 0
		y: 0
		z: 0
		source: "../../images/classic_bg2.png"
	}
	Image {
		id: logoImage
		width: 54
		height: 65
		x: 402
		y: 50
		z: 2
		opacity: 1
		source: "../../images/classic_logo.png"
		//PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		//PropertyAnimation on y { to: -5; duration: Qt.platform.os == "windows" ? 0 : 500 }
		}
	Image {
		id: logoImage2
		width: 111
		height: 24
		x: 374
		y: 300
		z: 2
		opacity: 1
		source: "../../images/classic_logo2.png"
		//PropertyAnimation on opacity { to: 1; duration: Qt.platform.os == "windows" ? 0 : 500 }
		//PropertyAnimation on y { to: -5; duration: Qt.platform.os == "windows" ? 0 : 500 }
		}


	Item { //these are the built-in inputs
		id: floatingIndicators
		x: 348
		y: 0
		z: 9
		HaltechTellTaleLight {
			y: 10
			x: 12
			id: screen_13_10
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/left_classic.png"
			gaugeOnColor: "#00FF00"
			gaugeOffColor: "#11FFFFFF"
			gaugeX: "47"
			gaugeY: "28"
			}
		HaltechTellTaleLight {
			y: 10
			x: 105
			id: screen_13_11
			dataMapAddress: DataMapAddress.RIGHT_INDICATOR
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/right_classic.png"
			gaugeOnColor: "#00FF00"
			gaugeOffColor: "#11FFFFFF"
			gaugeX: "47"
			gaugeY: "28"
			}
		HaltechTellTaleLight {
			id: screen_13_12
			y: 125
			x: 62
			dataMapAddress: DataMapAddress.HAND_BRAKE
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/ebrake.png"
			gaugeOnColor: "#FF0000"
			gaugeOffColor: "#11FFFFFF"
			gaugeX: "40"
			gaugeY: "40"
			}
		HaltechTellTaleLight {
			id: screen_13_13
			y: 205
			x: 62
			dataMapAddress: DataMapAddress.HIGH_BEAM
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/hibeam.png"
			gaugeOnColor: "#0000FF"
			gaugeOffColor: "#11FFFFFF"
			gaugeX: "40"
			gaugeY: "40"
			}
		HaltechTellTaleLight {
			id: screen_13_14
			x: 62
			y: 165
			dataMapAddress: DataMapAddress.PARK_LIGHTS
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/lobeam.png"
			gaugeOnColor: "#F9AE40"
			gaugeOffColor: "#11FFFFFF"
			gaugeX: "40"
			gaugeY: "40"
			}
	}
	
	HaltechNewCircularGaugeClassic {
		id: screen_13_heroCircularGauge_1
		darkColor : screenDarkColor
		/* Start Color Pallet */
		property real outerRadius : 320
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
		x: 56
		y: 44
		scale: 1.0
		property string gaugeSelectedUnit: ""
		imageWidth: 340
		imageHeight: 340
		imageX: 0
		imageY: 0 
		imageOpacity: 1.0
		//imageSource: "../../images/classic_gaugebg1.png"
		dataMapValue : 1000 *(screen_13_heroCircularGauge_1.gaugeMinimumValue + (screen_13_heroCircularGauge_1.gaugeMaximumValue - screen_13_heroCircularGauge_1.gaugeMinimumValue) * topLevelItem.randVal1)
		Component.onCompleted:
		{
			GaugeConfig.initGauge(screen_13_heroCircularGauge_1,"screen_13_heroCircularGauge_1");
		}
		dataMapAddress: DataMapAddress.RPM
		dataMapLabel: "RPM x1000"
		gaugeWidth: 300
		gaugeHeight: 300
		labelY: 70
		gaugeX: 0 // Distance outer radius of gauge is from left of image, in pixels
		gaugeY: 0 // Distance outer radius of gauge is from top of image, in pixels
		gaugeOpacity: 1.0
		gaugeStepSize: 0.1
		gaugeRedThickness: 0.075
		/*Start:screen_13_heroCircularGauge_1*/
           gaugeMaximumValue: 240
           gaugeMinimumValue: 0
           gaugeRedStartValue: 210
           gaugeLowerRedStartValue: 50
           gaugeLabelStepSize: 20
           gaugeStyleTickmarkStepSize: 20
          /*End:screen_13_heroCircularGauge_1*/
		gaugeRedEndValue: gaugeMaximumValue * 1.05
		gaugeStyleLabelInsetRatioToOuterRadius: 0.1
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
		gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.2
		gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 1
		gaugeMinorTickmarkCount: 5
		gaugeMinorTickmarkInsetRatio : 0.275
		gaugeTickmarkInsetRatio : 0.3
		gaugeFontRatio: 1
		gaugeLabelFontRatio:  0.24 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
	}
	
	Item {
		x: 155
		y: 300
		width: 100
		height: 40
		Rectangle {
			z: 0
			width: parent.width
			height: parent.height
			color: "#dddddd"
		}
		HaltechBigNumericGauge{
			z: 1
			id: screen_13_15
			x: 20
			y: 0
			width: parent.width - 20
			height: parent.height
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
			alignment: TextInput.AlignRight
			gaugeUnit: ""
			gaugeValueFactor: 1
			valueX: 0
			valueY: 6
			labelX: -20
			labelY: 42
			unitX: -18
			unitY: 2
			labelFontSize: 13
			valueFontSize: 45
			unitFontSize: 13
			gaugeLabelItalic : false
			gaugeItalic : false
			gaugeMinimumValue: -1
			gaugeMaximumValue: 10
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_15,"screen_13_15");
			}			
		}
		
	}
	
	
	HaltechNewCircularGaugeClassic {
		id: screen_13_heroCircularGauge_2
		darkColor : screenDarkColor
		/* Start Color Pallet */
		property real outerRadius : 320
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
		x: 505
		y: 43
		scale: 1.0
		property string gaugeSelectedUnit: ""
		imageWidth: 340
		imageHeight: 340
		imageX: 0
		imageY: 0 
		imageOpacity: 1.0
		//imageSource: "../../images/classic_gaugebg1.png"
		dataMapValue : 1000 *(screen_13_heroCircularGauge_2.gaugeMinimumValue + (screen_13_heroCircularGauge_2.gaugeMaximumValue - screen_13_heroCircularGauge_2.gaugeMinimumValue) * topLevelItem.randVal1)
		Component.onCompleted:
		{
			GaugeConfig.initGauge(screen_13_heroCircularGauge_2,"screen_13_heroCircularGauge_2");
		}
		dataMapAddress: DataMapAddress.RPM
		dataMapLabel: "RPM x1000"
		gaugeWidth: 300
		gaugeHeight: 300
		labelY: 70
		gaugeX: 0 // Distance outer radius of gauge is from left of image, in pixels
		gaugeY: 0 // Distance outer radius of gauge is from top of image, in pixels
		gaugeOpacity: 1.0
		gaugeStepSize: 0.1
		gaugeRedThickness: 0.075
		/*Start:screen_13_heroCircularGauge_2*/
           gaugeMaximumValue: 7
           gaugeMinimumValue: 0
           gaugeRedStartValue: 6.25
           gaugeLowerRedStartValue: 0.015
           gaugeLabelStepSize: 1
           gaugeStyleTickmarkStepSize: 1
          /*End:screen_13_heroCircularGauge_2*/
		gaugeRedEndValue: gaugeMaximumValue * 1.05
		gaugeStyleLabelInsetRatioToOuterRadius: 0.1
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
		gaugeStyleNeedleImplicitWidthRatioToOuterRadius: 0.2
		gaugeStyleNeedleImplicitHeightRatioToOuterRadius: 1
		gaugeMinorTickmarkCount: 5
		gaugeMinorTickmarkInsetRatio : 0.275
		gaugeTickmarkInsetRatio : 0.3
		gaugeFontRatio: 1
		gaugeLabelFontRatio:  0.24 // (gaugeSelectedUnit == "RPM") ? 0.08 : 0.23	
	}
	
	Item {
		x: 604
		y: 300
		width: 100
		height: 40
		Rectangle {
			z: 0
			width: parent.width
			height: parent.height
			color: "#dddddd"
		}
		HaltechBigNumericGauge{
			z: 1
			id: screen_13_16
			x: 20
			y: 0
			width: parent.width - 20
			height: parent.height
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
			alignment: TextInput.AlignRight
			gaugeUnit: ""
			gaugeValueFactor: 1
			valueX: 0
			valueY: 6
			labelX: -20
			labelY: 42
			unitX: -18
			unitY: 2
			labelFontSize: 13
			valueFontSize: 45
			unitFontSize: 13
			gaugeLabelItalic : false
			gaugeItalic : false
			gaugeMinimumValue: -1
			gaugeMaximumValue: 10
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_16,"screen_13_16");
			}			
		}
		
	}
	
	
	HaltechNewBarGaugeClassic{
			id: screen_13_01
			/* Start Color Pallet */
			property color dayDarkColor : screenDarkColor
			property color nightDarkColor : screenDarkColor
			property color dayBrightColor : screenBrightColor
			property color nightBrightColor : screenBrightColor				
			property color dayLabelColor : "white"
			property color nightLabelColor : "white"
			property color dayRedColor : "red"
			property color nightRedColor : "red"
			property color dayBackgroundColor : screenBrightColor
			property color nightBackgroundColor : screenDarkColor				
			darkColor: (topLevelItem.dayTime) ? dayDarkColor : nightDarkColor
			brightColor: (topLevelItem.dayTime) ? dayBrightColor : nightBrightColor					
			labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
			redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
			backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
		/* End Color Pallet */	
			property string gaugeSelectedunit : ""
			x: 37
			y: 390
			width: 135
			height: 71
			dataMapAddress: DataMapAddress.RPM
			dataMapValue: topLevelItem.randVal1 * gaugeMaximumValue
			labelX: 0
			labelY: 30
			valueX: 0
			valueY: 0
			unitX: 0
			unitY: 0
			dataMapLabel: "RPM X1000"
			unitFontSize: 12
			valueFontSize: 22
			labelFontSize: 13
			gaugeValueFactor: 1
			gaugeX : 0
			gaugeY : 0
			gaugeHeight: 40
			gaugeWidth: 118
			gaugeMaximumValue: 10000
			gaugeMinimumValue: 0
			gaugeRedStartValue: 8500
			gaugePrecision: 5

			imageSource: "../../images/classic_bargauge.png"
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_01,"screen_13_01");
			}			
		}
		
		HaltechNewBarGaugeClassic{
			id: screen_13_02
			/* Start Color Pallet */
			property color dayDarkColor : screenDarkColor
			property color nightDarkColor : screenDarkColor
			property color dayBrightColor : screenBrightColor
			property color nightBrightColor : screenBrightColor				
			property color dayLabelColor : "white"
			property color nightLabelColor : "white"
			property color dayRedColor : "red"
			property color nightRedColor : "red"
			property color dayBackgroundColor : screenBrightColor
			property color nightBackgroundColor : screenDarkColor				
			darkColor: (topLevelItem.dayTime) ? dayDarkColor : nightDarkColor
			brightColor: (topLevelItem.dayTime) ? dayBrightColor : nightBrightColor					
			labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
			redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
			backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
		/* End Color Pallet */	
			property string gaugeSelectedunit : ""
			x: 195
			y: 390
			width: 135
			height: 71
			dataMapAddress: DataMapAddress.RPM
			dataMapValue: topLevelItem.randVal1 * gaugeMaximumValue
			labelX: 0
			labelY: 30
			valueX: 0
			valueY: 0
			unitX: 0
			unitY: 0
			dataMapLabel: "RPM X1000"
			unitFontSize: 12
			valueFontSize: 22
			labelFontSize: 13
			gaugeValueFactor: 1
			gaugeX : 0
			gaugeY : 0
			gaugeHeight: 40
			gaugeWidth: 118
			gaugeMaximumValue: 10000
			gaugeMinimumValue: 0
			gaugeRedStartValue: 8500
			gaugePrecision: 5

			imageSource: "../../images/classic_bargauge.png"
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_02,"screen_13_02");
			}			
		}
		
		HaltechNewBarGaugeClassic{
			z: 1
			id: screen_13_03
			/* Start Color Pallet */
			property color dayDarkColor : screenDarkColor
			property color nightDarkColor : screenDarkColor
			property color dayBrightColor : screenBrightColor
			property color nightBrightColor : screenBrightColor				
			property color dayLabelColor : "white"
			property color nightLabelColor : "white"
			property color dayRedColor : "red"
			property color nightRedColor : "red"
			property color dayBackgroundColor : screenBrightColor
			property color nightBackgroundColor : screenDarkColor				
			darkColor: (topLevelItem.dayTime) ? dayDarkColor : nightDarkColor
			brightColor: (topLevelItem.dayTime) ? dayBrightColor : nightBrightColor					
			labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
			redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
			backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
		/* End Color Pallet */	
			property string gaugeSelectedunit : ""
			x: 532
			y: 390
			width: 135
			height: 71
			dataMapAddress: DataMapAddress.RPM
			dataMapValue: topLevelItem.randVal1 * gaugeMaximumValue
			labelX: 0
			labelY: 30
			valueX: 0
			valueY: 0
			unitX: 0
			unitY: 0
			dataMapLabel: "RPM X1000"
			unitFontSize: 12
			valueFontSize: 22
			labelFontSize: 13
			gaugeValueFactor: 1
			gaugeX : 0
			gaugeY : 0
			gaugeHeight: 40
			gaugeWidth: 118
			gaugeMaximumValue: 10000
			gaugeMinimumValue: 0
			gaugeRedStartValue: 8500
			gaugePrecision: 5

			imageSource: "../../images/classic_bargauge.png"
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_03,"screen_13_03");
			}			
		}	
		
		HaltechNewBarGaugeClassic{
			z: 0
			id: screen_13_04
			/* Start Color Pallet */
			property color dayDarkColor : screenDarkColor
			property color nightDarkColor : screenDarkColor
			property color dayBrightColor : screenBrightColor
			property color nightBrightColor : screenBrightColor				
			property color dayLabelColor : "white"
			property color nightLabelColor : "white"
			property color dayRedColor : "red"
			property color nightRedColor : "red"
			property color dayBackgroundColor : screenBrightColor
			property color nightBackgroundColor : screenDarkColor				
			darkColor: (topLevelItem.dayTime) ? dayDarkColor : nightDarkColor
			brightColor: (topLevelItem.dayTime) ? dayBrightColor : nightBrightColor					
			labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
			redColor: (topLevelItem.dayTime) ? dayRedColor : nightRedColor
			backgroundColor: (topLevelItem.dayTime) ? dayBackgroundColor : nightBackgroundColor
		/* End Color Pallet */	
			property string gaugeSelectedunit : ""
			x: 690
			y: 390
			width: 135
			height: 71
			dataMapAddress: DataMapAddress.RPM
			dataMapValue: topLevelItem.randVal1 * gaugeMaximumValue
			labelX: 0
			labelY: 30
			valueX: 0
			valueY: 0
			unitX: 0
			unitY: 0
			dataMapLabel: "RPM X1000"
			unitFontSize: 12
			valueFontSize: 22
			labelFontSize: 13
			gaugeValueFactor: 1
			gaugeX : 0
			gaugeY : 0
			gaugeHeight: 40
			gaugeWidth: 118
			gaugeMaximumValue: 10000
			gaugeMinimumValue: 0
			gaugeRedStartValue: 8500
			gaugePrecision: 5

			imageSource: "../../images/classic_bargauge.png"
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_04,"screen_13_04");
			}			
		}	
	
	
	Item { //contains gear pos and lights
		id: gearIndicator
		x: 349
		y: 338
		width: 161
		height: 137
		
		Image { //background
			id: gearIndicatorSurround
			source: "../../images/classic_gearbg.png"
			ColorOverlay {
				anchors.fill: gearIndicatorSurround
				source: gearIndicatorSurround
				color: mainColor
				opacity: 0.5
			}
		}
		
		HaltechBigNumericGauge{
			id: screen_13_05
			x: 65
			y: 15
			width: 39
			height: 100			
			
			/* THESE ARE HARD CODED ON PURPOSE */
			gaugeValueColor: "white" //(topLevelItem.dayTime) ? dayValueColor : nightValueColor
			gaugeValueRedColor: "red" //(topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
			labelColor: "white" //(topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
			unitColor: "white" //(topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
			
			dataMapAddress: DataMapAddress.GEAR
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			dataMapLabel: "Gear"
			alignment: TextInput.AlignHCenter
			gaugeUnit: ""
			gaugeValueFactor: 1
			valueX: 0
			valueY: 20
			labelX: 0
			labelY: 0
			unitX: 0
			unitY: 500
			labelFontSize: 15
			valueFontSize: 50
			unitFontSize: 0
			gaugeLabelItalic : false
			gaugeItalic : false
			gaugeMinimumValue: -1
			gaugeMaximumValue: 10
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_13_05,"screen_13_05");
			}			
		}
		HaltechTellTaleLightClassic {
					id: screen_13_06
					x: 16
					y: 94
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/cel.png"
					gaugeColor: "red" //red,blue,yellow,orange,green
					gaugeWidth: "32"
					gaugeHeight: "32"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_13_06,"screen_13_06");
					}
		}
		HaltechTellTaleLightClassic {
					id: screen_13_07
					x: 50
					y: 94
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/oil.png"
					gaugeColor: "red" //red,blue,yellow,orange,green
					gaugeWidth: "32"
					gaugeHeight: "32"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_13_07,"screen_13_07");
					}
		}
		HaltechTellTaleLightClassic {
					id: screen_13_08
					x: 84
					y: 94
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/batt.png"
					gaugeColor: "red" //red,blue,yellow,orange,green
					gaugeWidth: "32"
					gaugeHeight: "32"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_13_08,"screen_13_08");
					}
		}
		HaltechTellTaleLightClassic {
					id: screen_13_09
					x: 116
					y: 94
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/fuel.png"
					gaugeColor: "red" //red,blue,yellow,orange,green
					gaugeWidth: "32"
					gaugeHeight: "32"
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_13_09,"screen_13_09");
					}
		}
		
		
		
	}
		

}


