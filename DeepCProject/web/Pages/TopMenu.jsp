<!-- Menu for Users -->
<div id="layersMenu" class="layersMenu">
    <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">

        <table name="menuTable" border="0" align="center" style="padding-top:3px;" border="1" >
            <tr>
                <td>
					<span id="mainMenuParent" onmouseover="hoverInstructions('mainMenuParentHover', '1')" onmouseout="hoverInstructions('mainMenuParentHover', '2')" >
						${menuHelper:createMainMenu(MenuDelUsuario,language)}

						<span id="mainMenuParentHover" class="commonHover"  >&nbsp;Layer Variable and Year&nbsp;</span>
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
				<span  id="mainKmlParent" onmouseover="hoverInstructions('mainKmlParentHover', '1')" onmouseout="hoverInstructions('mainKmlParentHover', '2')"  > <%@include file="Options/KmlLink.jsp" %>

					<span id="mainKmlParentHover" class="commonHover" >&nbsp;Open current animation/display of map in Google Earth&nbsp;</span>


				</span></td>
			<td valign="middle">
				<!-- Transparency -->
				<span id="transParent" onmouseover="hoverInstructions('transParentHover', '1')" onmouseout="hoverInstructions('transParentHover', '2')"  ><%@include file="Options/Transparency.jsp" %>

					<span id="transParentHover" class="commonHover">


						&nbsp;Change the color transparency of current layer to view the underneath topology &nbsp;

					</span>

				</span></td>

            <c:choose>
                <c:when test='${netcdf}'>
                    <!-- Elevation -->
					<span id="elevationSelector"> </span>
                    <td valign="middle" style="position:relative;">
                        <span id="elevationParent" onmouseover="hoverInstructions('elevationParentHover', '1')" onmouseout="hoverInstructions('elevationParentHover', '2')"  ><%@include file="Options/Elevation.jsp" %>
                            <span id="elevationParentHover" class="commonHover">
                                Change the elevation/pressure level of the layer. Click the - sign to decrease and the + to increase. Press the middle button to select a level                          

                            </span>
						</span>
					</td>
                    <td valign="middle" onmouseover="hoverInstructions('palettesHover', '1')" onmouseout="hoverInstructions('palettesHover', '2')">
                        <button type="button" class="buttonStyle" onclick="showPalettes()"  >
                            Color Palette
                        </button>

                        <span id="palettesHover" class="commonHover">Change the color ranges displayed and choose the color pattern of your choice</span>
                    </td>


					<td valign="middle" onmouseover="hoverInstructions('transectParentHover', '1')" onmouseout="hoverInstructions('transectParentHover', '2')">
						<span id="transectParent">
							<button type="button" name="type" value="line" id="lineToggle" class="buttonStyle" onclick="toggleControl(this);" >Transect Tool</button>


							<span id="transectParentHover" class="commonHover">Draw a line(s) by clicking on the map on different points and then double click to display graph of chosen points</span>

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


                <a href="mailto:osz09@fsu.edu">
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





