<%-- 
    Document   : DownloadData
    Created on : Aug 3, 2012, 6:30:08 PM
    Author     : olmozavala
--%>
<!-- Link to download the real data (Geotiff file) -->
<p id="downloadData" class="buttonStyle" onclick="getWCSV1Ajax('${basepath}');" 
	onmouseover="hoverInstructions('downloadDataHover', '1')" 
	onmouseout="hoverInstructions('downloadDataHover', '2')"
   >Download data</p>
</a>
<div id="wcslink"> </div>
