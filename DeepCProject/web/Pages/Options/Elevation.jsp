<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<span class="defaultOptions" style="cursor: pointer;"> 
    <table cellpadding="1" border="0">
        <tr>
            <td><button type="button" id="minusButtonElevation" style="cursor: pointer;"  class="minusButton" onclick="changeElevation('-', layer1);">
                    -
                </button></td>

            <td>	
                <span style="cursor: pointer;" id="elevationText"  onclick ="displayElevationSelector() ">Elevation</span>
            </td>
            <td>
                <button class="plusButton" disabled="disabled" id="plusButtonElevation" style="cursor: pointer;" type="button"  onclick="changeElevation('+', layer1);">
                    +
                </button>
            </td>
        </tr>		       
    </table>
</span>

