<%-- 
Document   : Transect
Created on : Sep 10, 2012, 6:39:38 PM
Author     : khan
--%>
	if(netcdf){
		
		//create layer for line drawing, this is transect tool	 
		var lineLayer = new OpenLayers.Layer.Vector("Line Layer");
	
		//temporary layer to redraw the user's drawiing
		dlayer = new OpenLayers.Layer.Vector( "Drawing" );

		map.addLayers(lineLayer);//add drawing layer
			
		//controls for drawing, the reason it is an array is incase we want to add 
		//function for the polygon draw, point draw etc..	
		drawControls = {
	   
			line: new OpenLayers.Control.DrawFeature(lineLayer,
			OpenLayers.Handler.Path)
		
		};

		//we add all the controls to the map
		for(var key in drawControls) {
			map.addControl(drawControls[key]);
		}

		//register function to be called when drawing finishes
		lineLayer.events.register('featureadded', lineLayer, function(event){
			dlayer.destroy();
			//if previos drawing existed then eliminated
			if (lineLayer.features.length > 1) {
				lineLayer.destroyFeatures(lineLayer.features[0]);
			}
		   
			// Get the linestring specification
			var line = event.feature.geometry.toString();
			dlayer = lineLayer.clone();

			handleDrawing(line);
		});
	}