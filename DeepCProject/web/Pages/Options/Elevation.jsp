<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>
<span class="defaultOptions" style="cursor: default;"> 
    <table cellpadding="1" border="0">
        <tr>
            <td><button type="button" id="minusButtonElevation"   class="minusButton" onclick="changeElevation('-', layer1);">
                    -
                </button></td>

            <td>	
                <span style="cursor: default;" id="elevationText"  onclick ="displayElevationSelector() ">Elevation</span>
            </td>
            <td>
                <button class="plusButton" id="plusButtonElevation"  type="button"  onclick="changeElevation('+', layer1);">
                    +
                </button>
            </td>
        </tr>		       
    </table>
</span>

