<%-- 
    Document   : Transparency
    Created on : Aug 3, 2012, 6:19:41 PM
    Author     : olmozavala
--%>
<p class="alphaText"> 
	<img class="alphaText" id="alphaText_transminus" border="0" onclick="changeTransp(.15, layer1);" 
		 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
		 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
		 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="20" height="20" />
	Transparency 
	<img class="alphaText" id="alphaText_transplus" border="0" onclick="changeTransp(-.15, layer1);"
		 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
		 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
		 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="20" height="20" />
</p>
