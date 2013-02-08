<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<table class="elevationTable" border="0">
	<tr>
		<td style="text-align: right;">
			<img class="minusButton" id="minusButtonElevation" onclick="changeElevation('-',getMainLayer());" 
				 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
				 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
				 onmousedown="rollImage(this,'${basepath}/common/images/Menu/MinusPressed.png' )"
				 onmouseup="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
				 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="15" height="15" />
		</td>
		<td>
			<p id="elevationText" class="buttonStyle" onclick="displayElevationSelector();" onmouseover="hoverInstructions('elevationParentHover', '1')" onmouseout="hoverInstructions('elevationParentHover', '2')">
				Depth	

			</p>
		</td>
		<td style="text-align: left;">
			<img class="plusButton" id="plusButtonElevation" onclick="changeElevation('+',getMainLayer());" 
				 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
				 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
				 onmousedown="rollImage(this,'${basepath}/common/images/Menu/PlusPressed.png' )"
				 onmouseup="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
				 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="15" height="15" />
		</td>
	</tr>
</table>
