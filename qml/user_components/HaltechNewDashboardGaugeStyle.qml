
import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
  
CircularGaugeStyle {
	id: gaugeCircle
	
    tickmarkInset: toPixels(gauge.tickmarkInsetRatio)  					//The distance in pixels from the outside of the gauge (outerRadius) 
																		//	at which the outermost point of the tickmark line is drawn  
	minorTickmarkInset: toPixels(gauge.minorTickmarkInsetRatio)
    labelInset: outerRadius * gaugeStyleLabelInsetRatioToOuterRadius  	//  the value in pixels from outerRadius the marker text is drawn
    tickmarkStepSize: gauge.tickmarkStepSize  							// The interval at which tickmarks are displayed.
	labelStepSize : gauge.gaugeLabelStepSize  							// The interval at which tickmark labels are displayed.
	minorTickmarkCount : gauge.minorTickmarkCount  						// How many minor tick marks between two major tickmarks
    minimumValueAngle: gauge.minimumValueAngle  						// The start angle of the gauge markings top most is zero deg
    maximumValueAngle: gauge.maximumValueAngle							// End angle of the gauge markings		
    tickmark: gauge.tickmark
    minorTickmark: gauge.minorTickmark
	/*  Currently we are using the default
	tickmarkLabel: gauge.tickmarkLabel
	*/
    property real xCenter: outerRadius 
    property real yCenter: outerRadius 
    property real needleLength: toPixels(0.95)
    property real needleTipWidth: toPixels(0.02)
    property real needleBaseWidth: toPixels(0.09)
    property bool halfGauge: false
	property color gradientColor: gauge.gradientColor
	property color backgroundColor :  "#f8d509"
	property real redStartValue : gauge.redStartValue
	property real redEndValue : gauge.redEndValue
	property real redThickness : gauge.redThickness
	property real valueFactor : gauge.valueFactor
	property real fontRatio : gauge.fontRatio
	property real labelFontRatio : gauge.labelFontRatio
	property real topMarginRatio : gauge.topMarginRatio
	property color redColor : gauge.redColor
	property color normalTextColor : "#e5dd0c"
	property bool dayTimeValue: gauge.dayTime
	property bool circleVisible: gauge.circleVisible


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
	    if(num < 0) length++;
		var str = (num.toFixed(3) + "00").substring(0,length);
		str = str.substring(0,length);
		return str;
	}
	function smartFormatNumberLength(num, length) {
	    if(num < 0) length++;
		var str = "";
		if(num == Math.round(num)){
		  str = num;
		  return str;
		}
		str = (num.toFixed(3) + "00").substring(0,length);
		str = str.substring(0,length);
		return str;
	}
	/*
    function valueToAngle(val) {
		return minimumValueAngle + ((maximumValueAngle - minimumValueAngle)/(gauge.maximumValue - gauge.minimumValue)) * (val - gauge.minimumValue);
	} */
	function gaugeLabelColor(value) {
	    var str = "";
		if((enableRedStart && value > redStartValue ) || 
		(enableLowerRedStart && value < gauge.lowerRedStartValue ) )
		{
		  str = gaugeTickmarkRedLabelColor;
		}
		else
		{
		  str = gaugeTickmarkLabelColor;
		}
		return str;
	}
/********************************************************
This function renders the red color area and gauge boundary
********************************************************/
    function paintBackground(ctx) {
		ctx.reset();
		   //	main part of tacho
		   //console.log("gaugeFaceColor=" + gaugeFaceColor);
			ctx.beginPath();
			ctx.strokeStyle = gaugeFaceColor;
			ctx.lineWidth = toPixels(redThickness);
			var radius = outerRadius - (ctx.lineWidth )/ 2;
			if(tickmarkInset < 0)
			{
			    ctx.lineWidth = 4;
				radius = outerRadius - 2;
			}

			ctx.arc(xCenter, yCenter, radius,
				degToRad(minimumValueAngle + 265),degToRad(valueToAngle(redEndValue) +263 ));
			ctx.stroke();
			// red part of tacho upper threshold
			if(enableRedStart && redStartValue < gauge.maximumValue) {
				ctx.beginPath();
				ctx.strokeStyle = redColor;
				ctx.lineWidth = toPixels(redThickness);
				var radius = outerRadius - (ctx.lineWidth )/ 2;
				if(tickmarkInset < 0)
				{
					ctx.lineWidth = 4;
					radius = outerRadius - 2;
				}
				//console.log("At upper redStartValue:" + degToRad(valueToAngle(redStartValue) +270) + ",redEndValue:" + degToRad(valueToAngle(gauge.redEndValue) +263 ));
				ctx.arc(xCenter, yCenter, radius,
					degToRad(valueToAngle(redStartValue) +270), degToRad(valueToAngle(redEndValue) +263 ));
				ctx.stroke();
			}
			// Lower Threshold
			if(enableLowerRedStart && gauge.lowerRedStartValue > gauge.minimumValue) {
				ctx.beginPath();
				ctx.strokeStyle = redColor;
				ctx.lineWidth = toPixels(redThickness);
				var radius = outerRadius - (ctx.lineWidth )/ 2;
				if(tickmarkInset < 0)
				{
					ctx.lineWidth = 4;
					radius = outerRadius - 2;
				}
				//console.log("minimumValueAngle:" + degToRad((minimumValueAngle) +263) + ",lowerRedStartValue:" + degToRad(valueToAngle(gauge.lowerRedStartValue) +270 ));
				ctx.arc(xCenter, yCenter, radius,
					degToRad((minimumValueAngle) +263), degToRad(valueToAngle(gauge.lowerRedStartValue) +270 ));
				ctx.stroke();
			}
			// circle
			ctx.beginPath();
			ctx.strokeStyle = Qt.darker(gaugeFaceColor,1.5);
			ctx.lineWidth = toPixels(0.035);
			var radius = outerRadius * 0.61;
			var anglestart = degToRad(minimumValueAngle + 263);
			var angleend = degToRad(valueToAngle(redEndValue) +266)
			ctx.arc(xCenter, yCenter, radius, anglestart, angleend);
			ctx.stroke();

			ctx.beginPath();
			ctx.lineWidth = toPixels(0.005);
			var radius = outerRadius * 0.51;
			var anglestart = degToRad(minimumValueAngle + 260);
			var angleend = degToRad(valueToAngle(redEndValue) +270);
			var horizstart = xCenter + radius * Math.cos (anglestart);
			var vertstart = yCenter + radius * Math.sin (anglestart);
			var vertend = yCenter + radius * Math.sin (angleend);
			ctx.arc(xCenter, yCenter, radius, anglestart, angleend);
			ctx.lineTo(horizstart, vertend);
			ctx.lineTo(horizstart, vertstart);
			ctx.stroke();

		if(circleVisible) {
			ctx.beginPath();
			ctx.strokeStyle = gaugeMajorTickmarkColor;
			ctx.lineWidth = toPixels(0.01);	
			if(ctx.lineWidth < 1){
			  ctx.lineWidth = 1;
			}
			ctx.arc(xCenter, yCenter, outerRadius * 0.96,
				degToRad(minimumValueAngle+ 270) , degToRad(maximumValueAngle+ 270));
			ctx.stroke();
		}
		/***************
					//ctx.rect(0, 0, canvas.width, canvas.height);
					radius = outerRadius;
                    var grd = ctx.createRadialGradient(xCenter, yCenter, outerRadius, xCenter, yCenter, outerRadius + 20);
                    grd.addColorStop(0.25, Qt.rgba(200,0,0,0));
                    grd.addColorStop(0.30, Qt.rgba(200,220,0,60));
                    grd.addColorStop(0.35, '#00000000');
                    ctx.fillStyle = grd;
                    ctx.fill();	
				*************/
	}

    background: Canvas {
		id: gaugeCanvas
        onPaint: {
 		    gauge.styleCanvas = gaugeCanvas;
           var ctx = getContext("2d");
            ctx.reset();
            paintBackground(ctx);
        }

    }
	//needle: gauge.needleSource
	/*************/
	// Needle is drawn here
    needle: Canvas {
	    z: 10
        implicitWidth: needleBaseWidth
        implicitHeight: needleLength

        property real xCenter: width / 2
        property real yCenter: height / 2

        onPaint: {
			//console.log("gaugeNeedleColor:" + gaugeNeedleColor);
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
				ctx.fillStyle = gaugeNeedleColor;
				ctx.fill();
				//console.log("Text:" + dataMapValue);

				ctx.beginPath();
				ctx.moveTo(xCenter, height)
				ctx.lineTo(width, height - needleBaseWidth / 2);
				ctx.lineTo(xCenter + needleTipWidth / 2, 0);
				ctx.lineTo(xCenter, 0);
				ctx.closePath();
				ctx.fillStyle = Qt.lighter(gaugeNeedleColor,1.5);
				ctx.fill();
			}
        }
    }
	foreground: Item {
		Rectangle {
			width: outerRadius * 0.12
			height: width
			radius: width / 2
			color: gaugeNeedleColor
			anchors.centerIn: parent
		}
	}

	/**********************/
	  tickmarkLabel: Text {
			y: 6
			id: tickText
			font.pixelSize: Math.max(6, outerRadius * gauge.labelFontRatio)
			font.weight : Font.Medium
			font.family: dinFont.name
			text:  smartFormatNumberLength(styleData.value,3)
			color: gaugeLabelColor(styleData.value)
			antialiasing: true
			layer.enabled: true
			layer.effect: DropShadow {
            verticalOffset: 1
			horizontalOffset: 2
            color: "#40000000"
            radius: 2
            samples: 8
			cached: true
			}
		}

   // foreground: gauge.foreground
}