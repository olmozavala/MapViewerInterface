var calStart;
var calEnd;
var animation_layer;
var end_selected = false;

function displayCalendars(disp){
    var visib = disp ? "visible" : "hidden";
                         
    $("cal-start").style.visibility = visib;
    $("cal-end").style.visibility = visib;
}

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
        var datesWithData = layerDetails.datesWithData; // Tells the calendar which dates to disable
        var minYear = 100000000;
        var maxYear = -100000000;
        var minMonth = 13;
        var maxMonth = -1;
        var minDay = 32;
        var maxDay = -1;

        for (var year in datesWithData) {
            if (typeof datesWithData[year] != 'function') { // avoid built-in functions
                if (year < minYear) minYear = year;
                if (year > maxYear) maxYear = year;
            }
        }

        for (var month in datesWithData[minYear]) {
            if(IsNumeric(month)){//Assume the first month is the minimum
                if(month < minMonth){
                    minMonth = parseInt(month);
                    minDay =datesWithData[minYear][month][0];//Assumes it has at least one day
                }
            }
        }

        for (var month2 in datesWithData[maxYear]) {
            if(IsNumeric(month2)){
                if(parseInt(month2) > maxMonth){
                    maxMonth = parseInt(month2);
                    //Assumes it has at least one day
                    maxDay =datesWithData[maxYear][month2][datesWithData[maxYear][month2].length - 1];
                }
            }
        }

        min = new Date(minYear,minMonth, minDay);
        max = new Date(maxYear,maxMonth, maxDay);

        //this is called when there is only one day. 
        if(min.toString() == max.toString())
        {                      
            hideOneDay();
        }


        //We verify that we have more than one day
        if( min < max){
            //I don't know why but for the selection the month needs to be increased by one
            minMonth = minMonth + 1;
            startDate = minYear + (minMonth < 10? '0' + minMonth: minMonth) + (minDay < 10? '0' + minDay: minDay);

            calStart = Calendar.setup({
                cont    : "cal-start",
                min        : min,
                max        : max,
                onSelect: updateCalendarStart,
                selection: [startDate],
                bottomBar: false
            });


            calEnd = Calendar.setup({
                cont    : "cal-end",
                min        : min,
                max        : max,
                onSelect: updateCalendarEnd,
                bottomBar: false
            });

            calStart.selection.set(startDate);
            calStart.moveTo(min);
            calEnd.moveTo(max);

            calStart.redraw();
            calEnd.redraw();

            displayCalendars(true);

            if( animUrl != ''){
                $('mapOverlay').src = animUrl;
                setAnimationDivsVisibility("displaying");
            }else{
                setAnimationDivsVisibility("selecting");
            }
        }
        else{//If we only have one day then we hidde all the calendar options
            //			setAnimationDivsVisibility("selecting");
            setAnimationDivsVisibility("noanimation");
        }
    }
    else{//this else is in case the layer is not a netcdf layer. 
        setAnimationDivsVisibility("noanimation");
        $('hideCalendar').style.visibility = 'hidden';
                                   
    }

}
/**
 * Function called when the end calendar gets updated
 */
function updateCalendarEnd(){
    updateCalendarOpts();
}

/**
 * Function called when the start calendar gets updated
 */
function updateCalendarStart(){
    
    //alert(max_time_range);
    updateCalendarOpts();

    var startSel = calStart.selection.get();
    startDate = Calendar.intToDate(startSel);
    startDate = Calendar.printDate(startDate, '%Y-%m-%d');
    //Updates the main layer depending on the day selected
    updateSelectedDate(startDate);
}

/**
 * Disables the dates from the End calendar, depending on the 
 * start date that has been selected by de the user.
 */
function updateCalendarOpts(){

    var startSel = calStart.selection.get();
    var endSel = calEnd.selection.get();

    //	alert($('pTitleText').innerText);;
    if( (endSel != undefined) && (startSel != undefined)){
            
        var startDate = Calendar.intToDate(startSel);
        var endDate = Calendar.intToDate(endSel);                     

        startDate = Calendar.printDate(startDate, '%Y-%m-%d');
        endDate = Calendar.printDate(endDate, '%Y-%m-%d');                  
                                  
        //We only request the animation if the start date is before the end date
        if(  endSel >=  startSel  ){
            dispAnimationAjax(startDate, endDate, mainLayer,"getAnimTimes");
        }

        setAnimationDivsVisibility('BothCalendarsSelected');

    }

    if( (startSel != undefined)){
								   
        var end_final = "";
								   
        if(max_time_range =="week")
            end_final = getWeekEnd(startSel);
        else if (max_time_range =="month")
            end_final = getMonthEnd(startSel, 1);
        else if (max_time_range =="bimonth")
            end_final = getMonthEnd(startSel, 2);
        else 
            end_final = getYearEnd(startSel);
								   
        startDate = Calendar.intToDate(startSel);
        endDate = Calendar.intToDate(end_final);
				 
        calEnd.args.min = startDate;
        calEnd.args.max = endDate;

        if( (endSel != undefined) ){
            // If the end selection is before the start selection 
            // we move the end selection to the limit range 
            if( ( endSel > end_final) || (endSel < startSel ) ){
                calEnd.selection.set(endDate);
                calEnd.moveTo(endDate, "true");
            }
        }

        calEnd.refresh();
    }

    if( (endSel != undefined) ){
        end_selected = true;
    }
    else{
        end_selected = false;
    }
}

/*
 *This function returns start_date + one or two months, so if it starts in Jan 15 2011 it returns Feb 15 2011 or March 15 2011
 *Got to consider the leap year case, let's say user selects 29 Jan may return 1 March or 29 Feb depending on year
 *Got to consider the limit of day, and the limit of month, and limit of year *
 */
function getMonthEnd(start_date, monthsAppart)
{
    var addMonths = monthsAppart;

    var max_year = max.getFullYear(); 
    var max_month = pad(max.getMonth() + monthsAppart);
    var max_day = pad(max.getDate());    
    var string_form = String(start_date);//convert to string   
    var year = string_form.substr(0,4);
    var month = string_form.substr(4, 2);//parse month value
    var day = string_form.substr(6, 2);//parse day value
    
    var final_date = "";    
    
    var next_month = (parseInt(month, 10) + monthsAppart) % 12;       
    
      
    //if next month is under the dataset
    if(max_month > next_month || (max_month <= next_month && max_year != year))
    {           
          
        //if next month is not january
        if(pad(next_month) != '01' )
            final_date = year + pad(next_month) + day;  
        else
            final_date = String(parseInt(year, 10) + 1) + pad(next_month) + day;  
                    
    }
    else//if next month is not under the data set
    {
          
        //if it is a valid day in the dataset
        if(max_day >= day && max_month != month)
            final_date = year + max_month + day;
        else
            final_date = year + max_month + max_day;
    }

       
    return final_date;
}

/*pass a number and if padding is needed then add 0. 
 *Example: pass 1 return 01
 *Example: pass 15 return 15. 
 */
function pad(number) 
{  
    if(number < 10 && String(number).substr(0,1) == '0')
    {
        return number;
    }
    
    return (number < 10 ? '0' : '') + number
   
}

/*this function returns the total number of days for the month pass and the year
 *the year is only relevant when the month is february, otherwise it doesn't matter. 
 *
 */
function numDays(year, month)
{
    var max_month = pad(max.getMonth() + 1);
    var max_year = (max.getFullYear());


    if(max_month == month && year == max_year)
    {
        var max_day = pad(max.getDate());
      
        return max_day;        
    }

    var leap = isLeap(parseInt(year));
    if(month == '02')
    {

        if(leap == true)
            return '29';
        else
            return '28';
    }
    else
    {

        if(month == '01' || month == '03' || month == '05' || month == '07' || month == '08' || month == '10' || month == '12')
            return '31';
        else
            return '30';
    }

}

/*
 *This function return start_date + year
 **/
function getYearEnd(start_date)
{
    var max_year = max.getFullYear();
    var max_month = pad(max.getMonth() + 1);
    var max_day = pad(max.getDate());    
    var string_form = String(start_date);//convert to string   
    var year = string_form.substr(0,4);
    var month = string_form.substr(4, 2);//parse month value
    var day = string_form.substr(6, 2);//parse day value
    
    var next_year = parseInt(year, 10) + parseInt(1, 10);
    
    var final_date = '';
    
    if(year == max_year)
    {
            
        final_date = String(parseInt(max_year,10)) + pad(String(max_month)) + pad(String(max_day));       
            
        return final_date;           
    }  
    
    if(next_year < max_year)
    {           
        final_date = String(parseInt(year,10) + 1) + pad(String(month)) + pad(String(day));       
    }
    else
    {       
                      
        if(parseInt(max_month, 10) > parseInt(month, 10))
        {                       
                       
            final_date = String(parseInt(max_year,10)) + pad(String(month)) + pad(String(day));       
                       
        }
        else//max_month is less than or equal to month 
        {
            
            if(parseInt(max_day, 10) >= parseInt(day, 10) && parseInt(max_month, 10) >= parseInt(month, 10))
            {
                                   
                final_date = String(parseInt(max_year,10)) + pad(String(month)) + pad(String(day));        
            }
            else
            {
                                
                final_date = String(parseInt(max_year,10)) + pad(String(max_month)) + pad(String(max_day));        
            }
        }
    }
      

    return final_date;
    
}


/*
 *This function returns start_date + 7 days more. We have to watch for leap year,
 *month limits, and year limits under the dataset.  It all depends on the values extracted from max.
 */
function getWeekEnd(start_date)
{
   
    var max_year = max.getFullYear();
    var max_month = pad(max.getMonth() + 1);
    var max_day = pad(max.getDate());
    
    var string_form = String(start_date);//convert to string   
    var year = string_form.substr(0,4);
    var month = string_form.substr(4, 2);//parse month value
    var day = string_form.substr(6, 2);//parse day value
    
    var month_last_day = numDays(year, month);//obtain the total number of days in the month
         
    var end_day = pad(parseInt(day, 10) + parseInt(7, 10));//add one week value
    
    var final_date = "";
        
    //if the end_day is still within the same month
    if(parseInt(month_last_day, 10) >= parseInt(end_day, 10))           
    {
        if(max_year != year)
            final_date = String(year) + String(month) + String(end_day);
        else
        {   //if not in the limit month
            if(parseInt(month, 10) != parseInt(max_month, 10))
                final_date = String(year) + String(month) + String(end_day);
            else//if same month of lmit
            {
                if(parseInt(max_day, 10) >= parseInt(end_day, 10))
                    final_date = String(year) + String(month) + String(end_day);
                else
                    final_date = String(year) + String(month) + String(max_day);
            }
        }   
    }
    else//if the +7 goes to the next month or more than the allowed value. 
    {
        var diff =   parseInt(end_day, 10) - parseInt(month_last_day, 10); // (26+7) - 30 = 3 of next month
        var next_month = (parseInt(month, 10) + 1) % 12; //mod 12 becuase there are twelve months            
             
        //if next month is still under the allowed dataset
        if(max_month >  next_month || (max_month <= next_month && parseInt(max_year, 10) != parseInt(year, 10)))
        {                      
            //if the actual month is not december becuase otherwise we have to go to january
            if(parseInt(month) != 12)
                final_date = String(year) + pad(String(next_month)) + String(pad(diff));
            else//if the month is december the next month should be january and the year++
            {
                final_date = String(parseInt(year) + 1) + pad(String("1")) + String(pad(diff));
            }
        }
        else if(max_month <= next_month  && parseInt(max_year, 10) == parseInt(year, 10))//else then do not skip to next month, but use the limit month which is max_month
        {                     
            if(parseInt(max_day, 10) >= parseInt(month_last_day, 10))
                final_date = String(year) + String(max_month) + String(pad(month_last_day));                     
            else
                final_date = String(year) + String(max_month) + String(pad(max_day));                     
        }
        else
        {
            alert("SI SE REPORTA ESTE ERROR AY QUE ARREGLAR ESTE ELSE");
                         
        }
             
             
    }
     

    return final_date;
}

//This function return true if year is leap, false otherwise
function isLeap(year)
{

    if(year % 4 == 0)
    {
        if(year % 100 != 0)
            return true;
        else{
            if(year % 400 == 0)
                return true;
            else
                return false;
        }
    }
    else//not divisable by 4
    {
        return false;
    }
   
}

/*
 * Updates the current layer with the selected date
 */ 
function updateSelectedDate(newDate){
    //    alert('layer'+idx_main_layer+'.mergeNewParams({ time:newDate });');
    eval('layer'+idx_main_layer+'.mergeNewParams({ time:newDate });');

    // Updates the kml link to download the main data 
    // Update the time
    replaceGetParamInLink("kmlLink", "TIME", newDate);
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
            //			$('transParag').style.visibility= 'visible';
            $('minPal').disabled = false;
            $('maxPal').disabled = false;
            $('hideCalendar').style.visibility = 'visible';
            displayCalendars(true);
                                                    
        }
            
        if(status == 'calendarSelected'){//After stoping the animation (calendar already selected)
            $('p-animation').style.visibility = 'visible';
            $('s-animation').style.visibility = 'hidden';
            $('l-animation').style.visibility = 'hidden';
            //			$('transParag').style.visibility= 'visible';
            $('elevation').style.visibility= 'visible';
            $('minPal').disabled = false;
            $('maxPal').disabled = false;
            $('hideCalendar').style.visibility = 'visible';

            displayingAnimation = false;
            displayCalendars(true);
                                                   
        }

        if(status == 'loading'){//Loading animation
            $('p-animation').style.visibility = 'collapse';
            $('s-animation').style.visibility = 'visible';
            $('l-animation').style.visibility = 'visible';
            //			$('transParag').style.visibility= 'visible';
            $('minPal').disabled = true;
            $('maxPal').disabled = true;
            $('palettes-div').style.visibility = "hidden";
            $('hideCalendar').style.visibility = 'hidden';
                                                    
            displayingAnimation = true;
            displayCalendars(false);
        }

        if(status == 'selecting'){//Selecting dates (when the app starts)
            //alert('selecting');
            $('p-animation').style.visibility = 'collapse';
            $('s-animation').style.visibility = 'hidden';
            $('l-animation').style.visibility = 'hidden';
            //			$('transParag').style.visibility= 'visible';
            $('minPal').disabled = false;
            $('maxPal').disabled = false;
            $('hideCalendar').style.visibility = 'visible';
                                
            displayCalendars(true);
        }

        //Displaying animation
        if(status == 'displaying'){
            $('p-animation').style.visibility = 'collapse';
            $('s-animation').style.visibility = 'visible';
            $('l-animation').style.visibility = 'hidden';
            $('elevation').style.visibility= 'hidden';
            //			$('transParag').style.visibility= 'hidden';
            $('minPal').disabled = true;
            $('maxPal').disabled = true;
            $('palettes-div').style.visibility = "hidden";
            $('hideCalendar').style.visibility = 'hidden';
            displayCalendars(false);
        }

        //This is the case for no netCDF layers
        if(status == 'noanimation'){
            //			alert('noanimation');
            $('p-animation').style.visibility = 'collapse';
            $('s-animation').style.visibility = 'hidden';
            $('l-animation').style.visibility = 'hidden';
            //			$('transParag').style.visibility= 'visible';
            $('minPal').disabled = true;
            $('maxPal').disabled = true;
            $('hideCalendar').style.visibility = 'hidden';
            displayCalendars(false);
        }

    // After setting the display as inline or block the 
    // column losses its width so we need to rese it.
    /*
        $('transParag').style.width= '100%';
        $('elevation').style.width= '100%';
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

//this function is to hide the calendars and also show the back the calendar.
function hideCalendarFunc()
{
    var button = $('hideCalendar');    
    var inner_text = button.innerHTML;  
       
    //this if handles when the calendar is hiden and we should show it
    if(inner_text == "Hide Calendar")
    {
        button.innerHTML = "Show Calendar";
        displayCalendars(false); 
        $('p-animation').style.visibility = 'hidden';
    }
    else//this handles when we need to hide the calendar. 
    {           
        button.innerHTML = "Hide Calendar";
        displayCalendars(true);                   
                                   
        if(end_selected == false)
            $('p-animation').style.visibility = 'hidden';
        else
            $('p-animation').style.visibility = 'visible';
    }
    
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

//this function is called when a netcdf layer is loaded but it only has one day. 
//the calendar won't load but we still need to hide the Start date (current) and also the end Date

function hideOneDay()
{    
    document.getElementById('hideOneDay').style.visibility = 'hidden';
    document.getElementById('hideOneDayEnd').style.visibility = 'hidden';
    //document.getElementById('hideCalendarParent').style.display = 'none'; 
             
             
             
}
