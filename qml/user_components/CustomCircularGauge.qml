import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import "../../styles"

Item {
    objectName: "CustomCircularGauge"

    property alias objectName: gauge.objectName

    property int dataMapAddress: 0
    property alias dataMapValue: gauge.value

    property alias imageWidth: gaugeRect.width
    property alias imageHeight: gaugeRect.height
    property alias needleImageWidth: gauge.needleWidth
    property alias needleImageHeight: gauge.needleHeight
    property alias imageX: gaugeRect.x
    property alias imageY: gaugeRect.y
    property alias gaugeImage: gaugeImage
    property alias imageOpacity: gaugeImage.opacity
    property alias imageSource: gaugeImage.source

    property alias gaugeWidth: gauge.width
    property alias gaugeHeight: gauge.height
    property alias gaugeX: gauge.x
    property alias gaugeY: gauge.y
    property alias gaugeOpacity: gauge.opacity
//    property alias gaugeValue: gauge.value
    property alias gaugeMinimumValue: gauge.minimumValue
    property alias gaugeMaximumValue: gauge.maximumValue
    property alias gaugeStepSize: gauge.stepSize


    property real gaugeStyleLabelInsetRatioToOuterRadius
    property alias gaugeStyleMinimumValueAngle: gauge.minimumValueAngle
    property alias gaugeStyleMaximumValueAngle: gauge.maximumValueAngle
    property alias gaugeStyleTickmarkStepSize: gauge.tickmarkStepSize
    property alias gaugeStyleTickmark: gauge.tickmark
    property alias gaugeStyleMinorTickmark: gauge.minorTickmark
    property alias gaugeStyleTickmarkLabel: gauge.tickmarkLabel
    property alias gaugeStyleForeground: gauge.foreground
    property alias gaugeStyleNeedleSource: gauge.needleSource
    property alias gaugeStyleNeedleRotationOffsetY: gauge.needleRotationOffsetY // Centre of needle from base of needle image, in pixels
    property real gaugeStyleNeedleImplicitWidthRatioToOuterRadius
    property real gaugeStyleNeedleImplicitHeightRatioToOuterRadius

    Rectangle {
        id: gaugeRect
        color: "transparent"

        Image {
            id: gaugeImage
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
        }

        CircularGauge {
            id: gauge

            property real needleWidth: null
            property real needleHeight: null
            property real minimumValueAngle: null
            property real maximumValueAngle: null
            property real tickmarkStepSize: null
            property Component tickmark: null
            property Component minorTickmark: null
            property Component tickmarkLabel: null
            property Component foreground: null
            property string needleSource: null
            property real needleRotationOffsetY: null

            style: CircularGaugeStyle {
                id: gaugeStyle
                labelInset: outerRadius * gaugeStyleLabelInsetRatioToOuterRadius
                minimumValueAngle: gauge.minimumValueAngle
                maximumValueAngle: gauge.maximumValueAngle
                tickmarkStepSize: gauge.tickmarkStepSize
                tickmark: gauge.tickmark
                minorTickmark: gauge.minorTickmark
                tickmarkLabel: gauge.tickmarkLabel

                needle: Item {
                    implicitHeight: gauge.needleHeight
                    implicitWidth: gauge.needleWidth

                    Image {
                        y: gauge.needleRotationOffsetY
                        id: gaugeStyleNeedle
                        antialiasing: true
                        source: gauge.needleSource
                        sourceSize: Qt.size(gauge.needleWidth, gauge.needleHeight)
                    }
                }
                foreground: gauge.foreground
            }

            Behavior on value {
                NumberAnimation {
                    duration: 500
                }
            }
        }
    }
}

