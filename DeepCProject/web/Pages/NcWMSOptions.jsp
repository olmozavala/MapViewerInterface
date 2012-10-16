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
				<p class="defShadow">Select new palette <button type="button" class="cancelButton" onclick="displayPalettes()">x</button>
				<table id="palettesTable"></table></p>
			</div>

			<!-- Divs that hold the start and end calendar plus the related texts -->
			<div id="calendarParent">
				<div class="startDateCal" id="cal-start"><p class="calTitle" >Start date (Current)</p></div>
				<div class="endDateCal" id="cal-end"><p class="calTitle" >End date</p></div>
				<div class="dispAnimation" id="p-animation">
					<table >
						<tr><td style="width:140px">
								<p class="buttonStyle" onclick="dispAnimation();" > Display animation </p> </td>
							<td style="width:190px; text-align: center" >
								<select id="timeSelect" name="timeSelect">
								</select>
							</td>
						</tr>
					</table>
				</div>
			</div>
	</c:if>
