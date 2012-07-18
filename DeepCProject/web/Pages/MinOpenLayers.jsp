<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>OpenLayers map preview</title>
        <!-- Import OL CSS, auto import does not work with our minified OL.js build -->
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/geoserver/openlayers/theme/default/style.css"/>
        <!-- Basic CSS definitions -->
        <style type="text/css">
            /* General settings */
            body {
                font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
                font-size: small;
            }

            /* The map and the location bar */
            #map {
                clear: both;
                position: relative;
                width: 746px;
                height: 330px;
                border: 1px solid black;
            }
            
            #wrapper {
                width: 746px;
            }
            
            #location {
                float: right;
            }
            
            #options {
                position: absolute;
                left: 13px;
                top: 7px;
                z-index: 3000;
            }
        </style>
        <!-- Import OpenLayers, reduced, wms read only version -->
        <script src="http://localhost:8080/geoserver/openlayers/OpenLayers.js" type="text/javascript">
        </script>
        <script defer="defer" type="text/javascript">
            var map;
            var untiled;
            var tiled;
            // pink tile avoidance
			
            OpenLayers.IMAGE_RELOAD_ATTEMPTS = 5;
            // make OL compute scale according to WMS spec
            OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;
        
            function init(){
                // if this is just a coverage or a group of them, disable a few items,
                // and default to jpeg format
                format = 'image/png';
            
                var bounds = new OpenLayers.Bounds( 
						-98.0,18.09164810180664,
						-76.4000244140625,31.960647583007812);

                var options = {
                    controls: [],
                    maxExtent: bounds,
                    maxResolution: 0.2286783854166685,
                    projection: "EPSG:4326",
                    units: 'degrees'
                };
//                map = new OpenLayers.Map('map', options);
                map = new OpenLayers.Map('map');

				var imagery = new OpenLayers.Layer.WMS(
					"Global Imagery",
					"http://maps.opengeo.org/geowebcache/service/wms",
					{layers: "bluemarble"}
				);

                // setup tiled layer
                tiled = new OpenLayers.Layer.WMS(
                    "Tiled", "http://maps.opengeo.org/geowebcache/service/wms",
                    {
                        LAYERS: 'bluemarble',
                        format: format
                    },
                    {
                        buffer: 0,
                        displayOutsideMaxExtent: true,
                        isBaseLayer: true
                    } 
                );

				layer0 = new OpenLayers.Layer.WMS('Name Not found','http://146.201.212.175:8080/geoserver/wms', 
						{layers: 'comm:gebco',styles: '',srs: 'EPSG:4326',format_options: '',format: 'image/jpeg',tiled: true,tilesOrigin: '-98.0,18.09164810180664'},
						{transitionEffect: 'resize'},   
						{buffer: 1, displayOutsideMaxExtent: true, isBaseLayer: true});
           
                // setup single tiled layer
                untiled = new OpenLayers.Layer.WMS(
                    "Untiled", "http://localhost:8080/ncWMS/wms",
                    {
                        LAYERS: 'hycom2010/sea_water_velocity',
                        STYLES: 'vector/rainbow',
                        format: 'image/png',
						transparent: true
                    },
                    {
                       singleTile: true, 
                       ratio: 1, 
                       yx : {'EPSG:4326' : true}
                    } 
                );
        
//                map.addLayers([layer0,untiled]);
                map.addLayers(imagery);

                // build up all controls
                map.addControl(new OpenLayers.Control.PanZoomBar({
                    position: new OpenLayers.Pixel(2, 15)
                }));
                map.addControl(new OpenLayers.Control.Navigation());
                map.addControl(new OpenLayers.Control.Scale($('scale')));
                map.addControl(new OpenLayers.Control.MousePosition({element: $('location')}));
                map.zoomToExtent(bounds);
                
//				parms = {format: 'image/png'};
//				url = "http://146.201.212.175:8080/ncWMS/wms";
//				alert( untiled.getFullRequestString(parms, url));

                // wire up the option button
                var options = document.getElementById("options");
            }
        </script>
    </head>
    <body onload="init()">
        <div id="map">
            <img id="options" title="Toggle options toolbar" src="http://localhost:8080/geoserver/options.png"/>
        </div>
        <div id="wrapper">
            <div id="location">location</div>
            <div id="scale">
            </div>
        </div>
        <div id="nodelist">
            <em>Click on the map to get feature info</em>
        </div>
    </body>
</html>
