<%-- 
    Document   : OptionalPalettes
    Created on : Feb 8, 2013, 1:50:00 PM
    Author     : olmozavala
--%>
<!-- Holds the optional palettes -->
<div class="palettesDiv" id="palettes-div">
	<table id="optionalPalettesHeader">
		<tr>
			<td> <p class="defShadow">Select new palette </p> </td>
			<td>
				<p class="buttonStyle reducedPadding" 
				   id="defaultColorRangeButton" onclick="DefaultPalette();"> Default</p>	
			</td>
			<td>
				<span class="closeButton" onclick="displayOptionalPalettes();" >x</span>
			</td>
		</tr>
	</table>
	<table id="palettesTable"></table>
</div>