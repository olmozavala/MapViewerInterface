<%-- 
    Document   : OptionalLayers
    Created on : Aug 3, 2012, 6:38:05 PM
    Author     : olmozavala
--%>

<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<!-- This sections generate the menu of optional layers, normally vector layers -->
<table class="vectorLayer" border="0">
    <tr>
		<td colspan="4" >
			<p class="invShadow optionalTitle" style="text-align: center; cursor:move;">
															<fmt:message key="main.optional" /></p>
			<span class="minimizeButton" onclick="minimizeWindow('optionalsMinimize', 'optionalMenuParent')" 
				  style="position:absolute;right:7px;top:7px;">-</span>
		</td>
	<tr>
	<tr>
		<td colspan="4">
			${menuHelper:createOptionalLayersMenu(vectorLayers,language, basepath)}
		</td>
	</tr>
</table>
