
var channelIds = [];
var screenIds = [];
var messageBoxIds = [];
var i;
var selectionRectangle = null;
var selectedChannelIndex = [-1,-1,-1,-1,-1]; // individual index for each screen
var dashScreens = [];
var offset = 30;
var mainWindow = null;

var pollValue ="<noop>";
var bDoubleClick = false;

function onClicked(x,y,b)
{
	//console.log("clicked x="+x+",y="+y);
	if(bDoubleClick) return;
	if(b & Qt.RightButton)
		console.log("Right button clicked")
	   var s;
	   var widgets;
		if(currentSelection > 0 )
		{
			try{
			s = currentSelection - 1;
			//console.log("s:" + s);
			widgets = dashScreens[s].widgets;
			console.log("s:" + s + ", widgets count:" + widgets.length);
			}
			catch(e)
			{
				console.log("Exception:" + e.message);
				
				return;
			}
			for(i=0; i<widgets.length; i++)
			{
				var channel = widgets[i];
				if(channel.x  <  x  && channel.x  + channel.width + offset > x &&
				   channel.y < y && channel.y + channel.height > y)
				   {
					   try{
						   var channelData = "1";
						   var showPropertyGrid = "";
						   selectedChannelIndex[s] = i;
						   showSelectionRectangle(channel);
						   mainWindow.qmlSignal("<Channel>" + channelData + ";<X>" + x + ";<Y>" + y + ";" + "<ScreenID>" + s + ";<ChannelID>" + channel.channelId + ";");
					   }
					   catch(err){
						   console.log( err.message + " ErrAt X:" + x + ",Y:" + y);
					   }
					   return;
				   }
			}

		}
	mainWindow.qmlSignal("No channel found at X:" + x + ",Y:" + y);
}
function onDoubleClicked(x,y,b)
{
	bDoubleClick = true;
	   var s;
	   var widgets;
		if(currentSelection > 0 )
		{
			try{
			s = currentSelection - 1;
			widgets = dashScreens[s].widgets;
			}
			catch(e)
			{
				console.log("Exception:" + e.message);
				console.log("s:" + s + ", widgets count:" + widgets.length);
				bDoubleClick = false;
				return;
			}
			for(i=0; i<widgets.length; i++)
			{
				var channel = widgets[i];
				if(channel.x  <  x && channel.x  + channel.width + offset > x &&
				   channel.y < y && channel.y + channel.height > y)
				   {
					   try{
						   var channelData = "1";
						   var  showChannelSelection = "<ShowChannelSelection>"
						   selectedChannelIndex[s] = i;
						   showSelectionRectangle(channel);
						   mainWindow.qmlSignal("<Channel>" + channelData + ";<X>" + x + ";<Y>" + y + ";" + "<ScreenID>" + s + ";<ChannelID>" + channel.channelId + ";" + showChannelSelection);
					   }
					   catch(err){
						   console.log( err.message + " ErrAt X:" + x + ",Y:" + y);
					   }
					   bDoubleClick = false;
					   return;
				   }
			}

		}
	mainWindow.qmlSignal("No channel found at X:" + x + ",Y:" + y);
	bDoubleClick = false;
}
function showSelectionRectangle(channel)
{
	try{
	   selectionRectangle.x = channel.x ;
	   selectionRectangle.y = channel.y;
	   selectionRectangle.width =  channel.width;
	   selectionRectangle.height = channel.height;
	   selectionRectangle.radius = 5;
	   console.log("Selected ChannelID:" + channel.channelId);
	   if(channel.channelId != ""  && (channel.channelId.indexOf("Circular",0) > 0 || channel.channelId.indexOf("hero",0) >= 0 )){
		   selectionRectangle.height = channel.width;
		   selectionRectangle.radius = channel.width / 2;
	   }
	   else {
		   selectionRectangle.x += offset;
	   }
	   selectionRectangle.visible = true;
	}
	catch(e)
	{
		console.log("Error in showSelectionRectangle: " + e.message);
	}
}

function initScreens()
{
		initLayout1();
		initLayout2();
		initLayout3();
		initLayout4();
		initLayout5();
		initLayout6();
		initLayout7();
		initLayout8();
		initLayout9();
		initLayout10();
		updateGauges();
}
function initLayout1()
{
	addWidget(1,430,375,100,60,"layout_01_09");
	addWidget(1,430,269,50,100,"layout_01_11");	
	addWidget(1,480,269,80,100,"layout_01_10");	
	addWidget(1,190,5,480,480,"layout_01_heroCircularGauge");	
	addWidget(1,0,40,150,100,"layout_01_01");	
	addWidget(1,0,150,150,100,"layout_01_02");	
	addWidget(1,0,255,150,100,"layout_01_03");	
	addWidget(1,0,365,150,100,"layout_01_04");	
	addWidget(1,668,40,150,100,"layout_01_05");	
	addWidget(1,668,150,150,100,"layout_01_06");	
	addWidget(1,668,255,150,100,"layout_01_07");	
	addWidget(1,668,365,150,100,"layout_01_08");	
}
function initLayout2(){
	addWidget(2,200,240,150,75,"layout_02_05");
	addWidget(2,640,240,150,75,"layout_02_06");
	addWidget(2,200,330,100,50,"layout_02_07");
	addWidget(2,640,330,100,50,"layout_02_08");
	addWidget(2,10,10,390,390,"layout_02_heroLeftGauge");
	addWidget(2,455,10,390,390,"layout_02_heroRightGauge");
	addWidget(2,-10,390,190,85,"layout_02_01");
	addWidget(2,200,390,190,85,"layout_02_02");
	addWidget(2,410,390,190,85,"layout_02_03");
	addWidget(2,620,390,190,85,"layout_02_04");
	addWidget(2,373,265,54,112,"layout_02_09");

}

function initLayout3(){
	addWidget(3,0,310,250,140,"layout_03_01");
	addWidget(3,260,310,250,140,"layout_03_02");
	addWidget(3,530,310,250,140,"layout_03_03");
	addWidget(3,120,200,200,110,"layout_03_04");
	addWidget(3,320,140,160,160,"layout_03_05");
	addWidget(3,500,170,180,140,"layout_03_06");
	addWidget(3,150,25,420,150,"layout_03_07");
}

function initLayout4(){
	addWidget(4,0,80,150,100,"layout_04_02");
	addWidget(4,0,180,150,100,"layout_04_06");
	addWidget(4,0,280,150,100,"layout_04_10");
	addWidget(4,0,380,150,100,"layout_04_14");
	addWidget(4,150,80,180,100,"layout_04_03");
    addWidget(4,365-33,300,130,90,"layout_04_07"); // Speed
	addWidget(4,150,280,180,100,"layout_04_11");
	addWidget(4,150,380,180,100,"layout_04_15");	
	addWidget(4,470,80,180,100,"layout_04_04");
	addWidget(4,470,180,180,100,"layout_04_08");
	addWidget(4,470,280,180,100,"layout_04_12");
	addWidget(4,470,380,180,100,"layout_04_16");
	addWidget(4,650,80,180,100,"layout_04_05");
	addWidget(4,650,180,180,100,"layout_04_09");
	addWidget(4,650,280,180,100,"layout_04_13");
	addWidget(4,650,380,180,100,"layout_04_17");
    addWidget(4,365-33,162-3,130+3,123+3,"layout_04_gear"); // Gear
    addWidget(4,45-33,25-3,770+3,75+3,"layout_04_RPM_GAUGE"); // RPM
}
function initLayout5(){
	//Dummy for addWidget to work
	addWidget(5,0,0,1,1,"layout_05_00");
	/*
	addWidget(5,20,132,150,100,"layout_05_01");
	addWidget(5,220,132,150,100,"layout_05_02");	
	addWidget(5,420,132,150,100,"layout_05_03");	
	addWidget(5,620,132,150,100,"layout_05_04");	
	addWidget(5,20,232,150,100,"layout_05_05");	
	addWidget(5,220,232,150,100,"layout_05_06");	
	addWidget(5,420,232,150,100,"layout_05_07");	
	addWidget(5,620,232,150,100,"layout_05_08");	
	addWidget(5,20,332,150,100,"layout_05_09");	
	addWidget(5,220,332,150,100,"layout_05_10");	
	addWidget(5,420,332,150,100,"layout_05_11");
	addWidget(5,620,332,150,100,"layout_05_12");
	*/
}
function initLayout6(){
	addWidget(6,0,50,800,60,"layout_06_RPM_GAUGE");
	addWidget(6,20,132,150,100,"layout_06_01");
	addWidget(6,220,132,150,100,"layout_06_02");	
	addWidget(6,420,132,150,100,"layout_06_03");	
	addWidget(6,620,132,150,100,"layout_06_04");	
	addWidget(6,20,232,150,100,"layout_06_05");	
	addWidget(6,220,232,150,100,"layout_06_06");	
	addWidget(6,420,232,150,100,"layout_06_07");	
	addWidget(6,620,232,150,100,"layout_06_08");	
	addWidget(6,20,332,150,100,"layout_06_09");	
	addWidget(6,220,332,150,100,"layout_06_10");	
	addWidget(6,420,332,150,100,"layout_06_11");
	addWidget(6,620,332,150,100,"layout_06_12");
}
function initLayout7(){
	addWidget(7,170,250,120,40,"layout_07_01");
	addWidget(7,510,250,120,40,"layout_07_02");
	addWidget(7,110,20,300,300,"layout_07_heroCircularGauge_1");
	addWidget(7,450,20,300,300,"layout_07_heroCircularGauge_2");
	addWidget(7,25,370,100,100,"layout_07_03");	
	addWidget(7,155,370,100,100,"layout_07_04");	
	addWidget(7,285,370,100,100,"layout_07_05");	
	addWidget(7,415,370,100,100,"layout_07_06");	
	addWidget(7,545,370,100,100,"layout_07_07");
	addWidget(7,675,370,100,100,"layout_07_08");
	addWidget(7,0,280,180,180,"layout_07_heroCircularGauge_3");
	addWidget(7,680,280,180,180,"layout_07_heroCircularGauge_4");
	addWidget(7,340,280,180,180,"layout_07_heroCircularGauge_5");
}
function initLayout8(){
	addWidget(8,470,0,180,96,"layout_08_02");
	addWidget(8,650,0,180,96,"layout_08_03");
	addWidget(8,470,96,180,96,"layout_08_04");
	addWidget(8,650,96,180,96,"layout_08_05");
	addWidget(8,470,192,180,96,"layout_08_06");
	addWidget(8,650,192,180,96,"layout_08_07");
	addWidget(8,470,288,180,96,"layout_08_08");
	addWidget(8,650,288,180,96,"layout_08_09");
	addWidget(8,470,384,180,96,"layout_08_10");
	addWidget(8,650,384,180,96,"layout_08_11");
	addWidget(8,-10,60,75,58,"layout_08_12");
	addWidget(8,70,60,75,58,"layout_08_13");
	addWidget(8,-10,124,75,58,"layout_08_14");
	addWidget(8,70,124,75,58,"layout_08_15");	
	addWidget(8,295,60,75,58,"layout_08_16");
	addWidget(8,375,60,75,58,"layout_08_17");
	addWidget(8,295,124,75,58,"layout_08_18");
	addWidget(8,375,124,75,58,"layout_08_19");
	addWidget(8,-10,320,75,58,"layout_08_20");
	addWidget(8,70,320,75,58,"layout_08_21");
	addWidget(8,-10,384,75,58,"layout_08_22");
	addWidget(8,70,384,75,58,"layout_08_23");
	addWidget(8,295,320,75,58,"layout_08_24");
	addWidget(8,375,320,75,58,"layout_08_25");
	addWidget(8,295,384,75,58,"layout_08_26");
	addWidget(8,375,384,75,58,"layout_08_27");
}
function initLayout9(){
	addWidget(9,-30,0,180,96,"layout_09_02");
	addWidget(9,650,0,180,96,"layout_09_03");
	addWidget(9,-30,96,180,96,"layout_09_04");
	addWidget(9,650,96,180,96,"layout_09_05");
	addWidget(9,-30,192,180,96,"layout_09_06");
	addWidget(9,650,192,180,96,"layout_09_07");
	addWidget(9,-30,288,180,96,"layout_09_08");
	addWidget(9,650,288,180,96,"layout_09_09");
	addWidget(9,-30,384,180,96,"layout_09_10");
	addWidget(9,650,384,180,96,"layout_09_11");
	addWidget(9,171,60,75,58,"layout_09_12");
	addWidget(9,251,60,75,58,"layout_09_13");
	addWidget(9,171,124,75,58,"layout_09_14");
	addWidget(9,251,124,75,58,"layout_09_15");	
	addWidget(9,475,60,75,58,"layout_09_16");
	addWidget(9,555,60,75,58,"layout_09_17");
	addWidget(9,475,124,75,58,"layout_09_18");
	addWidget(9,555,124,75,58,"layout_09_19");
	addWidget(9,171,320,75,58,"layout_09_20");
	addWidget(9,251,320,75,58,"layout_09_21");
	addWidget(9,171,384,75,58,"layout_09_22");
	addWidget(9,251,384,75,58,"layout_09_23");
	addWidget(9,475,320,75,58,"layout_09_24");
	addWidget(9,555,320,75,58,"layout_09_25");
	addWidget(9,475,384,75,58,"layout_09_26");
	addWidget(9,555,384,75,58,"layout_09_27");
}
function initLayout10(){
	addWidget(10,125,300,100,40,"layout_10_15");
	addWidget(10,574,300,100,40,"layout_10_16");
	addWidget(10,30,18,350,350,"layout_10_heroCircularGauge_1");
	addWidget(10,480,18,350,350,"layout_10_heroCircularGauge_2");
	addWidget(10,5,392,135,70,"layout_10_01");
	addWidget(10,163,392,135,70,"layout_10_02");
	addWidget(10,500,392,135,70,"layout_10_03");	
	addWidget(10,658,392,135,70,"layout_10_04");
	addWidget(10,380,348,40,80,"layout_10_05");	
	addWidget(10,335,432,32,32,"layout_10_06");	
	addWidget(10,369,432,32,32,"layout_10_07");
	addWidget(10,403,432,32,32,"layout_10_08");
	addWidget(10,437,432,32,32,"layout_10_09");

	//addWidget(10,675,370,100,100,"layout_07_08");
	//addWidget(10,675,370,100,100,"layout_07_08");
}
function addWidget(screen,x,y,w,h,id)
{
	try{
		for(i=0;i<dashScreens.length; i++){		
			if(dashScreens[i].id == screen){
				var widget = {x:x,y:y,width:w,height:h,label:id,channelId:id};
				dashScreens[i].widgets.push(widget);
				return;
			}
		}
		var dashScreen = { id:screen, widgets:[]};
		var widget = {x:x,y:y,width:w,height:h,label:id,channelId:id};
		console.log("channelId:" + widget.channelId );
		dashScreen.widgets.push(widget);
		dashScreens.push(dashScreen);
	}
	catch(e){
		console.log("Error in addWidget; screen:" + screen + ", Error:" + e.message);
	}
}
function updateGauges()
{
	Qt.include("../user_screens/GaugeConfig.js");
	var i, j, k;
	var gaugeList = GaugeParams;
	try{
			for(i=0; i < gaugeList.length; i++){
			  var gauge= gaugeList[i];
			  for(j=0;j<dashScreens.length; j++)
			  {
				  var widgets = dashScreens[j].widgets;
				  for(k = 0; k<widgets.length; k++)
				  {
					  var channel = widgets[k];
					  if(channel.channelId == gauge.id)
					  {
						  channel.dataMapAddress = gauge.dataMapAddress;
						  channel.label = gauge.dataMapLabel;
					  }
				  }
			  }			  
			}
	}
	catch(e)
	{
		console.log("Error in updateGauges:" + e.message + ",i=" + i + ",j=" + j );
	}
}
