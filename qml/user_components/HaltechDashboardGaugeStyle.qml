
import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
  
CircularGaugeStyle {
    tickmarkInset: toPixels(gauge.tickmarkInsetRatio)  //The distance in pixels from the outside of the gauge (outerRadius) 
								//	at which the outermost point of the tickmark line is drawn  
	minorTickmarkInset: toPixels(gauge.minorTickmarkInsetRatio)
    labelInset: outerRadius * gaugeStyleLabelInsetRatioToOuterRadius  //  the value in pixels from outerRadius the marker text is drawn
    tickmarkStepSize: gauge.tickmarkStepSize  // The interval at which tickmarks are displayed.
	labelStepSize : gauge.labelStepSize  // // The interval at which tickmark labels are displayed.
	minorTickmarkCount : gauge.minorTickmarkCount  // How many minor tick marks between two major tickmarks
    minimumValueAngle: gauge.minimumValueAngle  // The start angle of the gauge markings top most is zero deg
    maximumValueAngle: gauge.maximumValueAngle	// End angle of the gauge markings		
    tickmark: gauge.tickmark
    minorTickmark: gauge.minorTickmark
	/*  Currently we are using the default
	tickmarkLabel: gauge.tickmarkLabel
	*/
    property real xCenter: outerRadius 
    property real yCenter: outerRadius 
    property real needleLength: toPixels(0.9)
    property real needleTipWidth: toPixels(0.02)
    property real needleBaseWidth: toPixels(0.06)
    property bool halfGauge: false
	property color gradientColor: "#ff2200"
	property color backgroundColor : "#000000"
	property real redStartValue : gauge.redStartValue
	property real redEndValue : gauge.redEndValue
	property real redThickness : gauge.redThickness
	property real valueFactor : gauge.valueFactor
	property real fontRatio : gauge.fontRatio
	property real labelFontRatio : gauge.labelFontRatio
	property real topMarginRatio : gauge.topMarginRatio
	property color redColor : "red" //"#e34c22"
	property color normalTextColor : "#ffc935"
	property bool circleVisible: gauge.circleVisible
	property int gaugeDecimalPlaces : 0

    function toPixels(percentage) {
        return percentage * outerRadius;
    }

    function degToRad(degrees) {
        return degrees * (Math.PI / 180);
    }

    function radToDeg(radians) {
        return radians * (180 / Math.PI);
    }
	function formatNumberLength(num, length) {
		return num.toFixed (gaugeDecimalPlaces);
	}
	function smartFormatNumberLength(num, length) {
		return num.toFixed (gaugeDecimalPlaces);
	}
	/*
    function valueToAngle(val) {
		return minimumValueAngle + ((maximumValueAngle - minimumValueAngle)/(gauge.maximumValue - gauge.minimumValue)) * (val - gauge.minimumValue);
	} */

/********************************************************
This function renders the red color area and gauge boundary
********************************************************/
    function paintBackground(ctx) {
		ctx.reset();
		//console.log("fontRatio:" + fontRatio);
		if(redStartValue < redEndValue && redStartValue < gauge.maximumValue) {
			ctx.beginPath();
			ctx.strokeStyle = redColor;
			ctx.lineWidth = toPixels(redThickness);
			var radius = outerRadius - (ctx.lineWidth )/ 2;
			if(tickmarkInset < 0)
			{
			    ctx.lineWidth = 4;
				radius = outerRadius - 2;
			}
			//console.log("outerRadius:" + outerRadius + ",radius:" + radius + ",tickmarkInset:" + tickmarkInset);
			//console.log("Width:" + gaugeWidth + ",Height:" + gaugeHeight + ",tickmarkInset:" + tickmarkInset);
			//console.log("RedStartValue:" + (redStartValue) + " , maximumValue:" + gauge.maximumValue +", redEndValue:" + redEndValue);
			//console.log("redEndValue:" + (redEndValue) + " , Angle:" + valueToAngle(redEndValue));
			ctx.arc(xCenter, yCenter, radius,
				degToRad(valueToAngle(redStartValue) +270), degToRad(valueToAngle(redEndValue) +270));
			ctx.stroke();
		}
		if(circleVisible) {
			ctx.beginPath();
			ctx.strokeStyle = "#ffffff";
			ctx.lineWidth = toPixels(0.01);	
			if(ctx.lineWidth < 1){
			  ctx.lineWidth = 1;
			}
			//console.log("LineWidth:" + toPixels(0.02));
			ctx.arc(xCenter, yCenter, outerRadius,
				degToRad(minimumValueAngle+ 270) , degToRad(maximumValueAngle+ 270));
			ctx.stroke();
		}
	}

    background: Canvas {
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            paintBackground(ctx);
        }

        Text {
            id: gaugeText         
			//font: Qt.font({ family: 'Lato Bold', weight: Font.Bold, italic: false})
			font.pixelSize: toPixels(fontRatio)
			font.italic: false
			font.family: 'Lato Bold'
			font.weight: Font.Bold
			text: displayText
			color: (gauge.value <= gauge.redStartValue) ? normalTextColor : redColor
            horizontalAlignment: Text.AlignRight
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: toPixels(topMarginRatio)
            readonly property string displayText: { if (dataMapAddress != 1) formatNumberLength(dataMapValue,4) ; else dataMapValue.toFixed(0) }

        }
        Text {
            text: gaugeUnit
            color: "white"
            font.pixelSize: toPixels(0.06)
			font.family: 'Lato Bold'
			font.bold: true
            anchors.top: gaugeText.bottom
			//anchors.topMargin: (toPixels(-0.04))
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
	// Needle is drawn here
    needle: Canvas {
        implicitWidth: needleBaseWidth
        implicitHeight: needleLength

        property real xCenter: width / 2
        property real yCenter: height / 2

        onPaint: {
		//console.log("Hide Needle Status:" + gaugeHideNeedle);
		   if(!gaugeHideNeedle){
				var ctx = getContext("2d");
				ctx.reset();

				ctx.beginPath();
				ctx.moveTo(xCenter, height);
				ctx.lineTo(xCenter - needleBaseWidth / 2, height - needleBaseWidth / 2);
				ctx.lineTo(xCenter - needleTipWidth / 2, 0);
				ctx.lineTo(xCenter, yCenter - needleLength);
				ctx.lineTo(xCenter, 0);
				ctx.closePath();
				ctx.fillStyle = Qt.rgba(0.8, 0.8, 0.8, 1);
				ctx.fill();
				//console.log("Text:" + dataMapValue);

				ctx.beginPath();
				ctx.moveTo(xCenter, height)
				ctx.lineTo(width, height - needleBaseWidth / 2);
				ctx.lineTo(xCenter + needleTipWidth / 2, 0);
				ctx.lineTo(xCenter, 0);
				ctx.closePath();
				ctx.fillStyle = Qt.rgba(1, 1, 1, 1);
				ctx.fill();
			}
        }
    }
	  tickmarkLabel: Text {
			font.pixelSize: Math.max(6, outerRadius * gauge.labelFontRatio)
			font.bold : true
			text:  smartFormatNumberLength(styleData.value,3)
			color: (styleData.value < gauge.redStartValue) ? "white" : redColor
			antialiasing: true
		}

    foreground: gauge.foreground
}