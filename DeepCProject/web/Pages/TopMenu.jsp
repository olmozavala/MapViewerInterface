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
					<td id="hideCalendarParent">
                        <button type="button" class="buttonStyle"   id="hideCalendar" onclick="hideCalendarFunc();"  >Hide Calendar</button>
                    </td>
				</c:when>
            </c:choose>

			<td>
				<!-- Link to download kml files-->
				<span  id="mainKmlParent" > <%@include file="Options/KmlLink.jsp" %></span></td>
			<td>
				<!-- Transparency -->
				<span id="transParent"><%@include file="Options/Transparency.jsp" %></span></td>

            <c:choose>
                <c:when test='${netcdf}'>
                    <!-- Elevation -->
                    <td>
                        <span id="elevationParent"><%@include file="Options/Elevation.jsp" %></span>
                    </td>

                    <td>
                        <button type="button" class="buttonStyle" onclick="showPalettes()" >
                            Color Tools
                        </button>

                        <!-- Current palette and color range -->
                        <span id="palettesParent"> <%@include file="Options/Palettes.jsp" %> </span>
                    </td>


					<td>
						<span id="transectParent">
							<button type="button" name="type" value="line" id="lineToggle" class="buttonStyle" onclick="toggleControl(this);" >Transect Tool</button>
						</span>
					</td>
                </c:when>
				<c:when test='${!netcdf}'>
					<!-- Download data-->
					<td id="downloadDataParent"><%@include file="Options/DownloadData.jsp" %></td>
				</c:when>
            </c:choose>

            <td id="resizeScreenParent">
                <!-- Resize window -->
                <button type="button" id="resizeScreenText" class="buttonStyle" onclick="refreshWindow();" >
                    Refresh
                </button>

            </td>
            <td id="emailParent"> <!-- Email -->


                <a href="mailto:osz09@gmail.com">
                    <button type="button" class="buttonStyle" id="emailText" onclick="MapViewersubmitForm();" >
                        Email
                    </button>
                </a>
            </td>

            <td id="helpParent">
                <!-- Map Instructions-->
                <button type="button" class="buttonStyle" id="helpText" onclick="displayHelp();" atl="Help" />Help</button>

            </td>

            </tr>
        </table>

        <!-- List of optional layers -->
        <span id="optionalMenuParent"><%@include file="Options/OptionalLayers.jsp" %></span>


        <c:if test='${netcdf}'>
            <!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

            <span id="s-animation"  class="stop_button"> <button type="button" onclick="stopAnimation();" class="buttonStyle" style="font-size:12px;" >Stop Animation</button></span> 
            <p id="l-animation" class="defShadow loading_msg"> Loading 
                <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading"></A>
            </p>

            <!--</span>-->
        </c:if>
        <span id="helpDiv">
            <%@include file="Options/MapInstructions.jsp" %>

        </span> 

    </form>

</div>





