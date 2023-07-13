import QtQuick 2.9
import QtGraphicalEffects 1.0

Row {
    id: tachoRoot
    layoutDirection: Qt.RightToLeft
    anchors.horizontalCenter: parent.horizontalCenter

    property color pureRed: "#ee0051"
    property color white: "#ffffff"

    property int rpm: 10000
    property int rpmAnimationTime: 1000
    Behavior on rpm { NumberAnimation { duration: rpmAnimationTime } }

    readonly property int changeOpacityAnimationDuration: 250
    spacing: -43

    readonly property ListModel tachoElements: ListModel {
        id: tachoImagesModel
        ListElement {
            yPos: 95
            img: "../../images/tacho1.png";
        }
        ListElement {
            yPos: 66
            img: "../../images/tacho2.png";
        }
        ListElement {
            yPos: 37
            img: "../../images/tacho3.png";
        }
        ListElement {
            yPos: 13
            img: "../../images/tacho4.png";
        }
        ListElement {
            yPos: 2
            img: "../../images/tacho5.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 0
            img: "../../images/tacho6.png";
        }
        ListElement {
            yPos: 2
            img: "../../images/tacho5.png";
        }
        ListElement {
            yPos: 13
            img: "../../images/tacho4.png";
        }
        ListElement {
            yPos: 37
            img: "../../images/tacho3.png";
        }
        ListElement {
            yPos: 66
            img: "../../images/tacho2.png";
        }
        ListElement {
            yPos: 95
            img: "../../images/tacho1.png";
        }
    }

    Repeater {
        id: tachoImages
        model: tachoElements

        Item {
            id: imgRoot
            y: model.yPos
            implicitHeight: img.height
            implicitWidth: img.width

            opacity: (tachoElements.count - index) * 500 <= tachoRoot.rpm ? 1 : 0
            Behavior on opacity {
                NumberAnimation{
                    duration: changeOpacityAnimationDuration
                }
            }

            transform: Scale {
                xScale: index<5 ? -1 : 1
                origin.x: img.implicitWidth / 2
                origin.y: img.implicitHeight / 2
            }

            Image {
                id: img
                source: model.img
                visible: false
            }

            Rectangle {
                id: overlayThing
                width: img.implicitWidth
                height: img.implicitHeight
                color: index<=3 ? tachoRoot.pureRed : tachoRoot.white
                visible: false
            }

            OpacityMask {
                anchors.fill: overlayThing
                source: overlayThing
                maskSource: img
                invert: false
            }
        }

    }
}
