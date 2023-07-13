import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import "../../styles"
import "../user_components"
import "../factory_components"

Item {
    objectName: "SelectionRectangle"
    x: 0
    y: 0
    width: 800
    height: 460

	Rectangle{
		id: selectionRect
		height: 70
		width: 140
		x: 100
		y: 400
		z: 10
		color: "transparent"
		border.color: "aqua"
		border.width: 3
		visible: true
	}	
}


