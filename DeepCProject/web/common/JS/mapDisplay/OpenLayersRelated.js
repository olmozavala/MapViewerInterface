
// Gets the current map extent, checking for out-of-range values
function getMapExtent()
{
	var bounds = map.getExtent();
	var maxBounds = map.maxExtent;
	var top = Math.min(bounds.top, maxBounds.top);
	var bottom = Math.max(bounds.bottom, maxBounds.bottom);
	var left = Math.max(bounds.left, maxBounds.left);
	var right = Math.min(bounds.right, maxBounds.right);
	return new OpenLayers.Bounds(left, bottom, right, top);
}


// This function fonfigures the OpenLayers popup that shows 
function setPopUp(e){
	var lonLat = map.getLonLatFromPixel(e.xy);
	if(myWCSpopup != undefined){
		myWCSpopup.destroy();
	}
	myWCSpopup = new OpenLayers.Popup (
		"id", // TODO: does this need to be unique?
		lonLat,
		new OpenLayers.Size(10, 10),
		"Loading ...",
		true, // Means "add a close box"
		null  // Function after closing
		);

	clsImg = myWCSpopup.closeDiv;

	clsImg.style.backgroundImage= "url('"+basepath+"/common/images/OpenLayers/closeV2.png')";

	contDiv = myWCSpopup.contentDiv;
	contDiv.style.fontSize = '12px';

	myWCSpopup.setBackgroundColor('transparent');
	myWCSpopup.autoSize = true;
	map.addPopup(myWCSpopup);
}

function manageOptionalLayers(selectedLayer,visibility){        
	selectedLayer.setVisibility(visibility);
}


/* This function process the user's drawing and contacts the ncWMS server and the godiva program to
* produce graphs depending on the variables selected and the dates.
*/
function handleDrawing(line)
{   
	map.addLayer(dlayer);//add drawing layer so it stays in map
       
	var lat_lon = line.substring(11, line.length - 1);//extarct the lon_lat values of the drawing
	var time = null;
    
	try{
		time = calStart.selection.get();//get the selected time in the start calendar
		time = Calendar.intToDate(time);    
		time = Calendar.printDate(time, '%Y-%m-%d');    
	}
	catch(err)
	{
		time = layerDetails['nearestTimeIso'];
        
	}        
    
	var CRS = map.options['projection']; //get current map projection
    
	var url = getMainLayer().url; //get server
	url = url + '?REQUEST=GetTransect&LAYER=';
    
	url = url + mainLayer + "&CRS=" + CRS + "&TIME=" + time;
	url = url +"&LINESTRING=" + lat_lon + "&FORMAT=image/png&COLORSCALERANGE=auto";
	url = url + "&NUMCOLORBANDS=254&LOGSCALE=false&PALETTE=" + mappalette;

	popUp(url,550,450);
}


