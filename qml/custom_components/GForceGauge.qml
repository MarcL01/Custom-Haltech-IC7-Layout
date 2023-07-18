import QtQuick 2.9

Item {

    property FakeGauge lateralGForce: lateralGForce
    property FakeGauge longitudinalGForce: longitudinalGForce
    property real gaugeDiameter: 220

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
            anchors.horizontalCenterOffset: ((lateralGForce.dataMapValue/lateralGForce.gaugeMaximumValue) * (gaugeDiameter/2))
            anchors.verticalCenterOffset: ((longitudinalGForce.dataMapValue/longitudinalGForce.gaugeMaximumValue) * (gaugeDiameter/2))
            width: 20
            height: 20
            radius: width * .5
            color: "red"
        }



    }
}
