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

// Dial center is 500x 280y

Item {
	transformOrigin: Item.Center
	//rotation: 180
	width: 860
	height: 480
    id: topLevelItem
    //anchors.fill: parent
    visible: true
    focus: true
	
	property bool dayTime: true
	property color dayGaugeBackgroundColor : "#63aade"
	property color nightGaugeBackgroundColor : "#63aade"	
	property int sweeperRotation: -90
	property int sweeperMaxRotation: -50
	property int sweeperMinRotation: -180
	property color mainColor : (dayTime)? dayGaugeBackgroundColor : nightGaugeBackgroundColor

    signal upKeyPressed()
    signal downKeyPressed()
	property real randVal1 : 0
	
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
	Image {
            id: overlaySurround
            smooth: true
            x: 0
            y: 0
			z: 5
            opacity: 1.0
            source: "../../images/IQC7bg.png"
			}
			
	//TellTales
	HaltechTellTaleLight {
			id: parkLights
			x: 0
			y: 0
			dataMapAddress: DataMapAddress.PARK_LIGHTS
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeX: "1"
			gaugeY: "1"
	  }				
	HaltechTellTaleLight {
			id: leftIndicator
			x: 70
			y: -5
			z: 5
			dataMapAddress: DataMapAddress.LEFT_INDICATOR
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/left.png"
			gaugeOnColor: "#06cf00"
			gaugeOffColor: "#012100"
			gaugeX: "80"
			gaugeY: "80"
			}
	HaltechTellTaleLight {
			id: rightIndicator
			x: 702
			y: -5
			z: 5
			dataMapAddress: DataMapAddress.RIGHT_INDICATOR
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/right.png"
			gaugeOnColor: "#06cf00"
			gaugeOffColor: "#012100"
			gaugeX: "80"
			gaugeY: "80"
			}
	HaltechTellTaleLight {
			id: parkIndicator
			x: 775
			y: 40
			z: 5
			dataMapAddress: DataMapAddress.HAND_BRAKE
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/ebrake.png"
			gaugeOnColor: "#ff0000"
			gaugeOffColor: "#320000"
			gaugeX: "60"
			gaugeY: "60"
			}
	HaltechTellTaleLight {
			id: hibeamIndicator
			x: 20
			y: 40
			z: 5
			dataMapAddress: DataMapAddress.HIGH_BEAM
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/hibeam.png"
			gaugeOnColor: "#0036ff"
			gaugeOffColor: "#000d21"
			gaugeX: "60"
			gaugeY: "60"
			}
	HaltechTellTaleLight {
			id: celIndicator
			x: 605
			y: 70
			z: 5
			dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/cel.png"
			gaugeOnColor: "#FF0000"
			gaugeOffColor: "#33000000"
			gaugeX: "60"
			gaugeY: "60"
			}
	HaltechTellTaleLight {
			id: oilIndicator
			x: 670
			y: 100
			z: 5
			dataMapAddress: DataMapAddress.OIL_PRESSURE_LIGHT
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/oil.png"
			gaugeOnColor: "#FF0000"
			gaugeOffColor: "#33000000"
			gaugeX: "60"
			gaugeY: "60"
			}
	HaltechTellTaleLight {
			id: battIndicator
			x: 720
			y: 135
			z: 5
			dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
			dataMapValue: Math.round(topLevelItem.randVal1)
			gaugeImage: "../../images/batt.png"
			gaugeOnColor: "#FF0000"
			gaugeOffColor: "#33000000"
			gaugeX: "60"
			gaugeY: "60"
			}
			
	//Channels		
	Item {
		id: bottomRowOne
		x: 40
		y: 340
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_01
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */

					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -30
					labelFontSize: 25
					valueFontSize: 60
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_01,"screen_06_01");
					}			
				}	
	}
	
	Item {
		id: bottomRowTwo
		x: 300
		y: 340
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_02
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -30
					labelFontSize: 25
					valueFontSize: 60
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_02,"screen_06_02");
					}			
				}	
	}
	
	Item {
		id: bottomRowThree
		x: 560
		y: 340
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_03
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */

					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -30
					labelFontSize: 25
					valueFontSize: 60
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_03,"screen_06_03");
					}			
				}	
	}
	
	Item {
		id: topRowOne
		x: 150
		y: 230
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_04
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -30
					labelFontSize: 20
					valueFontSize: 45
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_04,"screen_06_04");
					}			
				}	
	}
	
	Item {
		id: topRowTwo
		x: 350
		y: 100
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_05
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.GEAR
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "GEAR"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 100
					labelY: 160
					labelFontSize: 0
					valueFontSize: 125
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 6
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_05,"screen_06_05");
					}			
				}	
	}
	
	Item {
		id: topRowThree
		x: 525
		y: 190
		opacity: 1.0
		z: 4
		HaltechBigDigitalGauge {
					//anchors.top: parent.bottom
					id: screen_06_06
					x: 0
					y: 0
					width: 240
					height: 120			
					/* Start Color Pallet */
				    property color dayDValueColor : "black"
					property color nightDValueColor : "white"
					property color dayUnitColor : "silver"
					property color nightUnitColor : "silver"				
					property color dayLabelColor : "black"
					property color nightLabelColor : "white"
					property color dayValueRedColor : "red"
					property color nightValueRedColor : "red"
					
					gaugeValueColor: (topLevelItem.dayTime) ? dayDValueColor : nightDValueColor
					gaugeValueRedColor: (topLevelItem.dayTime) ? dayValueRedColor : nightValueRedColor					
					labelColor: (topLevelItem.dayTime) ? dayLabelColor : nightLabelColor
					unitColor: (topLevelItem.dayTime) ? dayUnitColor : nightUnitColor
					/* End Color Pallet */
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					gaugeUnit: ""
					gaugeValueFactor: 1
					valueX: 0
					valueY: 0
					labelX: 0
					labelY: -30
					labelFontSize: 30
					valueFontSize: 70
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 9999
					//gaugeDecimalPlaces: 0
					Component.onCompleted:
					{
						GaugeConfig.initGauge(screen_06_06,"screen_06_06");
					}			
				}	
	}
	
	
		
	
	//Dash Main Background
    Item {
		Rectangle {
		color: mainColor
        id: topLevelRectangle
        x: 0
        y: 0
		z: 3
        width: 860
        height: 480
		visible: false
		}
		Image {
			id: gaugeMask
			smooth: true
			x: 50
			y: 0
			width: 860
			height: 480
			source: "../../images/IQC7mask.png"
			visible: false
			}
		OpacityMask {
			anchors.fill: topLevelRectangle
			source: topLevelRectangle
			maskSource: gaugeMask
			invert: true
			}
		}
	// Sweeper
	Item {
		id: sweepContainer
		width: 860
		height: 480
		x: 0
		y: 0
		z: -1
		GaugeSweeper {
			id: screen_06_07
			dataMapAddress: DataMapAddress.RPM
			gaugeMinimumValue: 0
			gaugeMaximumValue: 4000
			dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
			Component.onCompleted:
			{
				GaugeConfig.initGauge(screen_06_07,"screen_06_07");
			}
		}
	}

	Rectangle {
		color: mainColor
        id: backgColor
        x: 0
        y: 0
		z: -3
        width: 860
        height: 480
		}
		Image {
			id: bg2
			width: 860
			height: 480
			smooth: true
			x: 0
			y: 0
			opacity: 0.05
			source: "../../images/DigitalBG2.png"
			}
	
	}
		
		