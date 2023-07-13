import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import "../../styles"

Item {
		objectName: "GaugeSweeper"
		property alias objectName: textValue.objectName
		property int dataMapAddress: 1
		property real dataMapValue: 0
		property real gaugeMinimumValue: 0
		property real gaugeMaximumValue: 4000
		Image {
			id: textValue
			smooth: true
			x: -120
			y: -50
			z: -1
			width: 961
			height: 345
			source: "../../images/IQC7sweeper.png"
			transformOrigin: Item.Bottom
			rotation: 180 - dataMapValue * (-140/gaugeMaximumValue)
			}
		Rectangle {
			color: "#33000000"
			id: bottomLevelRectangle
			x: 0
			y: 0
			z: -1
			width: 860
			height: 480
			visible: false
			}
		Image {
			id: gaugeMask2
			smooth: true
			x: 50
			y: 0
			z: -1
			width: 860
			height: 480
			source: "../../images/IQC7mask.png"
			visible: false
			}
		OpacityMask {
			anchors.fill: bottomLevelRectangle
			source: bottomLevelRectangle
			maskSource: gaugeMask2
			invert: false
			}
	}
