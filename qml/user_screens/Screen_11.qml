import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import Qt3D.Core 2.0
import Qt3D.Render 2.0

import "../../styles"
import "../user_components"
import "../factory_components"
import DataMapAddressEnums 1.0
//import "DataMapEnums.js" as DataMapAddress 
import "GaugeConfig.js" as GaugeConfig

Item {
	FontLoader { id: dinFont; source: "../../styles/DINCondensed-Bold.ttf" }	
	transformOrigin: Item.Center
	//rotation: 180

	width: 860
	height: 480
    id: topLevelItem
    //anchors.fill: parent
    visible: true
    focus: true
	property bool dayTime: true
	property color dayGaugeBackgroundColor : "#fcfcfc"
	property color nightGaugeBackgroundColor : "#fcfcfc"	
	property int sweeperRotation: -90
	property int sweeperMaxRotation: -50
	property int sweeperMinRotation: -180
	property color mainColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor

    signal upKeyPressed()
    signal downKeyPressed()
	property real randVal1 : 0
	property int valueFontSize: 48

    Keys.onSpacePressed:
    {
       randVal1 = Math.random();
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
            topLevelItem.upKeyPressed();
        } else if (event.key === Qt.Key_Down) {
            topLevelItem.downKeyPressed();
        }
    }
	HaltechTellTaleLight {
			id: parkLights
			x: 0
			y: 0
			dataMapAddress: DataMapAddress.PARK_LIGHTS
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeX: "1"
			gaugeY: "1"
	  }								
	Item {
		id: floatingIndicators
		x: 0
		y: 0
		z: 10
		width: 860
		height: 80
		HaltechTellTaleLight {
					id: screen_11_28
					x: 20
					y: 200
					dataMapAddress: DataMapAddress.LEFT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/left.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"
				}
		HaltechTellTaleLight {
					id: screen_11_29
					x: 400
					y: 200
					dataMapAddress: DataMapAddress.RIGHT_INDICATOR
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/right.png"
					gaugeOnColor: "#00FF00"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"
				}
		HaltechTellTaleLight {
					id: screen_11_30
					x: 210
					y: 370
					dataMapAddress: DataMapAddress.HAND_BRAKE
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/ebrake.png"
					gaugeOnColor: "#FF0000"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"
				}
		HaltechTellTaleLight {
					id: screen_11_31
					x: 210
					y: 10
					dataMapAddress: DataMapAddress.HIGH_BEAM
					dataMapValue: Math.round(topLevelItem.randVal1)
					gaugeImage: "../../images/hibeam.png"
					gaugeOnColor: "#0000FF"
					gaugeOffColor: "#00000000"
					gaugeX: "80"
					gaugeY: "80"
				}
	}
	Item {
		id: tmsFLBox
		x: 10
		y: 30
		z: 3
		Rectangle {
			x: 0
			y: 0
			width: 174
			height: 160
			color: Qt.darker(mainColor,1.75);
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}	
		Text {
		x: 45
		y: 7
        id: tmsFLBoxLabel
        font: Qt.font({ family: dinFont.name, pixelSize: 24, weight: Font.Normal, italic: false })
        color: screen_11_12.labelColor
		text: "FRONT LEFT"
		}
			
	}
	
	Item {
		id: tmsFRBox
		x: 315
		y: 30
		z: 3
		Rectangle {
			x: 0
			y: 0
			width: 174
			height: 160
			color: Qt.darker(mainColor,1.75);
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Text {
		x: 40
		y: 7
        id: tmsFRBoxLabel
        font: Qt.font({ family: dinFont.name, pixelSize: 24, weight: Font.Normal, italic: false })
        color: screen_11_12.labelColor
		text: "FRONT RIGHT"
		}
			
	}
	
	Item {
		id: tmsRLBox
		x: 10
		y: 290
		z: 3
		Rectangle {
			x: 0
			y: 0
			width: 174
			height: 160
			color: Qt.darker(mainColor,1.75);
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}	
		Text {
		x: 45
		y: 7
        id: tmsRLBoxLabel
        font: Qt.font({ family: dinFont.name, pixelSize: 24, weight: Font.Normal, italic: false })
        color: screen_11_12.labelColor
		text: "REAR LEFT"
		}
			
	}
	
	Item {
		id: tmsRRBox
		x: 315
		y: 290
		z: 3
		Rectangle {
			x: 0
			y: 0
			width: 174
			height: 160
			color: Qt.darker(mainColor,1.75);
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Text {
		x: 47
		y: 7
        id: tmsRRBoxLabel
        font: Qt.font({ family: dinFont.name, pixelSize: 24, weight: Font.Normal, italic: false })
        color: screen_11_12.labelColor
		text: "REAR RIGHT"
		}
			
	}
		
	Item {
		id: tmsFL
		x: 20
		y: 60
		opacity: 1.0
		z: 4
		Rectangle {
			x: 0
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 0
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		HaltechBigNumericGauge {
					id: screen_11_12
					x: 6
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_12,"screen_11_12");
					}			
				}
		
		HaltechBigNumericGauge {
					id: screen_11_13
					x: 86
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_13,"screen_11_13");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_14
					x: 6
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_14,"screen_11_14");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_15
					x: 86
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_15,"screen_11_15");
					}			
				}
	}
	
	Item {
		id: tmsFR
		x: 325
		y: 60
		opacity: 1.0
		z: 4
		Rectangle {
			x: 0
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 0
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		HaltechBigNumericGauge {
					id: screen_11_16
					x: 6
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_16,"screen_11_16");
					}			
				}
		
		HaltechBigNumericGauge {
					id: screen_11_17
					x: 86
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_17,"screen_11_17");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_18
					x: 6
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_18,"screen_11_18");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_19
					x: 86
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_19,"screen_11_19");
					}			
				}
	}
	
	Item {
		id: tmsRL
		x: 20
		y: 320
		opacity: 1.0
		z: 4
		Rectangle {
			x: 0
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 0
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		HaltechBigNumericGauge {
					id: screen_11_20
					x: 6
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_20,"screen_11_20");
					}			
				}
		
		HaltechBigNumericGauge {
					id: screen_11_21
					x: 86
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_21,"screen_11_21");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_22
					x: 6
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_22,"screen_11_22");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_23
					x: 86
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_23,"screen_11_23");
					}			
				}
	}
	
	Item {
		id: tmsRR
		x: 325
		y: 320
		opacity: 1.0
		z: 4
		Rectangle {
			x: 0
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 0
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 0
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		Rectangle {
			x: 80
			y: 64
			width: 74
			height: 58
			color: Qt.darker(mainColor,1.25);
			z: 4
			border.color: "#FFCB31"
			border.width: 2
			radius: 5
		}
		HaltechBigNumericGauge {
					id: screen_11_24
					x: 6
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_24,"screen_11_24");
					}			
				}
		
		HaltechBigNumericGauge {
					id: screen_11_25
					x: 86
					y: 8
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_25,"screen_11_25");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_26
					x: 6
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_26,"screen_11_26");
					}			
				}
		HaltechBigNumericGauge {
					id: screen_11_27
					x: 86
					y: 72
					z: 5
					width: 60
					height: 30			
					/* Start Color Pallet */
				    property color dayValueColor : "silver"
					property color nightValueColor : "silver"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "silver"
					property color nightLabelColor : "silver"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 24
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 20
					labelX: 0
					labelY: 0
					labelFontSize: 22
					valueFontSize: 22
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_27,"screen_11_27");
					}			
				}
	}
	
	
	
	Item {
		id: firstRowOne
		x: 504
		y: 1
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					id: screen_11_02
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_02,"screen_11_02");
					}			
				}	
	}
	Item {
		id: firstRowTwo
		x: firstRowOne.x + 180
		y: firstRowOne.y
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_03
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_03,"screen_11_03");
					}			
				}	
	}
	
	Item {
		id: secondRowOne
		x: firstRowOne.x
		y: firstRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_04
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 1
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_04,"screen_11_04");
					}			
				}	
	}
	Item {
		id: secondRowTwo
		x: firstRowOne.x + 180
		y: firstRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_05
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_05,"screen_11_05");
					}			
				}	
	}
	
	Item {
		id: thirdRowOne
		x: firstRowOne.x
		y: secondRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_06
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_06,"screen_11_06");
					}			
				}	
	}
	Item {
		id: thirdRowTwo
		x: firstRowOne.x + 180
		y: secondRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_07
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_07,"screen_11_07");
					}			
				}	
	}
	
	Item {
		id: fourthRowOne
		x: firstRowOne.x
		y: thirdRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_08
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_08,"screen_11_08");
					}			
				}	
	}
	Item {
		id: fourthRowTwo
		x: firstRowOne.x + 180
		y: thirdRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_09
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_09,"screen_11_09");
					}			
				}	
	}
	Item {
		id: fifthRowOne
		x: firstRowOne.x
		y: fourthRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_10
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_10,"screen_11_10");
					}			
				}	
	}
	Item {
		id: fifthRowTwo
		x: firstRowOne.x + 180
		y: fourthRowOne.y + 96
		opacity: 1.0
		z: 4
		HaltechBigNumericGauge {
					//anchors.top: parent.bottom
					id: screen_11_11
					x: 0
					y: 0
					width: 173
					height: 96			
					/* Start Color Pallet */
				    property color dayValueColor : "black"
					property color nightValueColor : "black"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "black"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayValueColor : nightValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitX: 0
					unitY: 5
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 5
					labelX: 0
					labelY: 72
					labelFontSize: 22
					valueFontSize: 62
					unitFontSize: 22
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_11_11,"screen_11_11");
					}			
				}	
	}
	
	
	
	
	//Background Box
	Image {
		id: tmsCar
		x: 125
		y: 170
		source: "../../images/tmscar.png"
		z: 3
		rotation: 90
		height: 108
		width: 250
		}
    Rectangle {
		color: mainColor
        id: topLevelRectangle
        x: 0
        y: 0
		z: 0
        width: 860
        height: 480
		Image {
            id: bg
            height: 480
            width: 860
            smooth: true
            x: 0
            y: 0
			z: 2
            opacity: 1.0
            source: "../../images/tms4bg.png"
			}
		Rectangle {
			id: overlayBg
			width: bg.width
			height: bg.height
			x: bg.x
			y: bg.y
			color: mainColor
			visible: false
		}
		OpacityMask {
			anchors.fill: overlayBg
			source: overlayBg
			maskSource: bg
			invert: true
			opacity: 0.75
		}
		Image {
			id: bg2
			width: 860
			height: 480
			smooth: true
			x: 0
			y: 0
			z: 1
			opacity: 0.25
			source: "../../images/haltech_bg.png"
			}	
			
	}		
}