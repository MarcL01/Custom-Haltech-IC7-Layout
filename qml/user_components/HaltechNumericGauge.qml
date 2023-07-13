import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    x: 0
    y: 0
    width: 180
    height: 35

    objectName: "HaltechNumericGauge"
	property alias objectName: textValue.objectName
    property int dataMapAddress: 0
    //property alias dataMapValue: textValue.text
	property real  dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property alias gaugeUnit: textUnit.text
    property color gaugeValueColor: "#ffc935"
    property alias labelColor: textLabel.color
	property alias unitColor: textUnit.color
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
    property alias valueX: textValue.x
    //property alias valueY: textValue.y
	property int valueY: 10
    property alias unitX: textUnit.x
    property alias unitY: textUnit.y
	property int labelFontSize: 14
	property int valueFontSize: 46
	property int unitFontSize: valueFontSize
    property alias valueBgColor: textValue.bgColor
    property alias labelBgColor: textLabel.bgColor
    property alias alignment: textValue.horizontalAlignment
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
	property bool enableRedStart: false
	property real gaugeLowerRedStartValue: 0
	property bool enableLowerRedStart : false		
	property int gaugeDecimalPlaces : 0
	property string gaugeSelectedUnit : ""
	property var timeFormat : (gaugeSelectedUnit == "s" || gaugeSelectedUnit == "sec" || gaugeSelectedUnit == "seconds")
	property int valueFontModSize : (timeFormat) ? valueFontSize /2 :  sizeOfFont(valueFontSize,dataMapValue)
	// (timeFormat) ? valueFontSize /2 : (lengthOfdata(dataMapValue) < 5) ? valueFontSize : valueFontSize * 0.8)
	
	property real gaugeValueFactor: 1
	
	FontLoader {
		id: dinFont
		source: "../../styles/DINCondensed-Bold.ttf"
	}	

	function sizeOfFont(val,num){
	   var str = "";
	   
		if(num == Math.round(num)){
		  str = "" + num;
		}
		else {
		    var num1 = parseFloat(num.toFixed(gaugeDecimalPlaces));
			str = "" + num1;
		}
		 return val;
	}
	
    function formatTime(val){
	  var min = Math.floor(val /60);
	  var smin = (min < 10) ? ((min < 1) ? "00" : "0" + min) : min
	  var sec = Math.floor(val - min * 60);
	  var ssec = (sec < 10) ? "0" + sec : sec;
	  var ms =  Math.floor((val - min * 60 - sec) * 10 );
	  return  smin + ":" + ssec + "." + ms;
	}
	function formatDataMapValue(val,dma,unit,p){	
	  if(dma == 1){
		   return val;
	  }
	  if(unit == "enum"){
		   return Math.round(val);
	  }
	  return val.toFixed(gaugeDecimalPlaces);
	}
	
    Text {
        id: textValue
		y: (timeFormat) ? valueY + 20 : valueY
        font: Qt.font({ family: 'Lato Bold', pixelSize: valueFontModSize, weight: Font.Bold, italic: false, capitalization: Font.AllUppercase })
        color: (dataMapValue < gaugeRedStartValue) ? gaugeValueColor : "red"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
		height: 60
        horizontalAlignment: TextInput.AlignRight
		z:1
		text: (timeFormat) ? displayTime : displayText
		readonly property string displayText: formatDataMapValue(dataMapValue,dataMapAddress,gaugeSelectedUnit)
		readonly property string displayTime : formatTime(dataMapValue)
    }
	 Text {
        id: textLabel
        font: Qt.font({ family: 'Lato Bold', pixelSize: labelFontSize, weight: Font.Bold, italic: false, capitalization: Font.AllUppercase })
        color: "#ffffff"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignRight
		height: 10
		z:2
    }
	 Text {
        id: textUnit
        font: Qt.font({ family: 'Lato Bold', pixelSize: unitFontSize, weight: Font.Bold, italic: false })
        color: "#ffc935"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignLeft
		z:3
    }
}
