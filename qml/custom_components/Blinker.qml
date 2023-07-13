import QtQuick 2.9

Item {
    id: root
    width: 286
    height: 517
    opacity: 0

    objectName: "HaltechTellTaleLight"
    property alias objectName: imgTop.objectName
    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property string gaugeOnColor : ""
    property string gaugeOffColor : ""

    property alias sourceTop: imgTop.source
    property alias sourceBottom: imgBottom.source
    property bool isLeftBlinker: false

    Image
    {
        id: imgTop
        anchors.right: parent.right
        anchors.rightMargin: root.isLeftBlinker ? parent.width-width : 0
        anchors.bottom: parent.bottom
        anchors.leftMargin: 63
    }
    Image
    {
        id: imgBottom
        anchors.left: parent.left
        anchors.leftMargin: root.isLeftBlinker ? parent.width-width : 0
        anchors.top: parent.top
    }

    SequentialAnimation {
        id: blinkingAnimation
        loops: Animation.Infinite
        alwaysRunToEnd: true
        running: dataMapValue != 0

        NumberAnimation { target: root; property: "opacity"; to:1; duration: 250; easing.type: Easing.OutQuad}
        PauseAnimation { duration: 300 }
        NumberAnimation { target: root; property: "opacity"; to:0; duration: 250; easing.type: Easing.OutQuad}
        PauseAnimation { duration: 200 }
    }
}
