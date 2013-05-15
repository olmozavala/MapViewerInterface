<%-- 
    Document   : Elevation
    Created on : Aug 3, 2012, 6:23:54 PM
    Author     : olmozavala
--%>


<%-- 
This page controls the elevation of the displayed layer, it can be height or precipitation as well. 
There is 3 options. Either '-' or '+' or click the button to choose the disired height or precipitation level. 
--%>

<span  style="cursor: pointer;"> 
    <table cellpadding="0" border="0">
        <tr>
            <td><button type="button" id="minusButtonElevation" style="cursor: pointer;"  class="mobileButton" onclick="changeElevationMobile('-', layer1);">
                    -
                </button></td>

            <td>	
                <span  id="elevationText"  class ="mobileButton middleText"><fmt:message key="ncwms.depth" /></span>
            </td>
            <td>
                <button class="mobileButton" id="plusButtonElevation" style="cursor: pointer;" type="button"  onclick="changeElevationMobile('+', layer1);">
                    +
                </button>
            </td>
        </tr>	
        <tr>
			<td align="center" class="elevationSelector" id="elevationSelector"> </td>
        </tr>
    </table>
</span>
