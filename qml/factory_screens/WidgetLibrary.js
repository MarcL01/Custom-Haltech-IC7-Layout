
.import DashList 1.0 as DashScreenList
var dashScreens = [];
var DashScreensCount = 0;

function getDashScreenArray()
{
	dashScreens = DashScreenList.getDashList();
	console.log("At getDashScreenArray, ArrayLength "  + dashScreens.length);
	dashScreens = dashScreensObject["dashScreensList"];
	return dashScreens;
}
function updateDataMapAddress(sid, wid, val)
{
	dashScreens = DashScreenList.getDashList();
	console.log("At updateDataMapAddress, ArrayLength "  + dashScreens.length);
	dashScreens[sid].Widgets[wid].dataMapAddress = val;
}
function addDashScreen(dashScreen)
{
	dashScreens = DashScreenList.getDashList();
	console.log("At addDashScreen, ArrayLength "  + dashScreens.length);
	dashScreens.push(dashScreen);
}
function addWidget(i,widget)
{
	dashScreens = DashScreenList.getDashList();
	console.log("At addWidget, ArrayLength "  + dashScreens.length);
	dashScreens[i].widgets.push(widget);
}
function updateWidget(screenid,id,val)
{
	   dashScreens = DashScreenList.getDashList();
	   var i;
	   var s;
	   var j;
	   var widgets;
	   var currentScreen = 0;
	   console.log("Inside updateWidget dashScreens Count:" +dashScreens.length);
		for(i=0;i<dashScreens.length; i++){		
			if(dashScreens[i].id == screenid){
				currentScreen = i + 1;
				break;
            }
        }
		console.log("currentScreen for " + screenid + " is:" + currentScreen + ",ScreenCount:" + dashScreens.length );
		if(currentScreen > 0 )
		{
			try{
			s = currentScreen - 1;
			widgets = dashScreens[s].widgets;
			console.log("CurrentScreen Index s:" + s + ", widgets count:" + widgets.length);
			}
			catch(e)
			{
				console.log("Exception:" + e.message);
				console.log("s:" + s + ", widgets count:" + widgets.length);
				return;
			}
			for(i=0; i<widgets.length; i++)
			{
				var channel = widgets[i];
				if(channel.id == id)
				{
					console.log("dataMapAddress changed from " + channel.dataMapAddress + " to:" + val);
					updateDataMapAddress(s,i,val);
					return;
				}
			}
		}
}