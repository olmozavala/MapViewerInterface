<%-- 
    Document   : Palettes
    Created on : Aug 3, 2012, 6:26:56 PM
    Author     : olmozavala
--%>
<!-- This tables displayes the current palette and the color range used on it -->


<c:if test='${netcdf}'>
	<table border="0" id="palette" cellpadding="3">
		<tr>
			<td rowspan="3"> 
				<img id="imgPalette" src="${paletteUrl}" onclick="displayPalettes();" 
				     onmouseover="this.style.cursor ='pointer';"
				     onmouseout="this.style.cursor ='crosshair';" onload="getDefault()"/>
			</td>
			<td class="waitBack">
				<p class="palMinMax">
					Max:<input onblur="UpdatePalette(mappalette);" onfocus="keyboardnav.deactivate();" 
						   onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						   id="maxPal" name="maxPal" type="text" size="2" />
					<img class="plusButton" id="plusButtonElevation" onclick="increaseMaxColorRange(1);" 
					     onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					     onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
					     onmousedown="rollImage(this,'${basepath}/common/images/Menu/PlusPressed.png' )"
					     onmouseup="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					     src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" />

					<img class="minusButton" id="minusButtonElevation" onclick="increaseMaxColorRange(-1);" 
					     onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					     onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
					     onmousedown="rollImage(this,'${basepath}/common/images/Menu/MinusPressed.png' )"
					     onmouseup="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					     src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />

				</p>
			</td>
			<td valign="top"><button type="button" class="closeButton" onclick="hidePalettes()">x</button></td>
		</tr>
		<tr >
			<td height="40px">
				<button type="button" class="buttonStyle" style="font-size:11px;" onclick="UpdatePalette(mappalette);" >
					Update 
				</button>
				<button type="button" class="buttonStyle" style="font-size:11px;" onclick="setColorRangeFromMinMax();" >
					Auto 
				</button>
			               
                <button type="button" class="buttonStyle" style="font-size:11px;" onclick="DefaultPalette();" >
					Default
				</button>
                
            </td>
		</tr>
		<tr>
			<td class="waitBack">
				<p class="palMinMax">
					Min: <input onblur="UpdatePalette(mappalette);" onfocus="keyboardnav.deactivate();" 
						    onkeydown="if(event.keyCode == 13) UpdatePalette(mappalette);"
						    id="minPal" name="minPal" type="text" size="2" />

					<img class="plusButton" id="plusButtonElevation" onclick="decreaseMinColorRange(-1);" 
					     onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					     onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
					     onmousedown="rollImage(this,'${basepath}/common/images/Menu/PlusPressed.png' )"
					     onmouseup="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					     src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" />

					<img class="minusButton" id="minusButtonElevation" onclick="decreaseMinColorRange(1);" 
					     onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					     onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
					     onmousedown="rollImage(this,'${basepath}/common/images/Menu/MinusPressed.png' )"
					     onmouseup="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					     src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
				</p>

			</td>
		</tr>
	</table>
</c:if>