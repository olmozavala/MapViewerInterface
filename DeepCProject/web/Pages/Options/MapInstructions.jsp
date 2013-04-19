<%-- 
    Document   : MapInstructions
    Created on : Aug 3, 2012, 6:45:15 PM
    Author     : olmozavala
--%>
<!-- This are the map instructions -->

<table class="helpInstructionsParentTable" id="helpInstructions" border="0" >
	<tr>
		<td>
			<div style="overflow: hidden">
				<table style="width:100%">
					<tr>
						<td style="text-align: center"><font color="white" size="5" ><fmt:message key="main.help" /></font> </td>
						<td>
							<span type="button" class="closeButton helpClose" onclick="displayHelp()">x</span>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class="helpInstructionsContent" id="helpInstructionsContent"> 
				<table >
					<tr>
						<td id="helpInstructions" >
							<table border="0" cellpadding="5" cellmargin="7" align="center" id="align_left">
								<tr><td width="210" style="text-align:center;">
										<img src="${basepath}/common/images/icon/mouse_cursor.png"></td><td><b>Move map:</b><BR/> - Click the map with the mouse, while holding the mouse button and drag around the map.</td></tr>
								<tr><td style="text-align:center;">
										<table align="center" >
											<tr><td style="border:none;">
													<img src="${basepath}/common/images/OpenLayers/zoom-plus-mini.png" >
													<br><br>

													<img src="${basepath}/common/images/OpenLayers/zoom-minus-mini.png">
												</td>
												<td style="border:none;">
													<img src="${basepath}/common/images/icon/mouse_wheel.jpg" style="padding-left:30px;">
												</td>
											</tr>
										</table>
									</td>
									<td>
										<b>Zoom map:</b>

										<BR/>- Use  <img src="${basepath}/common/images/OpenLayers/zoom-plus-mini.png" > 
										and <img src="${basepath}/common/images/OpenLayers/zoom-minus-mini.png" > buttons located at the top left to zoom.
										<BR/>- Use mouse wheel to zoom in and out.
									</td>
								</tr>
								<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Transect Tool</span></td><td><b>Transect tool:</b><Br/>- With this tool you can choose different points under the map, and it will create two graphs. The first graph will show you how the variables (temperature, salinity, velocity, etc.) change as they move along the points you draw based on latitude and longitude. The second graph shows how the chosen variable changes through out different depths <br/>- First click on the Transect tool icon to get started.
										<Br/>- Then click some point in the map to select your starting point in the transect. Keep clicking around to create more points. Once the last point is chosen, double click it to pop up the graphs. 
										<BR/>- To create another graph, simply make a new drawing and the last one will disappear.
										<BR/>- To exit the transect tool click on the Unselect icon.
									</td></tr>

								<tr><td style="text-align: center;">

										<table cellpadding="1" border="0"  style="cursor: default" align="center">
											<tr>
												<td style="border:none;"><button type="button" class="minusButton" disabled="disabled">
														-
													</button></td>

												<td style="border:none;">	
													<span class="buttonStyle no_hover" style="cursor:default;" ><fmt:message key="ncwms.depth" /></span>
												</td>
												<td style="border:none;">
													<button class="plusButton" disabled="disabled" type="button" >
														+
													</button>
												</td>
											</tr>		       
										</table>	


									</td><td><b>Change Depth or Precipitation:</b><BR/>- By default the application starts with the possible highest elevation/precipitation, if you click the + or - it will change the elevation/precipitation. If you click the elevation/precipitation text then a windows will pop up and will let you choose the desired elevation/precipitation. 

									</td></tr>

								<tr><td style="text-align: center;">

										<table cellpadding="1" border="0"  style="cursor: default;" align="center">
											<tr>
												<td style="border:none;"><button class="minusButton" type="button" disabled="disabled">
														-

													</button></td>

												<td style="border:none;">
													<span class="buttonStyle no_hover" style="cursor:default;" >Transparency </span>
												</td>
												<td style="border:none;">


													<button type="button" class="plusButton" disabled="disabled">
														+

													</button>

												</td>
											</tr>
										</table>
									</td><td><b>Change Transparency:</b><BR/>- If you would like to make the colors a little more dim, you can use this tool to change the transparency of the dataset. </td></tr>


								<tr><td style="text-align:center">
										<img src="${basepath}/common/images/icon/current_layer_topMenu.png" />



									</td><td><b>Current layer:</b><BR/>You can toggle between the different variable options for the layers such as temperature, salinity, velocity, etc. You can also specify the year of the data you would like to see. </td></tr>

								<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;" >
											Color Tools
										</span>  </td><td><b>Change color range:</b><BR/>You can also choose a range of maximum and minimum values for the temperature, this will change the color ranges allowed in the map. The minimum temperature must always be lower than the maximum value. Once a desired number is chosen click the update button to see the changes in the map. <BR/>If you want to select a different palette color  such as gradient then click the <img src="${basepath}/common/images/icon/palette_help_topMenu.png"  height="70px"/> icon.


									</td></tr>


								<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;" >
											<img  border="0" src="${basepath}/common/images/kmz/google_earth_logo.png" width="35" height="32" alt="Descargar en KML" />
											Kml data</span></td><td><b>Download Data:</b><BR/>- Click this button to download current dataset in a KMZ format which can be viewed with Google Earth.</td></tr>
								<tr><td ><table class="vectorLayer" align="center">
											<tr> 
												<td style="border:none;">
													<input  type="checkbox" disabled="disabled" /> 
													US States                    </td>
												<td align="RIGHT" style="border:none;">

													<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ">
													&nbsp;
												</td> 
											</tr>
											<tr> 
												<td style="border:none;">
													<input  type="checkbox" disabled="disabled" /> 
													DeepC                    </td>
												<td align="RIGHT" style="border:none;">

													<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ">
													&nbsp;
												</td> 
											</tr>
											<tr> 
												<td style="border:none;">
													<input  type="checkbox" disabled="disabled" /> 
													GEBCO Bathymetry                  </td>
												<td align="RIGHT" style="border:none;">

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
								<tr><td style="text-align:center;"><span class="buttonStyle no_hover" style="cursor:default;">Ctrl +/-</span></td><td><b>Change Font Size:</b><BR/>-Change the font size by pressing Ctrl + and Ctrl - on you keyboard. If you press Ctrl 0 it will make the font the default size.</td></tr>
							</table>    
						</td>
					</tr>
				</table>

			</div>
		</td>
	</tr>
</table>

