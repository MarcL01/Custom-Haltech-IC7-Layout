import QtQuick 2.9

Item {
    id: clippingRoot
    width: clipedImage.width
    height: clipedImage.height
    enum HorizontalDirection { Right = 0, Left = 1 }
    property int horizontalDirection: ClipingItem.Right
    enum VerticalDirection { Down = 0, Up = 1 }
    property int verticalDirection: ClipingItem.Up
    property bool horizontalClipping: false
    property bool verticalClipping: false
    property bool active: false
    property int duration: 600
    property alias source: clipedImage.source
    property alias running: clipingAnimation.running

    onActiveChanged:
    {
        if(active)
        {
            startAnimation()
        }
        else
        {
            hiddingAnimation()
        }
    }

    function startAnimation()
    {
        clipingAnimation.start()
    }

    function hiddingAnimation()
    {
        hidingAnimation.start()
    }

    Item {
        id: clipingItem
        height: clippingRoot.verticalClipping ? 0 : clipedImage.height
        width: clippingRoot.horizontalClipping ? 0 : clipedImage.width
        property int horizontalOffset : clippingRoot.width - clipingItem.width
        property int verticalOffset: clippingRoot.height - clipingItem.height
        anchors.left: clippingRoot.left
        anchors.leftMargin: clippingRoot.horizontalDirection === ClipingItem.Right ? 0 : clipingItem.horizontalOffset
        anchors.top: clippingRoot.top
        anchors.topMargin: clippingRoot.verticalDirection === ClipingItem.Down ? 0 : clipingItem.verticalOffset
        clip: true
        Image {
            id: clipedImage
            anchors.left: clipingItem.left
            anchors.leftMargin: clippingRoot.horizontalDirection === ClipingItem.Right ? 0 : -clipingItem.horizontalOffset
            anchors.top: clipingItem.top
            anchors.topMargin: clippingRoot.verticalDirection === ClipingItem.Down ? 0 : -clipingItem.verticalOffset
        }

        ParallelAnimation {
            id: clipingAnimation
            alwaysRunToEnd: true
            NumberAnimation {
                target: clipingItem
                property: "width"
                duration: clippingRoot.duration
                to: clipedImage.width
            }
            NumberAnimation {
                target: clipingItem
                property: "height"
                duration: clippingRoot.duration
                to: clipedImage.height
            }
        }
        ParallelAnimation {
            id: hidingAnimation
            alwaysRunToEnd: true
            NumberAnimation {
                target: clipingItem
                property: "width"
                duration: clippingRoot.duration
                to: clippingRoot.horizontalClipping ? 0 : clipedImage.width
            }
            NumberAnimation {
                target: clipingItem
                property: "height"
                duration: clippingRoot.duration
                to: clippingRoot.verticalClipping ? 0 : clipedImage.height
            }
        }
    }
}
