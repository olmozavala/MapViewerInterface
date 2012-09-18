<!-- Menu for Users -->


<div id="layersMenu" class="layersMenu">
    <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">

        <table name="menuTable" border="0" align="center" style="padding-top:3px;" >
            <tr>
                <td>
                    <table border="0" cellpadding="0"><tr>
                            <!-- Creates the menus from the static function createMenu inside HtmlMenuBuilder -->
                            ${menuHelper:createMainMenu(MenuDelUsuario,language)}
                        </tr>
                    </table>
                </td>
                
                <c:choose>
                <c:when test='${netcdf}'>
                <td id="hideButtonCal">

                        <button type="button" class="small awesome"   id="hide_show" onclick="hideCalendar();"  >Hide Calendar</button>

                    </td>
                    
                     </c:when>
            </c:choose>

                <td>
                    <!-- Link to download kml files-->

                    <span  id="mainkml" > <%@include file="Options/KmlLink.jsp" %></span></td>

                <td>
                    <!-- Transparency -->
                    <span id="transParag"><%@include file="Options/Transparency.jsp" %></span></td>



            <c:choose>
                <c:when test='${netcdf}'>
                    <!-- Elevation -->
                    <td>
                        <span id="elevation"><%@include file="Options/Elevation.jsp" %></span>
                    </td>

                    <td>
                        <button type="button" class="small awesome" onclick="showPalettes()" >
                            Color Tools
                        </button>

                        <!-- Current palette and color range -->
                        <span id="item_palette5"> <%@include file="Options/Palettes.jsp" %> </span>
                    </td>
                    
                    
                          <td>
                <span id="outer_transect">
                    <span  id="controlToggle">


                        <button type="button" name="type" value="line" id="lineToggle" class="small awesome" onclick="toggleControl(this);" >Transect Tool</button>
                    </span>

            </td>
                    
                </c:when>
            </c:choose>
      
            <td>
                <!-- Resize window -->
                <button type="button" class="small awesome" onclick="refreshWindow();" >
                    Refresh
                </button>

            </td>
            <td> <!-- Email -->


                <a href="mailto:osz09@gmail.com">
                    <button type="button" class="small awesome" onclick="MapViewersubmitForm();" >
                        Email
                    </button>
                </a>



            </td>


            <td>
                <!-- Map Instructions-->
                <button type="button" class="small awesome"  onclick="displayHelp();" atl="Help" />Help</button>

            </td>

            </tr>
        </table>


        <!-- List of optional layers -->
        <span class="item_optional7"><%@include file="Options/OptionalLayers.jsp" %></span>


        <c:if test='${netcdf}'>
            <!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

            <span id="s-animation"  class="stop_button"> <button type="button" onclick="stopAnimation();" class="small awesome" style="font-size:12px;" >Stop Animation</button></span> 
            <p id="l-animation" class="defShadow loading_msg"> Loading 
                <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading"></A>
            </p>

            <!--</span>-->
        </c:if>
        <span id="helpDiv">
            <%@include file="Options/MapInstructions.jsp" %>

        </span> 

    </form>

</div>





