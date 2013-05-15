<%-- 
    Document   : OptionalLayers
    Created on : May 15, 2013, 1:15:26 PM
    Author     : Olmo Zavala Romero
--%>

<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<!-- This sections generate the menu of optional layers, normally vector layers -->
<table class="vectorLayer" border="0">
    <tr>
		<td colspan="4" >
			<p class="invShadow" style="text-align: center; cursor:move; font-size: 12px;padding-right:5px;">
															<fmt:message key="main.optional" /></p>
		</td>
	<tr>
	<tr>
		<td colspan="4">
			${menuHelper:createOptionalLayersMenu(vectorLayers,language, basepath)}
		</td>
	</tr>
</table>