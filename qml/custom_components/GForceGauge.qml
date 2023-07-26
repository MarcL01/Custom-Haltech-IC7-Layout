import QtQuick 2.9

Item {

    property FakeGauge lateralGForce: lateralGForce
    property FakeGauge longitudinalGForce: longitudinalGForce
    property real gaugeDiameter: 220

    function getHorizontalPos() {
        var pointX = ((lateralGForce.dataMapValue/lateralGForce.gaugeMaximumValue) * (gaugeDiameter/2))
        var pointY = ((longitudinalGForce.dataMapValue/longitudinalGForce.gaugeMaximumValue) * (gaugeDiameter/2))

        var edgeX = 0 + (gaugeDiameter/2) * (pointX / Math.sqrt(Math.pow(pointX , 2) + Math.pow(pointY, 2)))
        if (pointX === 0) {
            return 0
        } else if (pointX < 0) {
            if (edgeX > pointX) {
                return edgeX
            } else {
                return pointX
            }
        } else {
            if (edgeX < pointX) {
                return edgeX
            } else {
                return pointX
            }
        }
    }

    function getVerticalPos() {
        var pointX = ((lateralGForce.dataMapValue/lateralGForce.gaugeMaximumValue) * (gaugeDiameter/2))
        var pointY = ((longitudinalGForce.dataMapValue/longitudinalGForce.gaugeMaximumValue) * (gaugeDiameter/2))

        var edgeY = 0 + (gaugeDiameter/2) * (pointY / Math.sqrt(Math.pow(pointX , 2) + Math.pow(pointY, 2)))
        if (pointY === 0) {
            return 0
        } else if (pointY < 0) {
            if (edgeY > pointY) {
                return edgeY
            } else {
                return pointY
            }
        } else {
            if (edgeY < pointY) {
                return edgeY
            } else {
                return pointY
            }
        }
    }

    Rectangle {
        id: gaugeRect
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 2.5
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(255, 255, 255, .12) }
//                        GradientStop { position: 0.33; color: "yellow" }
            GradientStop { position: 1; color: Qt.rgba(255, 255, 255, .001) }
        }

        height: 230
        width: 350

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"
            width: gaugeDiameter
            height: gaugeDiameter
            radius: width * .5
            border.color: "#b1a9aa"
            border.width: 30
        }


        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 150
            height: 150
            radius: width * .5
            color: "transparent"
            border.color: "#75716e"
            border.width: 35
        }

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: 70
            height: 70
            radius: width * .5
            color: "#4c4e4e"
        }


        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenterOffset: ((lateralGForce.dataMapValue/lateralGForce.gaugeMaximumValue) * (gaugeDiameter/2))
//            anchors.verticalCenterOffset: ((longitudinalGForce.dataMapValue/longitudinalGForce.gaugeMaximumValue) * (gaugeDiameter/2))
            anchors.horizontalCenterOffset: getHorizontalPos()
            anchors.verticalCenterOffset: getVerticalPos()
            width: 20
            height: 20
            radius: width * .5
            color: "red"
        }



    }
}
