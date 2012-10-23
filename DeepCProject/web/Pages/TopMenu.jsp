<!-- Menu for Users -->
<div id="layersMenu" class="layersMenu">
    <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">

        <table name="menuTable" border="0" align="center" style="padding-top:3px;" >
            <tr>
                <td>
					<span id="mainMenuParent">
						${menuHelper:createMainMenu(MenuDelUsuario,language)}
					</span>
                </td>

			<c:choose>
                <c:when test='${netcdf}'>
					<td id="hideCalendarParent" valign="middle">
                        <button type="button" class="buttonStyle"   id="hideCalendar" onclick="hideCalendarFunc();"  >Hide Calendar</button>
                    </td>
				</c:when>
            </c:choose>

			<td valign="middle">
				<!-- Link to download kml files-->
				<span  id="mainKmlParent" > <%@include file="Options/KmlLink.jsp" %></span></td>
			<td valign="middle">
				<!-- Transparency -->
				<span id="transParent"><%@include file="Options/Transparency.jsp" %></span></td>

            <c:choose>
                <c:when test='${netcdf}'>
                    <!-- Elevation -->
                    <td valign="middle">
                        <span id="elevationParent"><%@include file="Options/Elevation.jsp" %><span id="elevationSelector">

							</span></span>
					</td>
                    <td valign="middle">
                        <button type="button" class="buttonStyle" onclick="showPalettes()" >
                            Color Tools
                        </button>

                    </td>


					<td valign="middle">
						<span id="transectParent">
							<button type="button" name="type" value="line" id="lineToggle" class="buttonStyle" onclick="toggleControl(this);" >Transect Tool</button>
						</span>
					</td>
                </c:when>
				<c:when test='${!netcdf}'>
					<!-- Download data-->
					<td id="downloadDataParent" valign="middle"><%@include file="Options/DownloadData.jsp" %></td>
				</c:when>
            </c:choose>

            <td id="resizeScreenParent" valign="middle">
                <!-- Resize window -->
                <button type="button" id="resizeScreenText" class="buttonStyle" onclick="refreshWindow();" >
                    Refresh
                </button>

            </td>
            <td id="emailParent" valign="middle"> <!-- Email -->


                <a href="mailto:osz09@gmail.com">
                    <button type="button" class="buttonStyle" id="emailText" onclick="MapViewersubmitForm();" >
                        Contact
                    </button>
                </a>
            </td>

            <td id="helpParent" valign="middle">
                <!-- Map Instructions-->
                <button type="button" class="buttonStyle" id="helpText" onclick="displayHelp();" atl="Help" />Help</button>

            </td>

            </tr>
        </table>

        <!-- List of optional layers -->
        <span id="optionalMenuParent"><%@include file="Options/OptionalLayers.jsp" %></span>


        <c:if test='${netcdf}'>
            <!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

        </c:if>
        <span id="helpDiv" style="border-radius: 10px;">
            <%@include file="Options/MapInstructions.jsp" %>

        </span> 

    </form>

</div>





