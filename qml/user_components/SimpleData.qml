import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
    objectName: "SimpleData"
    x: 0
    y: 0
    width: 180
    height: 35
    property int textSize: 64
    property int dataMapAddress: 0
    property real dataMapValue: 0

    Text {
        id: textField
		text: displayText
		readonly property string displayText: Math.round(dataMapValue)
    }
}
