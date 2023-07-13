import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    objectName: "HaltechCircularGauge"

    property alias objectName: gauge.objectName

    property int dataMapAddress: 0
    property real  dataMapValue: 0
	property string gaugeUnit: ""
 	property int gaugeDecimalPlaces : 0

    property alias imageWidth: gaugeRect.width
    property alias imageHeight: gaugeRect.height
    property alias needleImageWidth: gauge.needleWidth
    property alias needleImageHeight: gauge.needleHeight
    property alias imageX: gaugeRect.x
    property alias imageY: gaugeRect.y
    property alias gaugeImage: gaugeImage
    property alias imageOpacity: gaugeImage.opacity
    property alias imageSource: gaugeImage.source
	
    property alias dataMapLabel: textLabel.text
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
	property int labelFontSize: 14

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
    property real gaugeStyleTickmarkStepSize: 1
	
    property alias gaugeStyleTickmark: gauge.tickmark
    property alias gaugeStyleMinorTickmark: gauge.minorTickmark
    property alias gaugeStyleTickmarkLabel: gauge.tickmarkLabel
    property alias gaugeStyleForeground: gauge.foreground
	property bool gaugeHideNeedle: false
    property alias gaugeStyleNeedleSource: gauge.needleSource
    property alias gaugeStyleNeedleRotationOffsetY: gauge.needleRotationOffsetY // Centre of needle from base of needle image, in pixels
    property real gaugeStyleNeedleImplicitWidthRatioToOuterRadius
    property real gaugeStyleNeedleImplicitHeightRatioToOuterRadius
	property real gaugeLabelStepSize : 1
	property alias gaugeGradientColor: gauge.gradientColor
	property alias gaugeBackgroundColor : gauge.backgroundColor
	property alias gaugeRedStartValue : gauge.redStartValue
	property alias gaugeRedEndValue : gauge.redEndValue
	property bool enableRedStart: true
	property real gaugeLowerRedStartValue: 0
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

    Rectangle {
        id: gaugeRect
        color: "transparent"

        Image {
            id: gaugeImage
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
        }

        CircularGauge {
            id: gauge

            property real needleWidth: null
            property real needleHeight: null
            property real minimumValueAngle: 0
            property real maximumValueAngle: 0
            property Component tickmark: null
            property Component minorTickmark: null
			property real valueFactor : 1
			property real fontRatio : 0.3
			property real labelFontRatio : 0.1
			property real topMarginRatio : 0.3
			property bool circleVisible : false
			property real tickmarkInsetRatio : 0.01
			property real minorTickmarkInsetRatio : 0.01
            property Component tickmarkLabel: null;
            property Component foreground: null
            property Component needleSource: null
            property real needleRotationOffsetY: 0
			property real labelStepSize :((maximumValue - minimumValue) / gaugeLabelStepSize < 100) ? gaugeLabelStepSize : ((maximumValue - minimumValue) / 100)
            property real tickmarkStepSize: ((maximumValue - minimumValue) / gaugeStyleTickmarkStepSize < 100) ? gaugeStyleTickmarkStepSize : ((maximumValue - minimumValue) / 100) 
			property color gradientColor: "#ffc935"
			property color backgroundColor : "#000000"
			property real redStartValue : maximumValue
			property real redEndValue : maximumValue
			property real redThickness : 0.1
			property color redColor : "#e34c22"
			property int minorTickmarkCount : 9
			property int gaugeDecimalPlaces : parent.gaugeDecimalPlaces

			value : (dataMapValue / valueFactor)
			style: HaltechDashboardGaugeStyle {}
        }
		 Text {
			id: textLabel
			font: Qt.font({ family: 'Lato Bold', pixelSize: labelFontSize, weight: Font.Bold, capitalization: Font.AllUppercase })
			color: "#ffffff"
//			width: parent.width
			property color bgColor: "#00000000"
			property color borderColor: "#4286f4"
			property int borderRadius: 0
			property int borderWidth: 0
			horizontalAlignment: text.aligncenter
		}
    }
}

