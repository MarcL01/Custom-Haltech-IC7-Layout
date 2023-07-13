import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    objectName: "HaltechNewCircularGaugeClassic"
    property alias objectName: gauge.objectName

    property int dataMapAddress: 0
    property real  dataMapValue: 0
	property string dataMapLabel: ""
	property string gaugeUnit: ""
	property alias gaugeUnit: textLabel.text
 
    property alias imageWidth: gaugeRect.width
    property alias imageHeight: gaugeRect.height
    property alias needleImageWidth: gauge.needleWidth
    property alias needleImageHeight: gauge.needleHeight
    property alias imageX: gaugeRect.x
    property alias imageY: gaugeRect.y
    property alias gaugeImage: gaugeImage
    property alias imageOpacity: gaugeImage.opacity
    property alias imageSource: gaugeImage.source
	
    //property alias dataMapLabel: textLabel.text
    property int labelY
	property int labelFontSize: 18

    property alias gaugeWidth: gauge.width
    property alias gaugeHeight: gauge.height
    property alias gaugeX: gauge.x
    property alias gaugeY: gauge.y
    property alias gaugeOpacity: gauge.opacity
    property alias gaugeMinimumValue: gauge.minimumValue
    property alias gaugeMaximumValue: gauge.maximumValue
    property alias gaugeStepSize: gauge.stepSize


    property real gaugeStyleLabelInsetRatioToOuterRadius
    property alias gaugeStyleMinimumValueAngle: gauge.minimumValueAngle
    property alias gaugeStyleMaximumValueAngle: gauge.maximumValueAngle
    property alias gaugeStyleTickmarkStepSize: gauge.tickmarkStepSize
    property alias gaugeStyleTickmark: gauge.tickmark
    property alias gaugeStyleMinorTickmark: gauge.minorTickmark
    property alias gaugeStyleTickmarkLabel: gauge.tickmarkLabel
    property alias gaugeForeground: gauge.foreground
	property bool gaugeHideNeedle: false
    property alias gaugeStyleNeedleSource: gauge.needleSource
    property alias gaugeStyleNeedleRotationOffsetY: gauge.needleRotationOffsetY // Centre of needle from base of needle image, in pixels
    property real gaugeStyleNeedleImplicitWidthRatioToOuterRadius
    property real gaugeStyleNeedleImplicitHeightRatioToOuterRadius
	property alias gaugeLabelStepSize : gauge.gaugeLabelStepSize
	property alias gaugeGradientColor: gauge.gradientColor
	property alias gaugeDayTime : gauge.dayTime
	property alias gaugeRedStartValue : gauge.redStartValue
	property alias gaugeRedEndValue : gauge.redEndValue
	property bool enableRedStart: false
	property alias gaugeLowerRedStartValue: gauge.lowerRedStartValue
	property bool enableLowerRedStart : false		
	property alias gaugeRedThickness : gauge.redThickness
	property alias gaugeRedColor : gauge.redColor
	property alias gaugeMinorTickmarkCount : gauge.minorTickmarkCount
	property alias gaugeValueFactor : gauge.valueFactor
	property alias gaugeFontRatio : gauge.fontRatio
	property alias gaugeLabelFontRatio : gauge.labelFontRatio
	property alias gaugeTopMarginRatio : gauge.topMarginRatio
	property alias gaugeTickMarksVisible : gauge.tickmarksVisible
	property alias gaugeCircleVisible : gauge.circleVisible
	property alias gaugeTickmarkInsetRatio : gauge.tickmarkInsetRatio
	property alias gaugeMinorTickmarkInsetRatio : gauge.minorTickmarkInsetRatio
	property color gaugeMajorTickmarkColor : "black"
	property color gaugeMinorTickmarkColor: "black"
	property color gaugeTickmarkLabelColor : "black"
	property color gaugeTickmarkRedLabelColor: "white"	
	property color gaugeFaceColor : "#000000"
	property color darkColor : "#776800"
	property color gaugeNeedleColor : "#b94a00"

	FontLoader {
		id: dinFont
		source: "../../styles/DINCondensed-Bold.ttf"
	}	
	FontLoader {
		id: caviar
		source: "../../styles/CaviarDreams-Bold.ttf"
	}

    Rectangle {
        id: gaugeRect
        color: "#00000000" //gaugeFaceColor
		radius: (width / 2)
        Image {
			z: 0
            id: gaugeImage
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true			
        }
		

        CircularGauge {
            id: gauge
			z: 2
            property real needleWidth: 0
            property real needleHeight: 0
            property real minimumValueAngle: 0
            property real maximumValueAngle: 0
            property Component tickmark: Rectangle
			{
			  width: outerRadius * 0.01
			  height: outerRadius * 0.05
			  color: "transparent"
			  anchors.bottom: parent.top
			  anchors.bottomMargin : outerRadius * -0.03
			  property color tickColor: gaugeMajorTickmarkColor
			  onTickColorChanged:
			  {
			    tickmarkCanvas.requestPaint();
			  }
			  Canvas {
				   id: tickmarkCanvas
				   anchors.fill:parent
				   onPaint:{
					 var context = getContext("2d");
					 context.beginPath();
					 context.moveTo(0,0);
					 context.lineTo(width,0);
					 context.lineTo(width/2,height);
					 context.closePath();
					 context.fillStyle = tickColor;
					 context.fill();
				   }
			  }
			 }	
            property Component minorTickmark: Rectangle{
					y: outerRadius * 0.02
					implicitWidth: outerRadius * 0.01
					implicitHeight: outerRadius * 0.02
					antialiasing: true
					color: gaugeMinorTickmarkColor
			}
			property real valueFactor : 1
			property real fontRatio : 0.3
			property real labelFontRatio : 0.1
			property real topMarginRatio : 0.3
			property bool circleVisible : true
			property real tickmarkInsetRatio : 0.01
			property real minorTickmarkInsetRatio : 0.01
            property Component tickmarkLabel: null;
            property Component foreground: null
            property Component needleSource: null
            property real needleRotationOffsetY: 0
			property real gaugeLabelStepSize : 10
            property real tickmarkStepSize: 1
			property color gradientColor: "#ff2200"
			property color backgroundColor : "#FF0000"
			property real redStartValue : maximumValue
			property real redEndValue : maximumValue
			property real lowerRedStartValue: minimumValue
			property real redThickness : 0.1
			property color redColor : "red" 
			property int minorTickmarkCount : 9
			property bool dayTime : true
			property Canvas styleCanvas : null
			onDayTimeChanged:{
				if(styleCanvas) styleCanvas.requestPaint();
			}	
			value : (dataMapValue / valueFactor)
			style: HaltechNewDashboardGaugeStyleClassic {} 
        }
		
		Rectangle {
			id: outerBevel
			x: 0
			y: 0
			z: 0
			width: 345
			height: 345
			radius: width / 2
			color: Qt.darker(gaugeTickmarkLabelColor, 1.5)
			anchors.centerIn: gauge
		}
		DropShadow {
			anchors.fill: outerBevel
			radius: 20
			samples: 25
			color: Qt.darker(gaugeTickmarkLabelColor, 1.2)
			source: outerBevel
			verticalOffset: -25
			spread: 0
			opacity: 0.25
			cached: true
		}
		Rectangle {
			id: innerBevel
			x: 0
			y: 0
			z: 0
			width: 335
			height: 335
			radius: width / 2
			color: gaugeFaceColor
			anchors.centerIn: outerBevel
		}
			
		Text {
			anchors.horizontalCenter: gauge.horizontalCenter
			anchors.top: gauge.top
			anchors.topMargin: labelY
			id: textLabel
			color: "#000000"
			font.family: dinFont.name
			font.pixelSize: labelFontSize
			font.capitalization: Font.AllUppercase
			property color bgColor: "#00000000"
			property color borderColor: "#4286f4"
			property int borderRadius: 0
			property int borderWidth: 0
			horizontalAlignment: TextInput.AlignHCenter
			visible: true
			z: 1
		}
		Rectangle {
			z: 0
			width: textLabel.width + 10
			height: textLabel.height + 6
			color: (textLabel.visible = "true") ? "#FFFFFF" : "#FF00000"
			anchors.centerIn: textLabel
		}
		
		
    }
}
