<%-- 
    Document   : MapInstructions
    Created on : Aug 3, 2012, 6:45:15 PM
    Author     : olmozavala
--%>
<table class="helpInstructions" id="helpInstructions" >
	<tr><th colspan="2" >
			<font color="black">Map Instructions</font><span type="button" class="buttonStyle " style="float:right" onclick="displayHelp()">x</span>
		</th>
	</tr>
	<tr><td width="210" style="text-align:center;"><img src="${basepath}/common/images/icon/mouse_cursor.png">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="${basepath}/common/images/icon/keyboard_keys.gif"></td><td><b>Move map:</b>
			<BR/> - Click the map with the mouse, while holding the left mouse button and drag around the map. <BR/> - You can also use your keyboard arrows to move the map.
		</td>
	</tr>
	<tr><td style="text-align:center;">
			<table align="center">
				<tr><td>
						<img src="${basepath}/common/JS/openlayers/img/zoom-plus-mini.png" >
						<br><br>

						<img src="${basepath}/common/JS/openlayers/img/zoom-minus-mini.png">
					</td>
					<td>
						<img src="${basepath}/common/images/icon/mouse_wheel.jpg" style="padding-left:30px;">
					</td>
				</tr>
			</table>
		</td>
		<td>
			<b>Zoom map:</b>
			<BR/>- Use <img src="${basepath}/common/JS/openlayers/img/zoom-plus-mini.png" > 
			and <img src="${basepath}/common/JS/openlayers/img/zoom-minus-mini.png" > buttons located at the top left to zoom.
			<BR/>- Use mouse wheel to zoom in and out.
		</td>
	</tr>
	<tr><td style="text-align:center;"><img src="${basepath}/common/images/icon/editing_tool_bar.png" />&nbsp;&nbsp;&nbsp;<img src="${basepath}/common/images/icon/hand_bar.png" /></td><td><b>Transect tool:</b><Br/>- With this tool you can choose different points under the map, and it will create two graphs. The first graph will show you how the variables (temperature, salinity, velocity, etc.) change as they move along the points you draw based on latitude and longitude. The second graph shows how the chosen variable changes through out different depths <br/>- First click on the <img src="${basepath}/common/images/icon/editing_tool_bar.png" /> icon to get started.
			<Br/>- Then click some point in the map to select your starting point in the transect. Keep clicking around to create more points. Once the last point is chosen, double click it to pop up the graphs. 
			<BR/>- To create another graph, simply make a new drawing and the last one will disappear.
			<BR/>- To exit the transect tool click on the <img src="${basepath}/common/images/icon/hand_bar.png" /> icon.
		</td></tr>

	<tr><td style="text-align: center;"><p class="alphaText" style="cursor: default"> 

				<img  src="${basepath}/common/images/Menu/Minus.png" alt="DecElevation" width="20" height="20" />
				Elevation 
				<img src="${basepath}/common/images/Menu/Plus.png" alt="IncElevation" width="20" height="20" />
			</p></td><td><b>Change Elevation:</b><BR/>- By default the application starts with the possible highest elevation, so you see don't see the <img src="${basepath}/common/images/Menu/Plus.png" alt="IncElevation" width="20" height="20" /> sign because we are currently at the maximum possible elevation.
			<Br/>- If you press the <img  src="${basepath}/common/images/Menu/Minus.png" alt="DecElevation" width="20" height="20" /> sign the elevation on the map will change and it will display new data specific of that elevation. You can keep going pressing this button until you reach the maximum depth in the current data set. 

		</td></tr>

	<tr><td style="text-align: center;"><p class="alphaText" style="cursor: default"> 
				<img  src="${basepath}/common/images/Menu/Minus.png" alt="DecElevation" width="20" height="20" />
				Transparency 
				<img src="${basepath}/common/images/Menu/Plus.png" alt="IncElevation" width="20" height="20" />
			</p></td><td><b>Change Transparency:</b><BR/>- If you would like to make the colors a little more dim, you can use this tool to change the transparency of the dataset. </td></tr>


	<tr><td style="text-align:center">
			<img src="${basepath}/common/images/icon/current_layer.png" />



		</td><td><b>Current layer:</b><BR/>You can toggle between the different variable options for the layers such as temperature, salinity, velocity, etc. You can also specify the year of the data you would like to see. </td></tr>

	<tr><td style="text-align:center;"> <img src="${basepath}/common/images/icon/palette_help.png" />      </td><td><b>Change color palette:</b><BR/>If you click on this icon it will pop a menu from which you can change the colors.<BR/>
			<b>Change color range:</b><BR/>You can also choose a range of maximum and minimum values for the temperature, this will change the color ranges allowed in the map. The minimum temperature must always be lower than the maximum value. Once a desired number is chosen click the update button to see the changes in the map.


		</td></tr>


	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">
				<img  border="0" src="${basepath}/common/images/kmz/google_earth_logo.png" width="35" height="32" alt="Descargar en KML" />
				Kml data</span></td><td><b>Download Data:</b><BR/>- Click this button to download current dataset in a KMZ format which can be viewed with Google Earth.</td></tr>
	<tr><td><table class="vectorLayer">
				<tr> 
					<td>
						<input  type="checkbox" disabled="disabled" /> 
						US States                    </td>
					<td align="RIGHT">

						<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ">
						&nbsp;
					</td> 
				</tr>
				<tr> 
					<td>
						<input  type="checkbox" disabled="disabled" /> 
						DeepC                    </td>
					<td align="RIGHT">

						<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ">
						&nbsp;
					</td> 
				</tr>
				<tr> 
					<td>
						<input  type="checkbox" disabled="disabled" /> 
						GEBCO Bathymetry                  </td>
					<td align="RIGHT">

						<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ">
						&nbsp;
					</td> 
				</tr>
			</table></td><td><b>Optional layers:</b><Br/>You can turn them on or off. For example if you want to show the US States on the map then you check the box of US States. </td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Resize window</span></td><td><b>Resize window:</b><BR/>- If you need to adjust the map size to your current window size.</td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Email</span> </td><td><b>Contact us:</b><BR/>-If you have any questions or want to report a bug.</td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Help</span></td><td><b>Help menu:</b><BR/>- Display Instructions</td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Display Animation</span></td><td><b>Animations:</b><BR/>- Choose a beginning date in the calendar as a starting date. Depending if the dataset is weekly, monthly, or yearly the end calendar will change accordingly to the maximum time range allowed. 
			<BR/>- Choose an ending date. Note that a "Display animation" button is now showing up. Chose a frame you would like and click Display animation.
			<BR/>- Wait while the animation is being loaded. This might take a few seconds depending on the time range selected.                                                
		</td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Stop animation</span></td><td><b>Stop animation:</b><BR/>-This button will disable the animation.</td></tr>
	<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Hide Calendar</span></td><td><b>Hide Calendar:</b><BR/>-Toggle between this option to show/hide the calendar.</td></tr>
</table>    