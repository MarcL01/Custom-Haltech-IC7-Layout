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
    objectName: "HaltechNewBarGauge"
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
	property alias valueAlignment: textValue.horizontalAlignment
	property alias unitAlignment: textUnit.horizontalAlignment
    property int gaugeX: 0
    property int gaugeY: 0
	property int gaugeHeight : 80
	property int gaugeWidth : 30
    property alias valueX: textValue.x
    property alias valueY: textValue.y
    property alias unitX: textUnit.x
    property alias unitY: textUnit.y
	property int labelFontSize: 20
	property int valueFontSize: 70
	property int unitFontSize: 20
    property alias valueBgColor: textValue.bgColor
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: textValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 1000
	property real gaugeRedStartValue : 1000
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false		
	property alias gaugeDirection : gauge.orientation
	property string imageSource : ""
	property int imageX : 0
	property int imageY : 0
	property real gaugeValueFactor: 1
	property int gaugeDecimalPlaces : 0
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
		id : background
		x : gaugeX + 24
		y : gaugeY + 2
		width : gaugeWidth + 8
		height : gaugeHeight - 5
		color : backgroundColor
	}
	
	Rectangle {
	    id: gaugeView
		x: gaugeX - 12
		y: gaugeY
		width: gaugeWidth
		height: gaugeHeight
		color: "transparent"

		Gauge {
			id: gauge
			anchors.fill: parent
			anchors.margins: 0
			minimumValue: 0
			maximumValue: 100
			orientation: Qt.Vertical
			property real redStartValue : ((gaugeRedStartValue - gaugeMinimumValue) * 100) / (gaugeMaximumValue - gaugeMinimumValue)
			tickmarkStepSize: 10
			value : (((dataMapValue / gaugeValueFactor) - gaugeMinimumValue) * 100) / (gaugeMaximumValue - gaugeMinimumValue)

			style: GaugeStyle {
				valueBar: Rectangle {
				   x : -1
					implicitWidth: gaugeWidth
					color:  gaugeWarningColor()
				}
				minorTickmark : null
				tickmarkLabel: null
				foreground: null

				tickmark: Item {
					implicitWidth: 8
					implicitHeight: 2

					Rectangle {	
					    x: 7
						width: gaugeWidth
						height: parent.height
						color: darkColor
					}
				}				
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
   		font.weight : Font.Medium
		font.family: dinFont.name
        font.pixelSize: valueFontSize
		color: gaugeWarningColor()
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
		height: 80
        horizontalAlignment: TextInput.AlignLeft
		verticalAlignment: TextInput.AlignVCenter
		z:1
		text: displayText
		readonly property string displayText: ((dataMapAddress == 1 ) ? ((gauge.maximumValue < 50) ? dataMapValue * 1000 : dataMapValue ).toFixed(0) : dataMapValue.toFixed(gaugeDecimalPlaces))
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
		font.weight : Font.Medium
		font.family: dinFont.name
        font.pixelSize: labelFontSize		
        color: brightColor
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignRight
		z:2
		//wrapMode: "WordWrap"
		layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 2
			horizontalOffset: 2
            color: "#F0000000"
            radius: 2
            samples: 5
			}
    }
	 Text {
        id: textUnit
		font.weight : Font.Medium
		font.family: dinFont.name
        font.pixelSize: unitFontSize
        color: brightColor
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignLeft
		z:3
		layer.enabled: true
        layer.effect: DropShadow {
            verticalOffset: 2
			horizontalOffset: 2
            color: "#F0000000"
            radius: 2
            samples: 5
			}
    }
}
