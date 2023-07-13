import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import "../../styles"
import "../user_components"
import "../factory_components"

Item {
    objectName: "AlertPopup_01"
	id: alertPopup
    x: 0
    y: 0
	z: 5
    width: 860
    height: 480
	visible:true


        property int currentSelection: 2
        property alias visibility: selectionRect.visible
 
        property int alertHeight: 80
        property int alertWidth : 860
        property int fontSize: alertHeight * 3 / 4
        property int repeatCount : 5
        property int alarmRadius: 2
        property int startLocation: 0
        property real alertOpacity: 0.8
		ListModel{
			id:alarmModel
		}		
		function reInitAlarmScreen(msg)
		{
            //console.log("reInitAlarmScreen called with " + msg);
			//AlarmConfig.initAlarms(alarmModel,msg);
            var jsonObj  = JSON.parse(msg);
            console.log("******* reInitAlarmScreen Parsed data length:" + jsonObj.length);
			var i;
			alarmModel.clear();
			for(i=0; i< jsonObj.length; i++)
			{
			 alarmModel.append(jsonObj[i]);
			}
            startLocation = 480 - alarmModel.count * alertHeight;
            if(alarmModel.count > 0)
            {
              console.log("alarmModel length now:" + alarmModel.count);
            }
		}

		Component.onCompleted: {
		    
		}
		FontLoader {
		id: dinFont
		source: "../../styles/DINCondensed-Bold.ttf"
	}

    Rectangle{
        id: selectionRect
        height: 1
        width: 1
        x: 0
        y: 0
        color: "transparent"
        border.color: "aqua"
        border.width: 3
        visible: false
    }
	Item {
		objectName: "AlertGauge"
		id: alertGauge
		x: 0
        y: startLocation
		z: 8
		opacity: alertOpacity
		width: 800
		height: 160
		visible: true

		Repeater {
			model: alarmModel
			Rectangle{
			   id : myRect
				x: 0
                y:  alertHeight * (index )
				height : alertHeight
				width  : alertWidth
				color: model.bc
				radius: alarmRadius
				Text{
                    id:myMessage
				    font: Qt.font({ family: dinFont.name, pixelSize: fontSize, weight: Font.DemiBold, italic: false, capitalization: Font.AllUppercase })
					z: 3
					color: model.fc
					text: model.text
					anchors.fill: parent
					anchors.centerIn: parent
					horizontalAlignment : TextInput.AlignHCenter
					verticalAlignment: TextInput.AlignVCenter
                }
					Timer{
					id: timer
                    interval: 500
					running: (model.priority > 0)
					repeat: true
                    onTriggered:
                    {
                        myMessage.opacity = myMessage.opacity === 0 ? 1 : 0;
                    }
                 }
			}
		}
	}		
}


