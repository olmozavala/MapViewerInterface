<%-- 
    Document   : Transparency
    Created on : Aug 3, 2012, 6:19:41 PM
    Author     : olmozavala
--%>
	<table class="elevationTable" border="0">
		<tr>
			<td style="text-align: right;">
				<img class="minusButton" id="minusButtonTrans" onclick="changeTranspManager(.15, 'master');" 
					 onmouseover="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Minus.png' )"
					 onmousedown="rollImage(this,'${basepath}/common/images/Menu/MinusPressed.png' )"
					 onmouseup="rollImage(this,'${basepath}/common/images/Menu/MinusInv.png' )"
					 src="${basepath}/common/images/Menu/Minus.png" alt="DecTrans" width="15" height="15" />
			<td>
				<p id="transText" class="defaultOptions">Transparency</p>
			</td>
			<td style="text-align: left;">
				<img class="plusButton" id="plusButtonTrans" onclick="changeTranspManager(-.15, 'master');" 
					 onmouseover="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					 onmouseout="rollImage(this,'${basepath}/common/images/Menu/Plus.png' )"
					 onmousedown="rollImage(this,'${basepath}/common/images/Menu/PlusPressed.png' )"
					 onmouseup="rollImage(this,'${basepath}/common/images/Menu/PlusInv.png' )"
					 src="${basepath}/common/images/Menu/Plus.png" alt="IncTrans" width="15" height="15" />
			</td>
		</tr>
	</table>