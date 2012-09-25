/**
 * Fills the dropdown menu that contains the available palettes
 */
function loadPalettes(){

	//The 'default' style is defined in the MapViewerServlet
	origpalette = mappalette;
	if(mappalette == 'default'){
		mappalette = layerDetails.defaultPalette;
		$('imgPalette').src = $('imgPalette').src.replace(origpalette,mappalette);
	}

	var tableRow = $('palettesTable').insertRow(0);

	for (var key in layerDetails.palettes) {
		palstr = layerDetails.palettes[key];

		var td = document.createElement('td');
		td.setAttribute('onclick',"UpdatePalette('"+palstr+"');");
		td.innerHTML = "<img src='"+paletteUrl.replace(origpalette,palstr)+"' onclick='displayPalettes();'/></td>";
		tableRow.appendChild(td);
	}

	minPalVal = layerDetails.scaleRange[0];
	maxPalVal  = layerDetails.scaleRange[1];

	$('minPal').value = parseFloat(minPalVal).toPrecision(4); 
	$('maxPal').value = parseFloat(maxPalVal).toPrecision(4);
}

/*
 * Replaces the image of the palette used
 */
function UpdatePalette(newPal){

	$('imgPalette').src = $('imgPalette').src.replace(mappalette,newPal);
	mappalette = newPal;//Change the current palette to the one just selected
	
	if(validatePaletteRange()){
		getMainLayer().mergeNewParams({
			styles: lay_style+"/"+newPal, 
			colorscalerange: minPalVal+ ',' + maxPalVal
		});
		
		//Update the KMLlink to visualize on google earth
		replaceGetParamInLink("kmlLink", "STYLES", lay_style+"/"+newPal);
		replaceGetParamInLink("kmlLink", "COLORSCALERANGE", minPalVal+ ',' + maxPalVal);
	}else{
		getMainLayer().mergeNewParams({
			styles: lay_style+"/"+newPal
		});
		
		//Update the KMLlink to visualize on google earth
		replaceGetParamInLink("kmlLink", "STYLES", lay_style+"/"+newPal);
	}
}

/*
 * Displays or hides the div that contains all the palettes.
 */
function displayPalettes(){

	if( displayingAnimation ){
		alert("The color palette can't be changed while loading or displaying an animation");
		$('palettes-div').style.visibility = "hidden";
	}
	else{
		palet_vis = $('palettes-div').style.visibility;
		if(palet_vis == "visible"){
			$('palettes-div').style.visibility = "hidden";
		}
		else{
			$('palettes-div').style.visibility = "visible";
		}
	}
}


