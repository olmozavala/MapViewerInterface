<%-- 
    Document   : Palettes
    Created on : Aug 3, 2012, 6:26:56 PM
    Author     : olmozavala
--%>
<!-- This tables displayes the current palette and the color range used on it -->
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
				max: <input onblur="UpdatePalette(mappalette);" 
						onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						id="maxPal" name="maxPal" type="text" size="2" /> 
				&nbsp;
			</p>
			<p class="small awesome" style="font-size:9px;" onclick="UpdatePalette(mappalette);" > Update </p>
			<p class="palMinMax">
				&nbsp;
				min: <input onblur="UpdatePalette(mappalette);" 
						onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						id="minPal" name="minPal" type="text" size="2" />
				&nbsp;
			</p>
		</td>
	</tr>
</table>


				 <!--
<c:if test='${netcdf}'>

    <table border="0" id="palette" align="center" cellpadding="1">
        <tr>
            <td> 
                <img id="imgPalette" src="${paletteUrl}" onclick="displayPalettes();" 
                     onmouseover="this.style.cursor ='pointer';"
                     onmouseout="this.style.cursor ='crosshair';"/>
            </td>
            <td class="waitBack">
                <p class="palMinMax">
                    &nbsp; 
                    Max: <input id="maxPal" name="maxPal" type="text" size="4" /> 
                    &nbsp;
                </p>
                <button type="button" class="small awesome" style="font-size:11px;" onclick="UpdatePalette(mappalette);" >
                    Update 
                </button>


                <p class="palMinMax">
                    &nbsp;
                    Min: <input  id="minPal" name="minPal" type="text" size="4" />
                    &nbsp;
                </p>
            </td>

            <td valign="top"><button type="button" onclick="hidePalettes()">x</button></td>

        </tr>
    </table>
</c:if>
	 -->
