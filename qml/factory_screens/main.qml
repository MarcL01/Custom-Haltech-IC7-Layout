import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
//import "../../styles"

//import "DataMapEnums.js" as DataMapAddress 
//import "../user_screens/GaugeConfig.js" as GaugeConfig
import DataMapAddressEnums 1.0
//import DashList 1.0 
import "channels.js" as Channels
Item {
        id: mainWindowId
        objectName: "mainWindow"
        visible: true
		z:10
		x: 0
		y: 0
        width: 860
        height: 480
		property var currentSelection: 2
		property alias visibility: selectionRect.visible
		signal qmlSignal(string msg)
		function reInitScreens(msg)
		{
			console.log("reInitScreens called");
			Channels.updateGauges();
		}
        //DashList{ id:dlist; dl:[] }		
				
		Component.onCompleted: {
		    /****
		    try{
			   	var dashScreens = dlist.dl;
				console.log("At onCompleted, ArrayLength "  + dashScreens.length);
			}
			catch(e)
			{
				console.log("Error in main.qml:" + e.message)
			}
			******/
			Channels.initScreens();
			Channels.selectionRectangle = selectionRect;
			Channels.mainWindow = mainWindowId;
		}
	Rectangle{
		id: selectionRect
		height: 70
		width: 140
		x: 100
		y: 400
		z: 10
		color: "transparent"
		border.color: "aqua"
		border.width: 3
		visible: false

	}	
	MouseArea{
		id: mouseArea1
		anchors.fill : parent
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		z:10
			onClicked: {
				Channels.onClicked(mouseArea1.mouseX,mouseArea1.mouseY,mouse.button);
		}
		 onDoubleClicked: {
				Channels.onDoubleClicked(mouseArea1.mouseX,mouseArea1.mouseY,mouse.button);
		}	
	}
}
