import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    x: 0
    y: 0
    objectName: "HaltechBarGauge"
	property alias objectName: gauge.objectName
    property int dataMapAddress: 0
    property real dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property alias gaugeUnit: textUnit.text
    property alias valueColor: textValue.color
    property alias labelColor: textLabel.color
	property alias unitColor: textUnit.color
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
	property alias labelAlignment: textLabel.horizontalAlignment
    property int gaugeX: 0
    property int gaugeY: 0
	property int gaugeHeight : 100
	property int gaugeWidth : 10
    property alias valueX: textValue.x
    property alias valueY: textValue.y
    property alias unitX: textUnit.x
    property alias unitY: textUnit.y
	property int labelFontSize: 30
	property int valueFontSize: 30
	property int unitFontSize: valueFontSize
    property alias valueBgColor: textValue.bgColor
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: textValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 1000
	property real gaugeRedStartValue: 1000
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false	
	property alias gaugeDirection : gauge.orientation
    property string imageSource : ""
	property int imageX : 0
	property int imageY : 0
	property real gaugeValueFactor: 1
	property int gaugePrecision : 3
	property int gaugeDecimalPlaces : 0
	property string gaugeSelectedUnit : ""
	property color brightColor : "#ffdd14"
	property color darkColor : "#776800"
	property color backgroundColor : "white"
    property color redColor : "red"
	
	function gaugeWarningColor() {
	    var str = "";
		if((enableRedStart && dataMapValue > gaugeRedStartValue* gaugeValueFactor ) || 
		(enableLowerRedStart && dataMapValue < gaugeLowerRedStartValue* gaugeValueFactor ) )
		{
		  str = redColor;
		}
		else
		{
		  str = brightColor;
		}
		return str;
	}
	
	FontLoader {
	id: dinFont
	source: "../../styles/DINCondensed-Bold.ttf"
	}	

	Rectangle {
	    id: gaugeView
		x: gaugeX
		y: gaugeY
		width: gaugeDirection === Qt.Vertical ? gaugeWidth : gaugeHeight
		height: gaugeDirection === Qt.Vertical ? gaugeHeight : gaugeWidth
		color: backgroundColor

		Gauge {
			x: 0
			y: 0
			width: gaugeDirection === Qt.Vertical ? gaugeWidth : gaugeHeight
			height: gaugeDirection === Qt.Vertical ? gaugeHeight : gaugeWidth
			id: gauge
			//anchors.fill: parent
			minimumValue: gaugeMinimumValue.toPrecision(gaugePrecision)
			maximumValue: gaugeMaximumValue.toPrecision(gaugePrecision)
			orientation: Qt.Vertical
			property real redStartValue : gaugeRedStartValue.toPrecision(gaugePrecision)
			tickmarkStepSize: maximumValue - minimumValue + 1
			value : (dataMapValue / gaugeValueFactor)
			style: GaugeStyle {
				valueBar: Rectangle {
					implicitWidth: gauge.height
					color: gaugeWarningColor()
				}
				minorTickmark : null
				tickmark: null
				tickmarkLabel: null
				
			}
		}
		 Image {
            id: gaugeIcon
            smooth: true
            x: imageX
            y: imageY
			height: 20
            opacity: 1.0
            source: imageSource
        }

	}
    Text {
        id: textValue
		font.family: dinFont.name
        color: gaugeWarningColor()
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
		height: 60
        horizontalAlignment: TextInput.AlignRight
		z:1
        text: dataMapValue
		layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 2
			horizontalOffset: 2
            color: "#F0000000"
            radius: 5
            samples: 8
			}
    }
	 Text {
        id: textLabel
		font.family: dinFont.name
        color: labelColor
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignRight
		height: 10
		z:2
		wrapMode: "WordWrap"
    }
	 Text {
        id: textUnit
		font.family: dinFont.name
        color: labelColor
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignRight
		z:3
    }
}
