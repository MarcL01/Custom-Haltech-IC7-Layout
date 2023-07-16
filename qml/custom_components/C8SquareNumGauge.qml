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
    //property alias dataMapValue: textValue.text
    property real  dataMapValue: 0
    property string dataMapLabel: ""
    property alias gaugeUnit: textUnit.text
    property color gaugeValueColor: "silver"
    property color gaugeValueRedColor: " red"
    property alias unitColor: textUnit.color
    property alias valueX: textValue.x
    property alias valueY: textValue.y
    property alias unitX: textUnit.x
    property alias unitY: textUnit.y
    property int labelFontSize: 14
    property int valueFontSize: 46
    property int unitFontSize: valueFontSize
    property alias valueBgColor: textValue.bgColor
    property alias alignment: textValue.horizontalAlignment
    property alias ualignment: textUnit.horizontalAlignment
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
    property alias gaugeImage: gaugeImage
    property alias imageSource: gaugeImage.source
    property alias imageOpacity: gaugeImage.opacity
    property alias imageX: gaugeRect.x
    property alias imageY: gaugeRect.y
    property alias imageWidth: gaugeRect.width
    property alias imageHeight: gaugeRect.height

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

    Rectangle {
        id: gaugeRect
        radius: 20
        rotation: 90
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(255, 255, 255, .20) }
//                        GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 1.0; color: Qt.rgba(255, 255, 255, 0) }
        }

        height: 170
        width: 110

        Item {
            anchors.horizontalCenter: parent.horizontalCenter
            rotation: -90

            Column {
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: gaugeImage
                }

                Item {
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        id: textValue
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: gaugeWarningColor()
                        property color bgColor: "#00000000"
                        property color borderColor: "#4286f4"
                        property int borderRadius: 0
                        property int borderWidth: 0
    //                    horizontalAlignment: TextInput.AlignHCenter
                        z:3
                        text: displayText
                        readonly property string displayText: formatNumber()
                        font.pointSize: valueFontSize
                        font.family: CustomFonts.rajdhani.name
                        font.styleName: CustomFonts.rajdhaniMedium
                        font.italic: true
                        minimumPointSize: 5
                        fontSizeMode: Text.Fit
                        //(dataMapAddress == 1 ) ? ((gaugeMaximumValue < 50) ? dataMapValue * 1000 : dataMapValue ): dataMapValue.toPrecision(gaugePrecision)
                    }

                    Text {
                        id: textUnit
                        anchors.left: textValue.right
                        anchors.verticalCenter: textValue.verticalCenter
                        font.family: CustomFonts.rajdhani.name
                        font.pixelSize: unitFontSize
                        font.italic: gaugeLabelItalic
                        color: "#00da75"
                        property color bgColor: "#00000000"
                        property color borderColor: "#4286f4"
                        property int borderRadius: 0
                        property int borderWidth: 0
    //                    horizontalAlignment: TextInput.AlignLeft
    //                    verticalAlignment: TextInput.AlignVCenter
                        z:2
                        visible: true
                    }
                }
            }
        }
    }
}
