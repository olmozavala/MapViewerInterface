<%-- 
    Document   : OptionalLayers
    Created on : Aug 3, 2012, 6:38:05 PM
    Author     : olmozavala
--%>
<!-- This sections generate the menu of optional layers, normally vector layers -->
<table class="vectorLayer">
	<c:forEach var="vectorLayer" items="${vectorLayers.childs}" varStatus="indice">
		<tr> 
			<td>
				<input id="checkBox${indice.count}" type="checkbox" name="vectorLayersSelected"
					   value="${vectorLayer.node.id}" onclick="manageOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1},this.checked)"
					   <c:if test='${vectorLayer.selected}'> checked </c:if>
					   /> 
				${menuHelper:transName(vectorLayer,language)} 
			</td>
			<td align="RIGHT">
				<A href="${linksKmzVect[indice.count-1]}">
					<img src="${basepath}/common/images/kmz/kmz.png" border="0" alt="Descargar KMZ"></A>
				&nbsp;
			</td> 
		</tr>
	</c:forEach>
</table>
