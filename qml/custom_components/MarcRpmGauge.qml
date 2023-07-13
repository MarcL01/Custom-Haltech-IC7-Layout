import QtQuick 2.9

Item {
    x: 0
    y: 0
    width: 860
    height: 300
    anchors.horizontalCenter: parent.horizontalCenter
    objectName: "HaltechCircularGauge"

    property alias objectName: tacho.objectName

    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property string gaugeUnit: ""
    property int gaugeDecimalPlaces : 0


    property int labelFontSize: 20
    property int valueFontSize: 70
    property int unitFontSize: 20
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 9000
    property real gaugeRedStartValue : 9000
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false
    property real gaugeValueFactor: 1
    property color brightColor : "#ffdd14"
    property color darkColor : "#776800"
    property color backgroundColor : "white"
    property color redColor : "red"

    property bool tachoScaleActive: true
    property bool tachoUpperFrameActive: true
    property bool tachoBottomFrameActive: true
    property int rpmAnimationTime: 1000

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

    TachoView {
        id: tacho
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 34
        anchors.verticalCenterOffset: 20
        rpmAnimationTime: rpmAnimationTime
        rpm: dataMapValue
    }

    NumberedScaleView{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: -1
        active: tachoScaleActive
    }

    ClipingItem
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 53
        source: "../../images/tacho-top-line.png"
        active: tachoUpperFrameActive
        horizontalClipping: true
    }

    ClipingItem
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 173
        source: "../../images/tacho-bottom-line.png"
        horizontalClipping: true
        horizontalDirection: ClipingItem.Left
        active: tachoBottomFrameActive
    }
}
