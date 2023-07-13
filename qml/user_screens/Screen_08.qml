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
    property int startY: 20
    property int rowHeight: 50

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
//ROW 1
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_01
					x: startX
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "RPM"
					gaugeUnit: "RPM"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_02
					x: startX + columnWidth
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.MANIFOLD_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "MAP"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -15
					gaugeMaximumValue: 30
					gaugeDecimalPlaces: 1			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_03
					x: startX + (columnWidth*2)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.THROTTLE_POSITION
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "TPS"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_04
					x: startX + (columnWidth*3)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.COOLANT_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Coolant P"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_05
					x: startX + (columnWidth*4)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Fuel P"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_06
					x: startX + (columnWidth*5)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.OIL_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Oil P"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_07
					x: startX + (columnWidth*6)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.ENGINE_DEMAND
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EngDemand"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_08
					x: startX + (columnWidth*7)
					y: startY
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WASTEGATE_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Wastegate"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
//ROW 2
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_09
					x: startX
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.INJECTION_STAGE_1_DUTY_CYCLE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "InjS1Duty"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_10
					x: startX + columnWidth
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.INJECTION_STAGE_2_DUTY_CYCLE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "InjS2Duty"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_11
					x: startX + (columnWidth*2)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.IGNITION_ANGLE_BANK_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ign Angle"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_12
					x: startX + (columnWidth*3)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WIDEBAND_SENSOR_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "WBO2 1"
					gaugeUnit: "afr"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: 10
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_13
					x: startX + (columnWidth*4)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WIDEBAND_SENSOR_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "WBO2 2"
					gaugeUnit: "afr"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: 10
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_14
					x: startX + (columnWidth*5)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TRIGGER_SYSTEM_ERROR_COUNT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trig Errors"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_15
					x: startX + (columnWidth*6)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TRIGGER_COUNTER
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trig Count"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_16
					x: startX + (columnWidth*7)
					y: startY + rowHeight
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TRIGGER_SYNC_LEVEL
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trig Sync"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 9999
					gaugeDecimalPlaces: 0			
				}
//ROW 3
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_17
					x: startX
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.BRAKE_PRESSURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Brake"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_18
					x: startX + columnWidth
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.NOS_PRESSURE_SENSOR_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "NOS"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_19
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TURBO_SPEED_SENSOR_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Turbo"
					gaugeUnit: "rpm"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 250000
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_20
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WHEEL_SPEED_FRONT_LEFT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Wheel FL"
					gaugeUnit: "kmh"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_21
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WHEEL_SPEED_FRONT_RIGHT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Wheel FR"
					gaugeUnit: "kmh"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_22
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WHEEL_SPEED_REAR_LEFT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Wheel RL"
					gaugeUnit: "kmh"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_23
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.WHEEL_SPEED_REAR_RIGHT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Wheel RR"
					gaugeUnit: "kmh"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_24
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*2)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.VEHICLE_SPEED
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Veh Speed"
					gaugeUnit: "kmh"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
				
//ROW 4
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_25
					x: startX
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.BOOST_CONTROL_OUTPUT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Boost Out"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_26
					x: startX + columnWidth
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.ENGINE_LIMITING_ACTIVE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Eng Limiter"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_27
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.GEAR
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Gear"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -1
					gaugeMaximumValue: 10
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_28
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.INTAKE_CAM_ANGLE_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "In Cam 1"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_29
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.INTAKE_CAM_ANGLE_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "In Cam 2"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_30
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EXHAUST_CAM_ANGLE_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ex Cam 1"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_31
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EXHAUST_CAM_ANGLE_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ex Cam 2"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_32
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*3)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.RACE_TIMER
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Race Time"
					gaugeUnit: "s"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 99999
					gaugeDecimalPlaces: 1			
				}

//ROW 5
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_33
					x: startX
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 1"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_34
					x: startX + columnWidth
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 2"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_35
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_3
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 3"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_36
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_4
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 4"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_37
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_5
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 5"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_38
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_6
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 6"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_39
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_7
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 7"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_40
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*4)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.EGT_SENSOR_8
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "EGT 8"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
				
//ROW 6
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_41
					x: startX
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.COOLANT_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Coolant T"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_42
					x: startX + columnWidth
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.AIR_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Air T"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_43
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Fuel T"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 150
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_44
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.OIL_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Oil T"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_45
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.GEARBOX_OIL_TEMPERATURE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trans T"
					gaugeUnit: "C"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_46
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_COMPOSITION
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ethanol"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_47
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TRANSIENT_THROTTLE_ACTIVE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Throt Pump"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_48
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*5)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.DECEL_CUT_ACTIVE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Decel Cut"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0			
				}
				
//ROW 7
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_49
					x: startX
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_LEVEL
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Fuel L"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_50
					x: startX + columnWidth
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_TRIM_SHORT_TERM_BANK_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "STFT B1"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_51
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_TRIM_SHORT_TERM_BANK_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "STFT B2"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_52
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_TRIM_LONG_TERM_BANK_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "LTFT B1"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_53
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_TRIM_LONG_TERM_BANK_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "LTFT B2"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -50
					gaugeMaximumValue: 50
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_54
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.BRAKE_PEDAL_SWITCH
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Brake Sw"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_55
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.CLUTCH_SWITCH
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Clutch Sw"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_56
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*6)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.IGNITION_SWITCH
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ign Sw"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0			
				}
				
//ROW 8
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_57
					x: startX
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.CHECK_ENGINE_LIGHT
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "CEL"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_58
					x: startX + columnWidth
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.BATTERY_LIGHT_ACTIVE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Batt Light"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0		
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_59
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.STEERING_WHEEL_ANGLE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Steer"
					gaugeUnit: "deg"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -360
					gaugeMaximumValue: 360
					gaugeDecimalPlaces: 0	
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_60
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.DRIVESHAFT_RPM
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Driveshaft"
					gaugeUnit: "rpm"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_61
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.I2C_BATTERY
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Dash Batt"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: 10
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 1		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_62
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.BATTERY_VOLTAGE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Ecu Batt"
					gaugeUnit: "V"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: 10
					gaugeMaximumValue: 20
					gaugeDecimalPlaces: 1			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_63
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FUEL_FLOW
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Fuel Flow"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeDecimalPlaces: 1	
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_64
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*7)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TARGET_BOOST_LEVEL
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Boost Aim"
					gaugeUnit: "psi"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 150
					gaugeDecimalPlaces: 1			
				}
				
//ROW 9
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_65
					x: startX
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.DASH_BRIGHTNESS
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Brightness"
					gaugeUnit: "%"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					id: screen_08_66
					x: startX + columnWidth
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.AMBIENT_LIGHT_VALUE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Light Sensor"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 10000
					gaugeDecimalPlaces: 0		
				}	
				
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_67
					x: startX + (columnWidth*2)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.FLAT_SHIFT_SWITCH
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Flat Shift"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0	
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_68
					x: startX + (columnWidth*3)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TORQUE_REDUCTION_ACTIVE
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trq Reduc"
					gaugeUnit: ""
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 1
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_69
					x: startX + (columnWidth*4)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.ROTARY_TRIM_POT_1
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Pot 1"
					gaugeUnit: "pos"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -15
					gaugeMaximumValue: 15
					gaugeDecimalPlaces: 0		
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_70
					x: startX + (columnWidth*5)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.ROTARY_TRIM_POT_2
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Pot 2"
					gaugeUnit: "pos"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -15
					gaugeMaximumValue: 15
					gaugeDecimalPlaces: 0			
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_71
					x: startX + (columnWidth*6)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.ROTARY_TRIM_POT_3
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Pot 3"
					gaugeUnit: "pos"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMinimumValue: -15
					gaugeMaximumValue: 15
					gaugeDecimalPlaces: 0	
				}
	HaltechBigNumericGauge {
					z: 1
					id: screen_08_72
					x: startX + (columnWidth*7)
					y: startY + (rowHeight*8)
					width: columnWidth
					height: 40			
					dataMapAddress: DataMapAddress.TORQUE_MANAGEMENT_KNOB
					dataMapValue: (gaugeMinimumValue + (gaugeMaximumValue - gaugeMinimumValue ) * topLevelItem.randVal1)
					dataMapLabel: "Trq Mn Pot"
					gaugeUnit: "pos"
					alignment: TextInput.AlignLeft
					valignment: TextInput.AlignLeft
					ualignment: TextInput.AlignRight
					unitColor: "silver"
					unitX: -5
					unitY: 0
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
					gaugeMaximumValue: 15
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