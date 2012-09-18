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

function changeElevation(sign, layer)
{
       
    //get the highest possible value
    var highest_elev = layerDetails.zaxis.values[0];
    var array_len = layerDetails.zaxis.values.length;
    var lowest_elev = layerDetails.zaxis.values[array_len - 1];//get lowest posible elevation
           
        
    //this is like a static variable in c++, it represents the current index in the array of elevations
    if(typeof changeElevation.counter == 'undefined')
        changeElevation.counter = 0;
       

    //if we need to add more height
    if(sign == '+')
    {
        if(changeElevation.counter != 0)
            changeElevation.counter--;          
            
    }
    else if(sign == '-')
    {
        if(changeElevation.counter != array_len -1)
            changeElevation.counter++;
    }
    
    //change the + sign in the menu
    if(changeElevation.counter == 0)
        $('alphaText_elevplus').style.visibility = 'hidden';
    else
        $('alphaText_elevplus').style.visibility = 'visible';
    
    //change the - sign in the menu
    if(changeElevation.counter == array_len -1)
        $('alphaText_elevminus').style.visibility = 'hidden';
    else
        $('alphaText_elevminus').style.visibility = 'visible';
 
 
    //add the elevation parameter to the layerDetails object. 
    getMainLayer().mergeNewParams({
        elevation:layerDetails.zaxis.values[changeElevation.counter]
    });
       
}


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

// This function is called when the Browser gets resized,
// it should keep all the user selections.
function refreshWindow(){
    //Adding the link of the animation being displayed (if any)
    
 
   
    var animDisp = document.createElement('INPUT');
    animDisp.type='hidden';
    animDisp.name='animationURL';
 
     
    //check to see if the stopAnimation() function has been called. 
    if(stop == false)
        animDisp.value = $('mapOverlay').src; // URL to the image
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

function manageOptionalLayers(selectedLayer,visibility){        
    selectedLayer.setVisibility(visibility);
}


//this functions opens up the url passed in
function popUp(url, width, height)
{
    var day = new Date();
    var id = day.getTime();
    
    //pass in the url to open, the rest of the parameters are just options on the new window that will open.
    window.open(url, id, 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width='
        + width + ',height=' + height + ',left = 300,top = 300');
}

/*this function process the user's drawing and contacts the ncWMS server and the godiva program to
 *produce graphs depending on the variables selected and the dates.
 *
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

  
function showPalettes()
{       
    var instr = document.getElementById('item_palette5');
    instr.style.visibility="visible";    
    
    var instr = document.getElementById('palette');
    instr.style.visibility="visible";    
    
}

function hidePalettes()
{       
    var instr = document.getElementById('item_palette5');
    instr.style.visibility="hidden";    
    
    var instr = document.getElementById('palette');
    instr.style.visibility="hidden";    
    
          
    
}




//this is the function called then the transect tool button is selected, 
//once selected it calls this function and lets the map know that this control 
//is now activated. 
function toggleControl(element) 
{
    for(key in drawControls) 
    {
        var control = drawControls[key];
			
        if(element.value == key) 
        {
            control.activate();
            var inner_html = document.getElementById('outer_transect');                
                       
            inner_html.innerHTML = '<span  id="controlToggle">  <button type="button" name="type" value="none" id="noneToggle" onclick="toggleControl(this);"  class="small awesome">Unselect Tool</button></span> ';
                         
                        
                        
        } else {
            var inner_html = document.getElementById('outer_transect');                
                       
            inner_html.innerHTML = '<span id="controlToggle">  <button type="button" name="type" value="line" id="noneToggle" onclick="toggleControl(this);"  class="small awesome">Transect Tool</button></span> ';
            dlayer.destroy();
            control.deactivate();
                        
        }
    }
}








