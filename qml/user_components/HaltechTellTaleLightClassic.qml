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

    objectName: "HaltechTellTaleLightClassic"
	property alias objectName: imageValue.objectName
    property int dataMapAddress: 0
	property real  dataMapValue: 0
	property int gaugeMaximumValue: 1
    property alias valueX: imageValue.x
    property alias valueY: imageValue.y
    property real gaugeRedStartValue : gaugeMaximumValue
	property bool enableRedStart: true
	property real gaugeLowerRedStartValue: 1
	property bool enableLowerRedStart : true		
	property int gaugeDecimal : 1
	property string gaugeImage : ""
	property string gaugeWidth : "50"
	property string gaugeHeight : "50"
	property string gaugeColor : ""
	property real gaugeValueFactor: 1
		
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
		width: gaugeWidth
		height: gaugeHeight
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
	ColorOverlay {
        anchors.fill: imageValue
        source: imageValue
        color: "#FFFFFF"
		opacity: 0.1
    }
	ColorOverlay {
        anchors.fill: imageValue
        source: imageValue
        color: gaugeColor
		opacity: 1
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
}
