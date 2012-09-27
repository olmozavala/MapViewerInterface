var animation_layer;

/**
 * Initializes the calendars with the details of the active layer
 */

function initMenus(animUrl){

	//It is used so the user guide only gets loaded once
	if(newSession){
		displayHelp();
	}
	if(netcdf){
		//Show the palettes
		loadPalettes();
		initCalendars(animUrl);
	}
	else{
		setAnimationDivsVisibility("noanimation");
	}
}

/**
 * Modifies the visibility of different html elements involved on 
 * the displaying of the animations.
 */
function setAnimationDivsVisibility(status){
	if(netcdf){      

		if(status == 'BothCalendarsSelected'){//Both calendars have been selected
			//alert('bothcalendarsselected');
			$('p-animation').style.visibility = 'visible';
			$('s-animation').style.visibility = 'hidden';
			$('l-animation').style.visibility = 'hidden';
			$('minPal').disabled = false;
			$('maxPal').disabled = false;
			$('hideCalendarParent').style.visibility = 'visible';
			displayCalendars(true);
		}

		if(status == 'calendarSelected'){//After stoping the animation (calendar already selected)
			$('p-animation').style.visibility = 'visible';
			$('s-animation').style.visibility = 'hidden';
			$('l-animation').style.visibility = 'hidden';
			$('elevationParent').style.visibility= 'visible';
			$('minPal').disabled = false;
			$('maxPal').disabled = false;
			$('hideCalendarParent').style.visibility = 'visible';

			displayingAnimation = false;
			displayCalendars(true);

		}

		if(status == 'loading'){//Loading animation
			$('p-animation').style.visibility = 'collapse';
			$('s-animation').style.visibility = 'visible';
			$('l-animation').style.visibility = 'visible';
			$('minPal').disabled = true;
			$('maxPal').disabled = true;
			$('palettes-div').style.visibility = "hidden";
			$('hideCalendarParent').style.visibility = 'hidden';

			displayingAnimation = true;
			displayCalendars(false);
		}

		if(status == 'selecting'){//Selecting dates (when the app starts)
			//alert('selecting');
			$('p-animation').style.visibility = 'collapse';
			$('s-animation').style.visibility = 'hidden';
			$('l-animation').style.visibility = 'hidden';
			$('minPal').disabled = false;
			$('maxPal').disabled = false;
			$('hideCalendarParent').style.visibility = 'visible';

			displayCalendars(true);
		}

		//Displaying animation
		if(status == 'displaying'){
			$('p-animation').style.visibility = 'collapse';
			$('s-animation').style.visibility = 'visible';
			$('l-animation').style.visibility = 'hidden';
			$('elevationParent').style.visibility= 'hidden';
			$('minPal').disabled = true;
			$('maxPal').disabled = true;
			$('palettes-div').style.visibility = "hidden";
			$('hideCalendarParent').style.visibility = 'hidden';
			displayCalendars(false);
		}

		//This is the case for no netCDF layers
		if(status == 'noanimation'){
			//			alert('noanimation');
			$('p-animation').style.visibility = 'collapse';
			$('s-animation').style.visibility = 'hidden';
			$('l-animation').style.visibility = 'hidden';
			$('minPal').disabled = true;
			$('maxPal').disabled = true;
			$('hideCalendarParent').style.visibility = 'hidden';
			displayCalendars(false);
		}

	// After setting the display as inline or block the 
	// column losses its width so we need to rese it.
	/*
           $('elevationParent').style.width= '100%';
           */
	}
	// Options for non netcdf layers
	else{
	}
}

/**
 * This function hides the 'stop animation' option and shows the
 * calendar and 'display animation' option
 */ 
function stopAnimation(){

	setAnimationDivsVisibility("calendarSelected");

	getMainLayer().setVisibility(true);
	if(animation_layer != undefined)//If animation has been called. 
	{             
		animation_layer.setVisibility(false);
	}
	else
	{       
		$('mapOverlay').src = '';
	}

	//change the global for stop so that we know it has been called.
	stop = true;  
}

/**
 * This function gets the selected dates from the user and starts
 * the ajax request to generate the animation of the NetCDF files.
 */
function dispAnimation(){
	var startSel = calStart.selection.get();
	var endSel = calEnd.selection.get();

	if( (startSel != undefined)&&(endSel != undefined)){

		startDate = Calendar.intToDate(startSel);
		endDate = Calendar.intToDate(calEnd.selection.get());

		startDate = Calendar.printDate(startDate, '%Y-%m-%dT00:00:00.000Z')
		endDate = Calendar.printDate(endDate, '%Y-%m-%dT00:00:00.000Z')

		//While the animation is loading we don't show the  calendars
		setAnimationDivsVisibility("loading");

		dispAnimationAjax(startDate, endDate, mainLayer,"dispAnimation");

	}else{
		alert('Select dates for the animation from the calendars. ');
	}

	//make global for stop button true
	stop = false;
}

/**
 * This function gets called when the gif animation is received from the 
 * map server. 
 */
function animationLoaded()
{
	//    $('mapOverlayDiv').style.visibility = 'visible';
	// Load the image into a new layer on the map

	currCenter = map.getCenter();
	currZoom = map.getZoom();
	map.zoomToMaxExtent();
	//	map.setCenter(new OpenLayers.LonLat(lon=-90.0,lat=22),0)

	if(animation_layer != undefined){//If its the first time we add an animation
		map.removeLayer(animation_layer);
	}

	//	alert($('mapOverlay').src); // URL to the image
	//	alert(map.getMaxExtent());
	layerBounds = new OpenLayers.Bounds();

	//	-98.0,18.09164810180664,-76.400024,31.960647583007812
	layerBounds.extend(new OpenLayers.LonLat(layerDetails.bbox[0],layerDetails.bbox[1]));
	layerBounds.extend(new OpenLayers.LonLat(layerDetails.bbox[2],layerDetails.bbox[3]));

	animation_layer = new OpenLayers.Layer.Image(
		"ncWMS", // Name for the layer
		$('mapOverlay').src, // URL to the image
		layerBounds,
		new OpenLayers.Size($('mapOverlay').width, $('mapOverlay').height), // Size of image
		{ // Other options
			isBaseLayer : false,
			maxResolution: map.baseLayer.maxResolution,
			minResolution: map.baseLayer.minResolution,
			resolutions: map.baseLayer.resolutions
		}
		);

	map.addLayers([animation_layer]);
	map.setLayerZIndex(animation_layer,idx_main_layer+1);

	//	alert(map.layers);

	map.setCenter(currCenter);
	map.zoomTo(currZoom);
	setAnimationDivsVisibility('displaying');

	getMainLayer().setVisibility(false);
}


