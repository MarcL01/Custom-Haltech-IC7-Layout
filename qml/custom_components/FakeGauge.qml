import QtQuick 2.9

Item {
    property string objectName: "HaltechBigNumericGauge"
    property int dataMapAddress: 0
    //property alias dataMapValue: textValue.text
    property real  dataMapValue: 0
    property string dataMapLabel: ""
    property string gaugeUnit: ""
    property real gaugeMinimumValue: 0
    property real gaugeMaximumValue: 100
    property real gaugeRedStartValue : gaugeMaximumValue
    property bool enableRedStart: false
    property real gaugeLowerRedStartValue: 0
    property bool enableLowerRedStart : false

    property real gaugeValueFactor: 1
}
