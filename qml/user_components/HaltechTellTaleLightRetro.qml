import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"
//import DataMapAddressEnums 1.0

Item {
    x: 0
    y: 0
	z: 0
    width: 50
    height: 50

    objectName: "HaltechTellTaleLightRetro"
	property alias objectName: imageValue.objectName
    property int dataMapAddress: 0
	property real  dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property alias labelColor: textLabel.color
    property string labelX: textLabel.x
    property string labelY: textLabel.y
    property alias valueX: imageValue.x
    property alias valueY: imageValue.y
	property int labelFontSize: 18
	property int valueFontSize: 46
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: imageValue.horizontalAlignment
	//property color gaugeValueColor: "silver"
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false		
	property int gaugeDecimal : 1
	property bool gaugeItalic : true
	property bool gaugeLabelItalic : true
	property string gaugeImage : ""
	property string gaugeX : "50"
	property string gaugeY : "50"
	property string gaugeColor : ""
	property real gaugeValueFactor: 1

	FontLoader {
		id: dinFont
		source: "../../styles/JasonSharpie.ttf"
		}
		
	function getHue() {
	    var str = "";
	    if(gaugeColor == "red")
		{
			str = "0";
		}
		else if (gaugeColor == "blue")
		{
			str = "0.6";
		}
		else if (gaugeColor == "yellow")
		{
			str = "0.18";
		}
		else if (gaugeColor == "green")
		{
			str = "0.4";
		}
		else if (gaugeColor == "orange")
		{
			str = "0.075";
		}
		return str;
	}
	
	function gaugeWarningColor() {
	    var str = "";
		if((enableRedStart && dataMapValue > gaugeRedStartValue ) || 
		(enableLowerRedStart && dataMapValue < gaugeLowerRedStartValue ) )
		{
		  str = true
		}
		else
		{
		  str = false
		}
		return str;
	}


    Image {
		id: imageValue
		width: gaugeX
		height: gaugeY
		source: gaugeImage
		}
	Glow {
		opacity: 0.5
        anchors.fill: imageValue
        radius: 15
        samples: 20
		spread: 0.4
        color: gaugeColor
        source: imageValue
		visible: gaugeWarningColor();
		transparentBorder: true
		z: 0
    }
	Colorize {
        anchors.fill: imageValue
        source: imageValue
        hue: getHue()
        saturation: 1
        lightness: 0
		visible: gaugeWarningColor();
      }
	/**
	Rectangle {
		x: 3
		y: 3
		width: imageValue.width - 6
		height: imageValue.height - 6
		radius: width*0.5
		color: dataMapValue == 0 ? gaugeOffColor : gaugeOnColor
	}**/
	
	 /** ColorOverlay {
		width: imageValue.width - 3
		height: imageValue.height - 3
        anchors.fill: imageValue
        source: imageValue
        color: dataMapValue == 0 ? gaugeOffColor : gaugeOnColor
    }**/
	
	function getRandom() {
		return Math.random();
	}
	
	Text {
		x: labelX
		y: labelY
        id: textLabel
        font.family: "JasonSharpie"
		font.pointSize: labelFontSize
		minimumPointSize: 5
		fontSizeMode: Text.Fit
        color: "#000000"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: 110
		height: parent.height
        horizontalAlignment: TextInput.AlignHCenter
		verticalAlignment: TextInput.AlignVCenter
		z:2
		rotation: (Math.random() * -10) + 5
    }
	
	Image {
		anchors.centerIn: textLabel
		id: tape
		width: 120
		height: 36
		source: "../../images/tape.png"
		z: 1
		rotation: textLabel.rotation + 1
	}
}
