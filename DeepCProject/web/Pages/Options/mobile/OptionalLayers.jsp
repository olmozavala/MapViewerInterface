<%-- 
    Document   : OptionalLayers
    Created on : Aug 3, 2012, 6:38:05 PM
    Author     : olmozavala cambio mobile
--%>
<!-- This sections generate the menu of optional layers, normally vector layers -->
<table class="vectorLayer" border="0" cellpadding="0" width="400px">
    <tr><td colspan="4" ><p class="invShadow" style="text-align: center; cursor:move;font-size:30px;padding-right:15px;"><fmt:message key="main.optional" /></p></td><tr>
    <c:forEach var="vectorLayer" items="${vectorLayers.childs}" varStatus="indice">
        <tr> 
            <td align="left" style="text-align:center">
                <button id="minusButtonOptional${indice.count - 1}" class="minusButtonSmall" type="button" disabled="disabled" 
                        onmouseover ="changeColor(this,1);" onmouseout ="changeColor(this,0);" 
                        onmouseup ="changeColor(this,1);" onmousedown ="changeColor(this,2);"
                        onclick="changeTranspOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1}, .20, ${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count} ) ;">
                    -	
                </button>
            </td>
            <td style="text-align:center">
                <button id="plusButtonOptional${indice.count - 1}" type="button" class="plusButtonSmall" 
                        onmouseover ="changeColor(this,1);" onmouseout ="changeColor(this,0);" 
                        onmouseup ="changeColor(this,1);" onmousedown ="changeColor(this,2);"
                        onclick="changeTranspOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1}, -.20, ${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count});">
                    +
                </button>
            </td>
           
    <td style="text-align:center">
        <span style="font-size:25px;text-align:center">
        ${menuHelper:transName(vectorLayer,language)} 
        </span>
        </td>
         <td style="text-align:center">
                <input id="checkBox${indice.count}" type="checkbox" name="vectorLayersSelected"   
                       value="${vectorLayer.node.id}" onclick="manageOptionalLayers(layer${totalLayers - sizeVectLayers + indice.count - 1},this.checked); DisableTranspOptionalLayers(${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count} ); "
        <c:if test='${vectorLayer.selected}'> checked </c:if>
        /></td>
        <td align="right">
            <A href="${linksKmzVect[indice.count-1]}">
                <img src="${basepath}/common/images/kmz/kmz.png"
                     onmouseover="rollImage(this,'${basepath}/common/images/kmz/kmz_over.png' )"
                     onmouseout="rollImage(this,'${basepath}/common/images/kmz/kmz.png' )"
                     onmousedown="rollImage(this,'${basepath}/common/images/kmz/kmz_over_click.png' )"
                     onmouseup="rollImage(this,'${basepath}/common/images/kmz/kmz_over.png' )"
                     border="0" alt="Descargar KMZ" onload="CreateArraysOptional(${indice.count -1});  DisableTranspOptionalLayers(${indice.count -1},'minusButtonOptional'+${indice.count - 1},'plusButtonOptional'+${indice.count - 1}, 'checkBox'+${indice.count} ); " width="40" height="40"></A>
            &nbsp;
        </td> 
        </tr>             

    </c:forEach>
</table>

           


