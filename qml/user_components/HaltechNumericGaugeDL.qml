import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "HaltechNumericGaugeDL"
	property alias objectName: textValue.objectName
    property int dataMapAddress: 0
    //property alias dataMapValue: textValue.text
	property real  dataMapValue: 0
    property alias dataMapLabel: textLabel.text
    property alias gaugeUnit: textUnit.text
    property color gaugeValueColor: "silver"
    property alias labelColor: textLabel.color
	property alias unitColor: textUnit.color
    property alias labelX: textLabel.x
    property alias labelY: textLabel.y
    property alias valueX: textValue.x
    property alias valueY: textValue.y
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
	property int gaugePrecision : 3
	property int gaugeDecimal : 1
	property bool gaugeItalic : true
	property bool gaugeLabelItalic : true
	
	property real gaugeValueFactor: 1
	function formatNumber() {
	    var str = "";
		var num = 0.0;

	    if(dataMapAddress == 40)
		{
			str = (dataMapValue.toFixed(0) == -3 ) ? "U" :(dataMapValue.toFixed(0) == -2 ) ? "P" :(dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : dataMapValue.toFixed(0);
		}
		else {
		 num = (dataMapAddress == 1 ) ? (dataMapValue ): dataMapValue.toPrecision(gaugePrecision);
		 str = num;
		 if(gaugeDecimal == 0)
		    str = Math.round(num);
		}
		return str;
	}
	
	FontLoader {
		id: dinFont
		source: "../../styles/DINCondensed-Bold.ttf"
	}	

    Text {
        id: textValue
        font: Qt.font({ family: dinFont.name, pixelSize: valueFontSize, weight: Font.DemiBold, italic: gaugeItalic, capitalization: Font.AllUppercase })
        color: (dataMapValue < gaugeRedStartValue * gaugeValueFactor ) ? gaugeValueColor : "red"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
		height: parent.height
        horizontalAlignment: TextInput.AlignRight
		z:1
		text: displayText
		readonly property string displayText: formatNumber()
		//(dataMapAddress == 1 ) ? ((gaugeMaximumValue < 50) ? dataMapValue * 1000 : dataMapValue ): dataMapValue.toPrecision(gaugePrecision)
	}
	 Text {
        id: textLabel
        font: Qt.font({ family: dinFont.name, pixelSize: labelFontSize, weight: Font.Normal, italic: gaugeLabelItalic, capitalization: Font.AllUppercase })
        color: "#00da75"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignLeft
		height: 10
		z:2
    }
	 Text {
        id: textUnit
        font: Qt.font({ family: dinFont.name, pixelSize: unitFontSize, weight: Font.Normal, italic: gaugeLabelItalic })
        color: "#00da75"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        width: parent.width
        horizontalAlignment: TextInput.AlignLeft
		z:3
    }
}
