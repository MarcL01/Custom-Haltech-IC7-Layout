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
	width: 860
	height: 480
    id: topLevelItem
    visible: true
    focus: true
	property int columnWidth: 105
    property int startX: 10
    property int startY: 35
    property int rowHeight: 55
	property int dmaOffset : 186

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
// Title
		Text {
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.top: parent.top
			anchors.topMargin: 10
			id: textLabel
			text: "PD16D Diagnostic Screen"
			color: "#ffffff"
			font.pixelSize: 18
			font.weight: Font.DemiBold
			visible : true
			z: 1
		}

//ROW 1
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_01
					x: startX
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_1_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A1_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "pink"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_02
					x: startX + columnWidth
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_1_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A1_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 30
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_03
					x: startX + (columnWidth*2)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_1_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A1_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_04
					x: startX + (columnWidth*3)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_1_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A1_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_05
					x: startX + (columnWidth*4)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_2_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A2_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "pink"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_06
					x: startX + (columnWidth*5)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_2_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A2_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_07
					x: startX + (columnWidth*6)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_2_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A2_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_08
					x: startX + (columnWidth*7)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_2_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A2_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
//ROW 2
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_09
					x: startX
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_3_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A3_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "pink"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_10
					x: startX + columnWidth
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_3_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A3_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_11
					x: startX + (columnWidth*2)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_3_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A3_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_12
					x: startX + (columnWidth*3)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_3_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A3_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_13
					x: startX + (columnWidth*4)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_4_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A4_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 25
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "pink"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_14
					x: startX + (columnWidth*5)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_4_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A4_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_15
					x: startX + (columnWidth*6)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_4_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A4_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_16
					x: startX + (columnWidth*7)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_25A_4_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "25A4_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
//ROW 3
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_17
					x: startX
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_1_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A1_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 2000
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_18
					x: startX + columnWidth
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_1_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A1_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 1000
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_19
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_1_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A1_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_20
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_1_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A1_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_21
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_2_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A2_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 250
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_22
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_2_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A2_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 250
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_23
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_2_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A2_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_24
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_2_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A2_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
				
//ROW 4
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_25
					x: startX
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_3_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A3_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_26
					x: startX + columnWidth
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_3_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A3_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_27
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_3_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A3_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_28
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_3_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A3_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_29
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_4_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A4_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_30
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_4_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A4_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_31
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_4_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A4_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_32
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_4_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A4_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}

//ROW 5
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_33
					x: startX
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_5_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A5_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 1000
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_34
					x: startX + columnWidth
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_5_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A5_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 1000
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_35
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_5_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A5_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_36
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_5_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A5_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_37
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_6_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A6_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 1000
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_38
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_6_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A6_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 1000
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_39
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_6_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A6_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_40
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_6_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A6_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
				
//ROW 6
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_41
					x: startX
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_7_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A7_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 200
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_42
					x: startX + columnWidth
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_7_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A7_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 120
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_43
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_7_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A7_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_44
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_7_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A7_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_45
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_8_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A8_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 250
					gaugeDecimalPlaces: 2		
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_46
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_8_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A8_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_47
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_8_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A8_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_48
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_8_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A8_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
				
//ROW 7
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_49
					x: startX
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_9_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A9_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_50
					x: startX + columnWidth
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_9_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A9_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 2			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_51
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_9_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A9_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_52
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_9_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A9_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_53
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_10_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A10_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 2		
					Rectangle {
							border.color: "aqua"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_54
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_10_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A10_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_55
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_10_LOAD
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A10_L"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_56
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_8A_10_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "8A10_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
				
//ROW 8
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_57
					x: startX
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_1_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO1_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2		
					Rectangle {
							border.color: "yellow"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_58
					x: startX + columnWidth
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_1_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO1_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 100
					gaugeDecimalPlaces: 2		
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_59
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_1_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO1_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_60
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_2_HC
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO2_HC"
					gaugeUnit: "A"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 25000
					gaugeDecimalPlaces: 2			
					Rectangle {
							border.color: "yellow"; 
							color: "transparent" 
							x: -2
							width: columnWidth * 4 - 4
							height: parent.height + 6
					 }
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_61
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_2_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO2_V"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 2		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_17_62
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: dmaOffset + DataMapAddress.PD16A_HBO_2_STATE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "HBO2_S"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -25
					unitY: 18
					gaugeValueColor: "white"
					gaugeValueFactor: 1
					labelColor: "white"
					valueX: 0
					valueY: 18
					labelX: 0
					labelY: 0
					labelFontSize: 20
					valueFontSize: 28
					unitFontSize: 20
					gaugeLabelItalic : false
					gaugeItalic : false
					gaugeMinimumValue: 0
					gaugeMaximumValue: 4
					gaugeDecimalPlaces: 0		
				}
	
	//Background Box
    Rectangle {
		color: "#000000"
        id: topLevelRectangle
        x: 0
        y: 0
		z: 0
        width: 860
        height: 480
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