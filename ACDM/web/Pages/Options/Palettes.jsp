<%-- 
    Document   : Palettes
    Created on : Aug 3, 2012, 6:26:56 PM
    Author     : olmozavala
--%>
<!-- This tables displayes the current palette and the color range used on it -->

<c:if test='${netcdf}'>
<table border="0" class="palette" align="center">
	<tr>
		<td> 
			<img id="imgPalette" src="${paletteUrl}" onclick="displayPalettes();" 
				 onmouseover="this.style.cursor ='pointer';"
				 onmouseout="this.style.cursor ='crosshair';"/>
		</td>
		<td class="waitBack">
			<p class="palMinMax">
				&nbsp; 
				max: <input id="maxPal" name="maxPal" type="text" size="2" /> 
				&nbsp;
                        </p>
				<br><p class="small awesome" style="font-size:11px;" onclick="UpdatePalette(mappalette);" >
							Update 
						</p>
                        
                                <br><BR/>
                                	<p class="palMinMax">
				&nbsp;
				min: <input  id="minPal" name="minPal" type="text" size="2" />
				&nbsp;
			</p>
		</td>
	</tr>
</table>
</c:if>