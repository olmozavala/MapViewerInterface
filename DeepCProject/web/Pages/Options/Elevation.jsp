<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<p class="defaultOptions"> 
	<button type="button" class="minusButton" id="minusButtonElevation" 
		 onclick="changeElevation('-', getMainLayer() );" >
		-
	</button>
	<span id="transText">Elevation </span>
	<button type="button" class="plusButton" id="plusButtonElevation" 
		 onclick="changeElevation('+', getMainLayer() );" disabled>
		+
	</button>
</p>
