var calStart;
var calEnd;
var end_selected = false;

function displayCalendars(disp){
    var visib = disp ? "visible" : "hidden";

    $("cal-start").style.visibility = visib;
    $("cal-end").style.visibility = visib;
}

/* 
 * This function initializes all the variables for the calendars
 * an it is called from 'animation.js' when the layer is
 * 'netcdf
 */
function initCalendars(animUrl){
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

/*this function returns the total number of days for the month pass and the year
 *the year is only relevant when the month is february, otherwise it doesn't matter. 
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

//this function is to hide the calendars and also show the back the calendar.
function hideCalendar()
{
    var button = $('hide_show');    
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

//this function is called when a netcdf layer is loaded but it only has one day. 
//the calendar won't load but we still need to hide the Start date (current) and also the end Date
function hideOneDay()
{    
    $('hideOneDay').style.visibility = 'hidden';
    $('hideOneDayEnd').style.visibility = 'hidden';
}
