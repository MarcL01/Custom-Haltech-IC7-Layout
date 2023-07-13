import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import "../../styles"
import "../user_components"

Item {
    id: topLevelItem
    anchors.fill: parent
    visible: true
    focus: true

    signal upKeyPressed()
    signal downKeyPressed()

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            topLevelItem.upKeyPressed();
        } else if (event.key === Qt.Key_Down) {
            topLevelItem.downKeyPressed();
        }
    }

    Rectangle {
        anchors.fill: parent
        anchors.centerIn: parent
        color: "#000000"
        border.color:"#ffc33e"
        border.width: 0
        radius: 0

        Image {
            id: logoImage
            objectName: "logoImage"
            anchors.centerIn: parent
            source: "../../images/ied-logo_800x300.png"
        }
    }
}

