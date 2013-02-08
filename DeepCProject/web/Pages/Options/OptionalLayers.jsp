<%-- 
    Document   : OptionalLayers
    Created on : Aug 3, 2012, 6:38:05 PM
    Author     : olmozavala
--%>
<!-- This sections generate the menu of optional layers, normally vector layers -->
<table class="vectorLayer">
	<tr><td colspan="4" ><p class="invShadow" style="text-align: center; cursor:move; font-size: 12px">Optional Layers</p></td><tr>
	<c:forEach var="vectorLayer" items="${vectorLayers.childs}" varStatus="indice">
		<tr> 
			<td align="left">
				<button id="minusButtonOptional${indice.count - 1}" class="minusButtonSmall" type="button" disabled="disabled" 
						onmouseover ="changeColor(this,1);" onmouseout ="changeColor(this,0);" 
						onmouseup ="changeColor(this,1);" onmousedown ="changeColor(this,2);"
						onclick="changeTranspOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1}, .20, ${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count} ) ;">
					&#8210	
				</button>
				<button id="plusButtonOptional${indice.count - 1}" type="button" class="plusButtonSmall" 
						onmouseover ="changeColor(this,1);" onmouseout ="changeColor(this,0);" 
						onmouseup ="changeColor(this,1);" onmousedown ="changeColor(this,2);"
						onclick="changeTranspOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1}, -.20, ${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count});">
					+
				</button>
				<input id="checkBox${indice.count}" type="checkbox" name="vectorLayersSelected"  
					   value="${vectorLayer.node.id}" onclick="manageOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1},this.checked)"
		<c:if test='${vectorLayer.selected}'> checked </c:if>
		/> 
		${menuHelper:transName(vectorLayer,language)} 
		</td>
		<td align="right">
			<A href="${linksKmzVect[indice.count-1]}">
				<img src="${basepath}/common/images/kmz/kmz.png"
					 onmouseover="rollImage(this,'${basepath}/common/images/kmz/kmz_over.png' )"
					 onmouseout="rollImage(this,'${basepath}/common/images/kmz/kmz.png' )"
					 onmousedown="rollImage(this,'${basepath}/common/images/kmz/kmz_over_click.png' )"
					 onmouseup="rollImage(this,'${basepath}/common/images/kmz/kmz_over.png' )"
					 border="0" alt="Descargar KMZ" onload="CreateArraysOptional(${indice.count -1})"></A>
			&nbsp;
		</td> 
		</tr>
	</c:forEach>
</table>
