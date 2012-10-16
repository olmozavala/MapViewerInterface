<%-- 
    Document   : Palettes
    Created on : Aug 3, 2012, 6:26:56 PM
    Author     : olmozavala
--%>
<!-- This tables displayes the current palette and the color range used on it -->


<c:if test='${netcdf}'>

    <table border="0" id="palette" cellpadding="3">
        <tr>
            <td> 
                <img id="imgPalette" src="${paletteUrl}" onclick="displayPalettes();" 
                     onmouseover="this.style.cursor ='pointer';"
                     onmouseout="this.style.cursor ='crosshair';"/>
            </td>
            <td class="waitBack">
                <p class="palMinMax">
                    &nbsp; 
                    Max:<input onblur="UpdatePalette(mappalette);" onfocus="keyboardnav.deactivate();" 
						onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						id="maxPal" name="maxPal" type="text" size="2" />
                    &nbsp;
                </p>
                <button type="button" class="buttonStyle" style="font-size:11px;" onclick="UpdatePalette(mappalette);" >
                    Update 
                </button>


                <p class="palMinMax">
                    &nbsp;
                    Min: <input onblur="UpdatePalette(mappalette);" onfocus="keyboardnav.deactivate();" 
						onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						id="minPal" name="minPal" type="text" size="2" />
                    &nbsp;
                </p>
            </td>

            <td valign="top"><button type="button" onclick="hidePalettes()">x</button></td>

        </tr>
    </table>
</c:if>