import QtQuick 2.9

Item {
    id: numberedScaleRoot
    width: 1300
    property int counter: 0
    readonly property int opacityAnimationDuration: 1000
    readonly property int listingAnimationDuration: 1000
    readonly property int elementsCount: 9
    property bool active: false

    property color pureRed: "#ee0051"
    property color white: "#ffffff"

    FontLoader {
        id: dinFont
        source: "../../styles/DINCondensed-Bold.ttf"
    }

    readonly property ListModel tachoElements: ListModel {
        id: tachoImagesModel

        ListElement {yPos: 138; xPos: 85 }
        ListElement {yPos: 78;  xPos: 200 }
        ListElement {yPos: 18;  xPos: 335 }
        ListElement {yPos: 8;   xPos: 487 }
        ListElement {yPos: 8;   xPos: 639 }
        ListElement {yPos: 8;   xPos: 791 }
        ListElement {yPos: 18;  xPos: 945 }
        ListElement {yPos: 78;  xPos: 1080 }
        ListElement {yPos: 138; xPos: 1195 }

    }
    Repeater {
        id: scale
        model: tachoElements
        Text {
            id: numberText
            text: index
            y: model.yPos
            x: model.xPos
            color: index>=6 ? numberedScaleRoot.pureRed : numberedScaleRoot.white
            opacity: index>=counter ? 0.0 : 1.0
            font.pixelSize: 29
            font.family: dinFont.name
            horizontalAlignment: Text.AlignHCenter

            Behavior on opacity {
                NumberAnimation{
                    duration: numberedScaleRoot.opacityAnimationDuration
                }
            }
        }
    }

    onActiveChanged:
    {
        if(active)
        {
            numberedScaleRoot.opacity = 1
            startAnimation()
        }
        else
        {
            hiddingAnimation()
        }
    }

    function startAnimation()
    {
        showAnimation.start()
    }

    function hiddingAnimation()
    {
        hideAnimation.start()
    }

    NumberAnimation {
        id: showAnimation
        target: numberedScaleRoot
        property: "counter"
        from: 0
        to: numberedScaleRoot.elementsCount
        duration: numberedScaleRoot.listingAnimationDuration
    }

    SequentialAnimation {
        id: hideAnimation
        NumberAnimation { target: numberedScaleRoot; property: "opacity"; duration: 500; to: 0 }
        ScriptAction { script: { numberedScaleRoot.counter = 0 } }
    }
}
