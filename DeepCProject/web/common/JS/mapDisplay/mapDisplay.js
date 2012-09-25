var myWCSpopup;
var	maxOpacity = 1;
var	minOpacity = 0.1;
var opacity = 1;//Default opacity
var displayingAnimation = false;//Global variable that helps to disable the palette selection
var stop = false;

/**
 * Manages the transparency of the main layer and the animation (if loading)
 */
function changeTranspManager(val){

	layer = getMainLayer();
	changeTransp(val,layer);

	if(netcdf){
		if(animation_layer != undefined){
			changeTransp(val,animation_layer);
		}
	}
}

/**
* Changes the transparencya of the inputed layer.
*/
function changeTransp(val, layer){

	opacity = Math.min(maxOpacity, Math.max(minOpacity, opacity + val));
      
	layer.setOpacity(opacity);
  
	//make disapear the minus or plus sign in the menu
	if(opacity != maxOpacity)
		$("alphaText_transminus").style.visibility = 'visible';
	else
		$("alphaText_transminus").style.visibility = 'hidden';
  
	if(opacity != minOpacity)
		$("alphaText_transplus").style.visibility = 'visible';
	else
		$("alphaText_transplus").style.visibility = 'hidden';
}


// This function is called when the Browser gets resized,
// it should keep all the user selections.
function refreshWindow(){
	//Adding the link of the animation being displayed (if any)
   
	var animDisp = document.createElement('INPUT');
	animDisp.type='hidden';
	animDisp.name='animationURL';
 
	//check to see if the stopAnimation() function has been called. 
	if(stop == false)
        if(netcdf){
            animDisp.value = $('mapOverlay').src; // URL to the image
        }
	else if(stop == true)
		animDisp.value = ''; //null if stop have been called
    
	$('baseForm').appendChild(animDisp);

	MapViewersubmitForm();
}

function MapViewersubmitForm(){
	if(map != null){
		var inputZoom = document.createElement('INPUT');
		inputZoom.type='hidden';
		inputZoom.name='zoom';
		inputZoom.value=map.getZoom().toString();
		$('baseForm').appendChild(inputZoom);

		var inputCenter = document.createElement('INPUT');
		inputCenter.type='hidden';
		inputCenter.name='center';
		inputCenter.value=map.getCenter().toString();
		$('baseForm').appendChild(inputCenter);

		submitForm();
	}
} 


//this function displays the help menu
function displayHelp()
{
	var instr = $('helpInstructions');
	if( instr.style.visibility=="visible"){
		instr.style.visibility="hidden";
	}else{
		instr.style.visibility="visible";
	}
    
}
