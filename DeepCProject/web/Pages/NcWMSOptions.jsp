<%-- 
    Document   : Calendars
    Created on : Aug 3, 2012, 5:53:19 PM
    Author     : olmozavala
--%>
<!-- Hold the gif of the animation, it is called by OpenLayers -->
<div id="mapOverlayDiv" ><img id="mapOverlay" alt="map overlay" onload="javascript:animationLoaded();" /></div>

<c:if test='${netcdf}' >
    <!-- Holds the optional palettes -->
    <div class="palettesDiv" id="palettes-div">
        <span class="defShadow">Select new palette </span> <button type="button" class="closeButton" style="float:right;" onclick="displayPalettes()">x</button>
        <table id="palettesTable"></table>
    </div>

    <!-- Divs that hold the start and end calendar plus the related texts -->

	<div id="CalendarsAndStopContainer">
		<table id="CalendarParent" border="0">
			<!--<tr><th colspan="2"><p class="defShadow">Dates range for Base layer</p></th></tr>-->
			<tr>
				<td><span id="hideOneDay" class="calTitle ie_shadow"> Start date (Current)</span></td>
                                <td><span id="hideOneDayEnd" class="calTitle ie_shadow" style="padding-right:0px;">End date </span><span class="closeButton" onclick="hideCalendarFunc();" style="position:absolute;right:5px;top:5px;">x</span></td>
                                
			</tr>
			<tr>
				<td> <div class="startDateCal" id="cal-start"> </div> </td>
				<td> <div class="endDateCal" id="cal-end"> </div> </td>
			</tr>
			<tr>
				<td  style="text-align: center">
					<div class="dispAnimation" id="p-animation">
						<button type="button" style="display:inline" 
								class="buttonStyle" onclick="dispAnimation();" > 
							Display animation </button> 
                                        </td><td>
						<select id="timeSelect" name="timeSelect">
						</select>
					</div>
				</td>
			</tr>
		</table>
		<div id="s-animation" > 
			<button type="button" 
					onclick="stopAnimation();" 
					class="buttonStyle" >Stop Animation</button>
		</div> 
	</div>
</c:if>
