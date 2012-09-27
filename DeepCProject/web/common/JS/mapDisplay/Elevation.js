/* Changes the elevation of the layer if it is netCDF */
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
		$('plusButtonElevation').disabled = true;
	else
		$('plusButtonElevation').disabled = false;
    
	//change the - sign in the menu
	if(changeElevation.counter == array_len -1)
		$('minusButtonElevation').disabled = true;
	else
		$('minusButtonElevation').disabled= false;
 
 
	//add the elevation parameter to the layerDetails object. 
	getMainLayer().mergeNewParams({
		elevation:layerDetails.zaxis.values[changeElevation.counter]
	});
}


