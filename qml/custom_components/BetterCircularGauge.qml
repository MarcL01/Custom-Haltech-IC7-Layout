import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"
import "../user_components"

Item {
    id: root
    objectName: "HaltechNewCircularGaugeRetro"
    width: gaugeRect.width
    height: gaugeRect.height
    property alias objectName: gauge.objectName

    property int dataMapAddress: 0
    property real  dataMapValue: 0
    property string gaugeUnit: ""

    property alias imageWidth: gaugeRect.width
    property alias imageHeight: gaugeRect.height
    property alias needleImageWidth: gauge.needleWidth
    property alias needleImageHeight: gauge.needleHeight
    property alias imageX: gaugeRect.x
    property alias imageY: gaugeRect.y
    property alias gaugeImage: gaugeImage
    property alias imageOpacity: gaugeImage.opacity
    property alias imageSource: gaugeImage.source

    property alias dataMapLabel: textLabel.text
    property int labelX
    property alias labelY: textLabel.y
    property int labelFontSize: 18

    property alias gaugeWidth: gauge.width
    property alias gaugeHeight: gauge.height
    property alias gaugeX: gauge.x
    property alias gaugeY: gauge.y
    property alias gaugeOpacity: gauge.opacity
    property alias gaugeMinimumValue: gauge.minimumValue
    property alias gaugeMaximumValue: gauge.maximumValue
    property alias gaugeStepSize: gauge.stepSize


    property real gaugeStyleLabelInsetRatioToOuterRadius
    property real gaugeStyleMinimumValueAngle: -60
    property real gaugeStyleMaximumValueAngle: 60
    property alias gaugeStyleTickmarkStepSize: gauge.tickmarkStepSize
    property alias gaugeStyleTickmark: gauge.tickmark
    property alias gaugeStyleMinorTickmark: gauge.minorTickmark
    property alias gaugeStyleTickmarkLabel: gauge.tickmarkLabel
    property alias gaugeForeground: gauge.foreground
    property bool gaugeHideNeedle: false
    property alias gaugeStyleNeedleSource: gauge.needleSource
    property alias gaugeStyleNeedleRotationOffsetY: gauge.needleRotationOffsetY // Centre of needle from base of needle image, in pixels
    property real gaugeStyleNeedleImplicitWidthRatioToOuterRadius
    property real gaugeStyleNeedleImplicitHeightRatioToOuterRadius
    property alias gaugeLabelStepSize : gauge.gaugeLabelStepSize
    property alias gaugeGradientColor: gauge.gradientColor
    property alias gaugeDayTime : gauge.dayTime
    property alias gaugeRedStartValue : gauge.redStartValue
    property alias gaugeRedEndValue : gauge.redEndValue
    property bool enableRedStart: false
    property alias gaugeLowerRedStartValue: gauge.lowerRedStartValue
    property bool enableLowerRedStart : false
    property alias gaugeRedThickness : gauge.redThickness
    property alias gaugeRedColor : gauge.redColor
    property alias gaugeMinorTickmarkCount : gauge.minorTickmarkCount
    property alias gaugeValueFactor : gauge.valueFactor
    property alias gaugeFontRatio : gauge.fontRatio
    property alias gaugeLabelFontRatio : gauge.labelFontRatio
    property alias gaugeTopMarginRatio : gauge.topMarginRatio
    property alias gaugeTickMarksVisible : gauge.tickmarksVisible
    property alias gaugeCircleVisible : gauge.circleVisible
    property alias gaugeTickmarkInsetRatio : gauge.tickmarkInsetRatio
    property alias gaugeMinorTickmarkInsetRatio : gauge.minorTickmarkInsetRatio
    property color gaugeMajorTickmarkColor : "black"
    property color gaugeMinorTickmarkColor: "black"
    property color gaugeTickmarkLabelColor : "black"
    property color gaugeTickmarkRedLabelColor: "white"
    property color gaugeFaceColor : "#000000"
    property color darkColor : "#776800"
    property color gaugeNeedleColor : "#b94a00"
    property color backgroundColor : mainColor
    property bool upsideDown : false

    FontLoader {
        id: dinFont
        source: "../../styles/DINCondensed-Bold.ttf"
    }
    FontLoader {
        id: caviar
        source: "../../styles/CaviarDreams-Bold.ttf"
    }

    Rectangle {
        id: gaugeRect
        color: backgroundColor
        radius: width / 2
        Image {
            id: gaugeImage
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            layer.enabled: true
            layer.effect: DropShadow {
            verticalOffset: 2
            horizontalOffset: 2
            color: "#FF000000"
            radius: 8
            samples: 8
            cached: true
            }
        }

        CircularGauge {
            id: gauge
            anchors.horizontalCenter: parent.horizontalCenter
            z: 2
            property real needleWidth: 0
            property real needleHeight: 0
            property real minimumValueAngle: upsideDown ? gaugeStyleMaximumValueAngle : gaugeStyleMinimumValueAngle
            property real maximumValueAngle: upsideDown ? gaugeStyleMinimumValueAngle : gaugeStyleMaximumValueAngle
            property Component tickmark: Rectangle
            {
              width: outerRadius * 0.01
              height: outerRadius * 0.05
              color: gaugeMinorTickmarkColor
              anchors.bottom: parent.top
              anchors.bottomMargin : outerRadius * -0.03
             }
            property Component minorTickmark: Rectangle{
                    y: outerRadius * 0.02
                    implicitWidth: outerRadius * 0.01
                    implicitHeight: outerRadius * 0.02
                    antialiasing: true
                    color: gaugeMinorTickmarkColor
            }
            property real valueFactor : 1
            property real fontRatio : 0.3
            property real labelFontRatio : 0.1
            property real topMarginRatio : 0.3
            property bool circleVisible : true
            property real tickmarkInsetRatio : 0.01
            property real minorTickmarkInsetRatio : 0.01
            property Component tickmarkLabel: null;
            property Component foreground: null
            property Component needleSource: null
            property real needleRotationOffsetY: 0
            property real gaugeLabelStepSize : 10
            property real tickmarkStepSize: 1
            property color gradientColor: "#ff2200"
            property color backgroundColor : "#FF0000"
            property real redStartValue : maximumValue
            property real redEndValue : maximumValue
            property real lowerRedStartValue: minimumValue
            property real redThickness : 0.1
            property color redColor : "red"
            property int minorTickmarkCount : 9
            property bool dayTime : true
            property Canvas styleCanvas : null
            onDayTimeChanged:{
                if (styleCanvas != null) {
                    styleCanvas.requestPaint();
                }
            }
            value : (dataMapValue / valueFactor)
            style: BetterCircularGaugeStyle {
                upsideDown: root.upsideDown
            }

            transform: Rotation {
                angle: root.upsideDown ? 180 : 0
                origin.x: gauge.width / 2
                origin.y: gauge.height / 2
            }
        }



         Text {
            anchors.horizontalCenter: gauge.horizontalCenter
            anchors.top: gauge.top
            anchors.topMargin: gauge.height / 2 + labelX
            id: textLabel
            color: gaugeTickmarkLabelColor
            font.family: caviar.name
            font.pixelSize: labelFontSize
            property color bgColor: "#00000000"
            property color borderColor: "#4286f4"
            property int borderRadius: 0
            property int borderWidth: 0
            horizontalAlignment: TextInput.AlignHCenter
            visible: true
            z: 1
        }
    }
}
