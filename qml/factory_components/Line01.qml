import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    x: 0
    y: 0
    width: 200
    height: 4

    Rectangle {
        anchors.fill: parent
        anchors.centerIn: parent
        color: "red"
        border.color:"#000000"
        border.width: 0
        radius: 0
//        rotation: 90
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#40483A" }
            GradientStop { position: 1.0; color: "#323640" }
        }

        PathView {
            anchors.fill: parent
            Path {

                startX: 0; startY: 100
                PathLine { x: 200; y: 100 }
            }
        }
    }


}
