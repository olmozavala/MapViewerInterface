<%-- 
    Document   : CQLFilter
    Created on : Feb 18, 2013, 10:50:57 AM
    Author     : olmozavala
--%>

<span class="draggableWindow" id="ocqlFilterInputTextParent" 
	  onmouseover="hoverInstructions('ocqlFilterText', '1')" 
	  onmouseout="hoverInstructions('ocqlFilterText', '2')"  >
	<!--<p class="defShadow"> Base layer filter <br> </p>-->

	<!-- The avoidRefresh() is necessary because for some reason when you
 press enter inside the text box the webpage gets refreshed -->
	<input type="text" id="idOcqlFilterInputText" onkeyup="applyFilterOnEnter();"
		   name="ocqlFilterInputText">

	<button type="button" name="type" id="idOcqlFilterButton" class="buttonStyle" 
			onclick="applyCqlFilter();" >Apply</button>

	<p id="availableFiltersText" class="defShadow"> Available filters: <b>${cqlcols}</b> </p>	

	<span id="ocqlFilterText" class="commonHover">
		This is a
		<a href="http://en.wikipedia.org/wiki/Contextual_Query_Language"> CQL </a>
		filter text box. Possible options: <br> <br>
		<table class="cqlFilterExampleTable">
			<tr>
				<th>Boolean</th> <th>Comparison</th> <th>Chars</th> <th>Reg. Exp.</th>
			</tr>
			<tr>
				<td>or<br>and</td>
				<td>=,<>, <,<br><=,>=</td>
				<td>LIKE<br> IN</td>
				<td>% (any) </td>
			</tr>
		</table>
		<br> <b>Examples</b>:
		<br> &nbsp;&nbsp;&nbsp;&nbsp; year <b>></b> 2008 <b>AND </b>year <b><</b> 2011
		<br> &nbsp;&nbsp;&nbsp;&nbsp; temperature <b>></b> 10 <b>OR</b> salinity <b>>=</b> 1
		<br> &nbsp;&nbsp;&nbsp;&nbsp; year <b>IN</b> (2012,2013) <b>AND</b> date < 8/10/2013 
		<br> &nbsp;&nbsp;&nbsp;&nbsp; name <b>LIKE</b> 'John<b>%</b>' <b>AND</b> year <b><</b> 2013
	</span>
	<span id="ocqlErrorParent" class="commonHover">
		<p id="ocqlErrorText"></p>
	</span>
</span>