<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<p class="alphaText"> 

	<img id="alphaText_elevminus" border="0" onclick="changeElevation('-', layer1);" 
		 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
		 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
		 src="${basepath}/common/images/Menu/Minus.png" alt="DecElevation" width="20" height="20" />
	Elevation 
	<img id="alphaText_elevplus" border="0" onclick="changeElevation('+', layer1);"
		 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
		 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
		 src="${basepath}/common/images/Menu/Plus.png" alt="IncElevation" width="20" height="20" />
</p>