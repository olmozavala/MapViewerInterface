/* Copyright (c) 2006-2012 by OpenLayers Contributors (see authors.txt for 
 * full list of contributors). Published under the Clear BSD license.  
 * See http://svn.openlayers.org/trunk/openlayers/license.txt for the
 * full text of the license. */

/* 
 * @requires OpenLayers/BaseTypes.js
 * @requires OpenLayers/Lang/en.js
 * @requires OpenLayers/Console.js
 */
 
/*
 * TODO: In 3.0, we will stop supporting build profiles that include
 * OpenLayers.js. This means we will not need the singleFile and scriptFile
 * variables, because we don't have to handle the singleFile case any more.
 */

(function() {
    /**
     * Before creating the OpenLayers namespace, check to see if
     * OpenLayers.singleFile is true.  This occurs if the
     * OpenLayers/SingleFile.js script is included before this one - as is the
     * case with old single file build profiles that included both
     * OpenLayers.js and OpenLayers/SingleFile.js.
     */
    var singleFile = (typeof OpenLayers == "object" && OpenLayers.singleFile);
    
    /**
     * Relative path of this script.
     */
    var scriptName = (!singleFile) ? "OpenLayers.js" : "OpenLayers.js";

    /*
     * If window.OpenLayers isn't set when this script (OpenLayers.js) is
     * evaluated (and if singleFile is false) then this script will load
     * *all* OpenLayers scripts. If window.OpenLayers is set to an array
     * then this script will attempt to load scripts for each string of
     * the array, using the string as the src of the script.
     *
     * Example:
     * (code)
     *     <script type="text/javascript">
     *         window.OpenLayers = [
     *             "OpenLayers/Util.js",
     *             "OpenLayers/BaseTypes.js"
     *         ];
     *     </script>
     *     <script type="text/javascript" src="../lib/OpenLayers.js"></script>
     * (end)
     * In this example OpenLayers.js will load Util.js and BaseTypes.js only.
     */
    var jsFiles = window.OpenLayers;

    /**
     * Namespace: OpenLayers
     * The OpenLayers object provides a namespace for all things OpenLayers
     */
    window.OpenLayers = {
        /**
         * Method: _getScriptLocation
         * Return the path to this script. This is also implemented in
         * OpenLayers/SingleFile.js
         *
         * Returns:
         * {String} Path to this script
         */
        _getScriptLocation: (function() {
            var r = new RegExp("(^|(.*?\\/))(" + scriptName + ")(\\?|$)"),
                s = document.getElementsByTagName('script'),
                src, m, l = "";
            for(var i=0, len=s.length; i<len; i++) {
                src = s[i].getAttribute('src');
                if(src) {
                    m = src.match(r);
                    if(m) {
                        l = m[1];
                        break;
                    }
                }
            }
            return (function() { return l; });
        })()
    };

    /**
     * OpenLayers.singleFile is a flag indicating this file is being included
     * in a Single File Library build of the OpenLayers Library.
     * 
     * When we are *not* part of a SFL build we dynamically include the
     * OpenLayers library code.
     * 
     * When we *are* part of a SFL build we do not dynamically include the 
     * OpenLayers library code as it will be appended at the end of this file.
     */
    if(!singleFile) {
        if (!jsFiles) {
            jsFiles = [
                "openlayers/BaseTypes/Class.js",
                "openlayers/Util.js",
                "openlayers/Animation.js",
                "openlayers/BaseTypes.js",
                "openlayers/BaseTypes/Bounds.js",
                "openlayers/BaseTypes/Date.js",
                "openlayers/BaseTypes/Element.js",
                "openlayers/BaseTypes/LonLat.js",
                "openlayers/BaseTypes/Pixel.js",
                "openlayers/BaseTypes/Size.js",
                "openlayers/Console.js",
                "openlayers/Tween.js",
                "openlayers/Kinetic.js",
                "Rico/Corner.js",
                "Rico/Color.js",
                "openlayers/Events.js",
                "openlayers/Events/buttonclick.js",
                "openlayers/Request.js",
                "openlayers/Request/XMLHttpRequest.js",
                "openlayers/Projection.js",
                "openlayers/Map.js",
                "openlayers/Layer.js",
                "openlayers/Icon.js",
                "openlayers/Marker.js",
                "openlayers/Marker/Box.js",
                "openlayers/Popup.js",
                "openlayers/Tile.js",
                "openlayers/Tile/Image.js",
                "openlayers/Tile/Image/IFrame.js",
                "openlayers/Layer/Image.js",
                "openlayers/Layer/SphericalMercator.js",
                "openlayers/Layer/EventPane.js",
                "openlayers/Layer/FixedZoomLevels.js",
                "openlayers/Layer/Google.js",
                "openlayers/Layer/Google/v3.js",
                "openlayers/Layer/HTTPRequest.js",
                "openlayers/Layer/Grid.js",
                "openlayers/Layer/MapGuide.js",
                "openlayers/Layer/MapServer.js",
                "openlayers/Layer/KaMap.js",
                "openlayers/Layer/KaMapCache.js",
                "openlayers/Layer/Markers.js",
                "openlayers/Layer/Text.js",
                "openlayers/Layer/WorldWind.js",
                "openlayers/Layer/ArcGIS93Rest.js",
                "openlayers/Layer/WMS.js",
                "openlayers/Layer/WMTS.js",
                "openlayers/Layer/ArcIMS.js",
                "openlayers/Layer/GeoRSS.js",
                "openlayers/Layer/Boxes.js",
                "openlayers/Layer/XYZ.js",
                "openlayers/Layer/OSM.js",
                "openlayers/Layer/Bing.js",
                "openlayers/Layer/TMS.js",
                "openlayers/Layer/TileCache.js",
                "openlayers/Layer/Zoomify.js",
                "openlayers/Layer/ArcGISCache.js",
                "openlayers/Popup/Anchored.js",
                "openlayers/Popup/AnchoredBubble.js",
                "openlayers/Popup/Framed.js",
                "openlayers/Popup/FramedCloud.js",
                "openlayers/Feature.js",
                "openlayers/Feature/Vector.js",
                "openlayers/Handler.js",
                "openlayers/Handler/Click.js",
                "openlayers/Handler/Hover.js",
                "openlayers/Handler/Point.js",
                "openlayers/Handler/Path.js",
                "openlayers/Handler/Polygon.js",
                "openlayers/Handler/Feature.js",
                "openlayers/Handler/Drag.js",
                "openlayers/Handler/Pinch.js",
                "openlayers/Handler/RegularPolygon.js",
                "openlayers/Handler/Box.js",
                "openlayers/Handler/MouseWheel.js",
                "openlayers/Handler/Keyboard.js",
                "openlayers/Control.js",
                "openlayers/Control/Attribution.js",
                "openlayers/Control/Button.js",
                "openlayers/Control/ZoomBox.js",
                "openlayers/Control/ZoomToMaxExtent.js",
                "openlayers/Control/DragPan.js",
                "openlayers/Control/Navigation.js",
                "openlayers/Control/PinchZoom.js",
                "openlayers/Control/TouchNavigation.js",
                "openlayers/Control/MousePosition.js",
                "openlayers/Control/OverviewMap.js",
                "openlayers/Control/KeyboardDefaults.js",
                "openlayers/Control/PanZoom.js",
                "openlayers/Control/PanZoomBar.js",
                "openlayers/Control/ArgParser.js",
                "openlayers/Control/Permalink.js",
                "openlayers/Control/Scale.js",
                "openlayers/Control/ScaleLine.js",
                "openlayers/Control/Snapping.js",
                "openlayers/Control/Split.js",
                "openlayers/Control/LayerSwitcher.js",
                "openlayers/Control/DrawFeature.js",
                "openlayers/Control/DragFeature.js",
                "openlayers/Control/ModifyFeature.js",
                "openlayers/Control/Panel.js",
                "openlayers/Control/SelectFeature.js",
                "openlayers/Control/NavigationHistory.js",
                "openlayers/Control/Measure.js",
                "openlayers/Control/WMSGetFeatureInfo.js",
                "openlayers/Control/WMTSGetFeatureInfo.js",
                "openlayers/Control/Graticule.js",
                "openlayers/Control/TransformFeature.js",
                "openlayers/Control/SLDSelect.js",
                "openlayers/Geometry.js",
                "openlayers/Geometry/Collection.js",
                "openlayers/Geometry/Point.js",
                "openlayers/Geometry/MultiPoint.js",
                "openlayers/Geometry/Curve.js",
                "openlayers/Geometry/LineString.js",
                "openlayers/Geometry/LinearRing.js",
                "openlayers/Geometry/Polygon.js",
                "openlayers/Geometry/MultiLineString.js",
                "openlayers/Geometry/MultiPolygon.js",
                "openlayers/Renderer.js",
                "openlayers/Renderer/Elements.js",
                "openlayers/Renderer/NG.js",
                "openlayers/Renderer/SVG.js",
                "openlayers/Renderer/SVG2.js",
                "openlayers/Renderer/Canvas.js",
                "openlayers/Renderer/VML.js",
                "openlayers/Layer/Vector.js",
                "openlayers/Layer/PointGrid.js",
                "openlayers/Layer/Vector/RootContainer.js",
                "openlayers/Strategy.js",
                "openlayers/Strategy/Filter.js",
                "openlayers/Strategy/Fixed.js",
                "openlayers/Strategy/Cluster.js",
                "openlayers/Strategy/Paging.js",
                "openlayers/Strategy/BBOX.js",
                "openlayers/Strategy/Save.js",
                "openlayers/Strategy/Refresh.js",
                "openlayers/Filter.js",
                "openlayers/Filter/FeatureId.js",
                "openlayers/Filter/Logical.js",
                "openlayers/Filter/Comparison.js",
                "openlayers/Filter/Spatial.js",
                "openlayers/Filter/Function.js",                
                "openlayers/Protocol.js",
                "openlayers/Protocol/HTTP.js",
                "openlayers/Protocol/WFS.js",
                "openlayers/Protocol/WFS/v1.js",
                "openlayers/Protocol/WFS/v1_0_0.js",
                "openlayers/Protocol/WFS/v1_1_0.js",
                "openlayers/Protocol/CSW.js", 
                "openlayers/Protocol/CSW/v2_0_2.js",
                "openlayers/Protocol/Script.js",
                "openlayers/Protocol/SOS.js",
                "openlayers/Protocol/SOS/v1_0_0.js",
                "openlayers/Layer/PointTrack.js",
                "openlayers/Style.js",
                "openlayers/Style2.js",
                "openlayers/StyleMap.js",
                "openlayers/Rule.js",
                "openlayers/Format.js",
                "openlayers/Format/QueryStringFilter.js",
                "openlayers/Format/XML.js",
                "openlayers/Format/XML/VersionedOGC.js",
                "openlayers/Format/Context.js",
                "openlayers/Format/ArcXML.js",
                "openlayers/Format/ArcXML/Features.js",
                "openlayers/Format/GML.js",
                "openlayers/Format/GML/Base.js",
                "openlayers/Format/GML/v2.js",
                "openlayers/Format/GML/v3.js",
                "openlayers/Format/Atom.js",
                "openlayers/Format/KML.js",
                "openlayers/Format/GeoRSS.js",
                "openlayers/Format/WFS.js",
                "openlayers/Format/WFSCapabilities.js",
                "openlayers/Format/WFSCapabilities/v1.js",
                "openlayers/Format/WFSCapabilities/v1_0_0.js",
                "openlayers/Format/WFSCapabilities/v1_1_0.js",
                "openlayers/Format/WFSDescribeFeatureType.js",
                "openlayers/Format/WMSDescribeLayer.js",
                "openlayers/Format/WMSDescribeLayer/v1_1.js",
                "openlayers/Format/WKT.js",
                "openlayers/Format/CQL.js",
                "openlayers/Format/OSM.js",
                "openlayers/Format/GPX.js",
                "openlayers/Format/Filter.js",
                "openlayers/Format/Filter/v1.js",
                "openlayers/Format/Filter/v1_0_0.js",
                "openlayers/Format/Filter/v1_1_0.js",
                "openlayers/Format/SLD.js",
                "openlayers/Format/SLD/v1.js",
                "openlayers/Format/SLD/v1_0_0.js",
                "openlayers/Format/OWSCommon.js",
                "openlayers/Format/OWSCommon/v1.js",
                "openlayers/Format/OWSCommon/v1_0_0.js",
                "openlayers/Format/OWSCommon/v1_1_0.js",
                "openlayers/Format/CSWGetDomain.js",
                "openlayers/Format/CSWGetDomain/v2_0_2.js",
                "openlayers/Format/CSWGetRecords.js",
                "openlayers/Format/CSWGetRecords/v2_0_2.js",
                "openlayers/Format/WFST.js",
                "openlayers/Format/WFST/v1.js",
                "openlayers/Format/WFST/v1_0_0.js",
                "openlayers/Format/WFST/v1_1_0.js",
                "openlayers/Format/Text.js",
                "openlayers/Format/JSON.js",
                "openlayers/Format/GeoJSON.js",
                "openlayers/Format/WMC.js",
                "openlayers/Format/WMC/v1.js",
                "openlayers/Format/WMC/v1_0_0.js",
                "openlayers/Format/WMC/v1_1_0.js",
                "openlayers/Format/WCSGetCoverage.js",
                "openlayers/Format/WMSCapabilities.js",
                "openlayers/Format/WMSCapabilities/v1.js",
                "openlayers/Format/WMSCapabilities/v1_1.js",
                "openlayers/Format/WMSCapabilities/v1_1_0.js",
                "openlayers/Format/WMSCapabilities/v1_1_1.js",
                "openlayers/Format/WMSCapabilities/v1_3.js",
                "openlayers/Format/WMSCapabilities/v1_3_0.js",
                "openlayers/Format/WMSCapabilities/v1_1_1_WMSC.js",
                "openlayers/Format/WMSGetFeatureInfo.js",
                "openlayers/Format/SOSCapabilities.js",
                "openlayers/Format/SOSCapabilities/v1_0_0.js",
                "openlayers/Format/SOSGetFeatureOfInterest.js",
                "openlayers/Format/SOSGetObservation.js",
                "openlayers/Format/OWSContext.js",
                "openlayers/Format/OWSContext/v0_3_1.js",
                "openlayers/Format/WMTSCapabilities.js",
                "openlayers/Format/WMTSCapabilities/v1_0_0.js",
                "openlayers/Format/WPSCapabilities.js",
                "openlayers/Format/WPSCapabilities/v1_0_0.js",
                "openlayers/Format/WPSDescribeProcess.js",
                "openlayers/Format/WPSExecute.js",
                "openlayers/Format/XLS.js",
                "openlayers/Format/XLS/v1.js",
                "openlayers/Format/XLS/v1_1_0.js",
                "openlayers/Format/OGCExceptionReport.js",
                "openlayers/Control/GetFeature.js",
                "openlayers/Control/NavToolbar.js",
                "openlayers/Control/PanPanel.js",
                "openlayers/Control/Pan.js",
                "openlayers/Control/ZoomIn.js",
                "openlayers/Control/ZoomOut.js",
                "openlayers/Control/ZoomPanel.js",
                "openlayers/Control/EditingToolbar.js",
                "openlayers/Control/Geolocate.js",
                "openlayers/Symbolizer.js",
                "openlayers/Symbolizer/Point.js",
                "openlayers/Symbolizer/Line.js",
                "openlayers/Symbolizer/Polygon.js",
                "openlayers/Symbolizer/Text.js",
                "openlayers/Symbolizer/Raster.js",
                "openlayers/Lang.js",
                "openlayers/Lang/en.js"
            ]; // etc.
        }

        // use "parser-inserted scripts" for guaranteed execution order
        // http://hsivonen.iki.fi/script-execution/
        var scriptTags = new Array(jsFiles.length);
        var host = OpenLayers._getScriptLocation() + "/";
        for (var i=0, len=jsFiles.length; i<len; i++) {
            scriptTags[i] = "<script src='" + host + jsFiles[i] +
                                   "'></script>"; 
        }
        if (scriptTags.length > 0) {
            document.write(scriptTags.join(""));
        }
    }
})();

/**
 * Constant: VERSION_NUMBER
 */
OpenLayers.VERSION_NUMBER="$Revision$";
