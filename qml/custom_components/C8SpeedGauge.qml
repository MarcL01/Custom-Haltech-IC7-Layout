import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "HaltechBigNumericGauge"
    property alias objectName: textValue.objectName
    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property string dataMapLabel: ""
    property alias gaugeUnit: textUnit.text
    property int unitFontSize: valueFontSize
    property alias valueBgColor: textValue.bgColor
    property color gaugeValueColor: "#ffffff"
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false
    property int gaugePrecision : 3
    property int gaugeDecimalPlaces : 1
    property bool gaugeItalic : true
    property bool gaugeLabelItalic : true

    property real gaugeValueFactor: 1

    function pd16state(dma)
    {
      if(dma < 198) return false;
      for(var i=0; i<240; i+=62)
      {
           if(dma ==  i + 198 || dma ==  i + 199 || dma ==  i + 203 || dma ==  i + 204 || dma ==  i + 208 || dma ==  i + 209
           || dma ==  i + 213 || dma ==  i + 214 || dma ==  i + 218 || dma ==  i + 222 || dma ==  i + 226 || dma ==  i + 230
           || dma ==  i + 234 || dma ==  i + 238 || dma ==  i + 239 || dma ==  i + 242)
       return true;
       }
    }

    function formatNumber() {
        var str = "";
        var num = 0.0;

        if(dataMapAddress == 40 )
        {
            str = (dataMapValue.toFixed(0) == -8 ) ? "O" :(dataMapValue.toFixed(0) == -7 ) ? "L" :(dataMapValue.toFixed(0) == -6 ) ? "M" :(dataMapValue.toFixed(0) == -5 ) ? "S"  :(dataMapValue.toFixed(0) == -4 ) ? "D"
            :(dataMapValue.toFixed(0) == -3 ) ? "U" :(dataMapValue.toFixed(0) == -2 ) ? "P" :(dataMapValue.toFixed(0) == -1 ) ? "R" : (dataMapValue.toFixed(0) ==  0 ) ? "N" : dataMapValue.toFixed(0);
            return str;
        }
        if(pd16state(dataMapAddress))
        {
           str = (dataMapValue == 0) ? "OK" : (dataMapValue == 1) ? "HighCur" : (dataMapValue == 2) ? "OverCur" : (dataMapValue == 3) ? "ShortCir" : "OpenCir";
        }
        else {
         num = (dataMapAddress == 1 ) ? (dataMapValue ): dataMapValue.toFixed(gaugeDecimalPlaces);
         str = num;
         if(gaugeDecimalPlaces == 0)
            str = Math.round(num);
        }
        return str;
    }
    function gaugeWarningColor() {
        var str = "";
        if((enableRedStart && dataMapValue > gaugeRedStartValue* gaugeValueFactor ) ||
        (enableLowerRedStart && dataMapValue < gaugeLowerRedStartValue* gaugeValueFactor ) )
        {
          str = gaugeValueRedColor;
        }
        else
        {
          str = gaugeValueColor;
        }
        return str;
    }

    Text {
        id: textValue
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -6
        color: gaugeWarningColor()
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        horizontalAlignment: TextInput.AlignHCenter
        z:3
        text: displayText
        readonly property string displayText: formatNumber()
        font.pixelSize: 80
        font.family: CustomFonts.rajdhani.name
        font.styleName: CustomFonts.rajdhaniRegular
        font.italic: true
        minimumPointSize: 5
        fontSizeMode: Text.Fit
    }
     Text {
        id: textUnit
        anchors.top: parent.top
        anchors.topMargin: 75
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: CustomFonts.rajdhani.name
        font.styleName: CustomFonts.rajdhaniSemiBold
        font.pixelSize: unitFontSize
        font.italic: gaugeLabelItalic
        font.capitalization: Font.AllUppercase
        font.letterSpacing: -2
        color: "#ffffff"
        property color bgColor: "#00000000"
        property color borderColor: "#4286f4"
        property int borderRadius: 0
        property int borderWidth: 0
        horizontalAlignment: TextInput.AlignHCenter
        z:2
        visible: true
    }
}
