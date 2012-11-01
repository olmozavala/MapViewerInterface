<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<table class="elevationTable" >
	<tr>
		<td>
			<img class="minusButton" id="minusButtonElevation" onclick="changeElevation('-',getMainLayer());" 
				 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
				 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
				 onmousedown="rollImage(this,'${basepath}/common/images/Menu/MinusPressed.png' )"
				 onmouseup="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
				 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
		</td>
		<td>
			<p id="elevationText" class="buttonStyle" onclick="displayElevationSelector();" >
				Depth	

			</p>
		</td>
		<td>
			<img class="plusButton" id="plusButtonElevation" onclick="changeElevation('+',getMainLayer());" 
				 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
				 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
				 onmousedown="rollImage(this,'${basepath}/common/images/Menu/PlusPressed.png' )"
				 onmouseup="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
				 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" />
		</td>
	</tr>
</table>

<span id="elevationSelector">

</span>