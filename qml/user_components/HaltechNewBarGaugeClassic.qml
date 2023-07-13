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
    objectName: "HaltechNewBarGaugeClassic"
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
	property int labelFontSize: 20
	property int valueFontSize: 20
	property int unitFontSize: 20
    property alias valueBgColor: textValue.bgColor
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: textValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 1000
	property real gaugeRedStartValue: 1000
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false	
	property string imageSource : null
	property int imageX : 0
	property int imageY : 0
	property real gaugeValueFactor: 1
	property int gaugePrecision : 3
	property int gaugeDecimalPlaces : 0
	property string gaugeSelectedUnit : ""
	property color brightColor : "#ffdd14"
	property color darkColor : "#776800"
	property color backgroundColor : "blue"
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
	
	function valueWarningColor() {
	    var str = "";
		if((enableRedStart && dataMapValue > gaugeRedStartValue* gaugeValueFactor ) || 
		(enableLowerRedStart && dataMapValue < gaugeLowerRedStartValue* gaugeValueFactor ) )
		{
		  str = redColor;
		}
		else
		{
		  str = "white";
		}
		return str;
	}
	
	function formatNumber() {
	    var str = "";
		var num = 0.0;

	    if(dataMapAddress == 40 )
		{
			str = (dataMapValue.toFixed(0) == -3 ) ? "U" :(dataMapValue.toFixed(0) == -2 ) ? "P" :(dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : dataMapValue.toFixed(0);
		}
		else {
		 num = (dataMapAddress == 1 ) ? (dataMapValue ): dataMapValue.toFixed(gaugeDecimalPlaces);
		 str = num;
		 if(gaugeDecimalPlaces == 0)
		    str = Math.round(num);
		}
		return str;
	}
	
	function limitedDataMapvalue()
	{
	    var returnValue = dataMapValue;
		if(dataMapValue < gaugeMinimumValue)
		{
			returnValue = gaugeMinimumValue;
		}
		if(dataMapValue > gaugeMaximumValue)
		{
			returnValue = gaugeMaximumValue;
		}
		return returnValue;		
	}
	
	FontLoader {
	id: dinFont
	source: "../../styles/DINCondensed-Bold.ttf"
	}
	
	Image {
		z: 2
		source: imageSource
	}

	Rectangle {
		z: 1
	    id: background
		x: 8
		y: 28
		width: gaugeWidth
		height: gaugeHeight
		color: backgroundColor
		
		Rectangle {
			id: gauge
			width: 7
			height: gaugeHeight - 14
			x: (limitedDataMapvalue() - gaugeMinimumValue) / (gaugeMaximumValue - gaugeMinimumValue) * (gaugeWidth - gauge.width) 
			y: gaugeY
			color: gaugeWarningColor()
			anchors.bottom: parent.bottom
		}

	}
    Item {
		width: 44
		height: 20
		x: 45
		y: 6
		z: 3
		
		Text {
			id: textValue
			font.family: dinFont.name
			//font.pixelSize: valueFontSize
			font.pixelSize: valueFontSize
			minimumPixelSize: 5
			fontSizeMode: Text.Fit
			color: valueWarningColor()
			property color bgColor: "#00000000"
			property color borderColor: "#4286f4"
			property int borderRadius: 0
			property int borderWidth: 0	
			horizontalAlignment: TextInput.AlignHCenter
			width: parent.width - textUnit.width
			z:3
			text: formatNumber()
			anchors.right: textUnit.left
			anchors.bottom: parent.bottom
		}
		
		Text {
			id: textUnit
			font.family: dinFont.name
			font.capitalization: Font.AllUppercase
			font.pixelSize: unitFontSize
			color: "white" //labelColor
			property color bgColor: "#00000000"
			property color borderColor: "#4286f4"
			property int borderRadius: 0
			property int borderWidth: 0
			//width: parent.width
			horizontalAlignment: TextInput.AlignRight
			anchors.right: parent.right
			z:3
		}
	}
	Text {
        id: textLabel
		font.family: dinFont.name
		font.capitalization: Font.AllUppercase
		font.pixelSize: labelFontSize
        color: "black" //labelColor
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignHCenter
		height: 10
		z:3
		wrapMode: "WordWrap"
    }
}
