<%-- 
This is the main jsp file that forms the html webpage. It contains the skeleton of the html application. 
--%>

<%@page pageEncoding="iso-8859-1"%>
<%@page errorPage="Error/ErrorPage.jsp" %>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
    "http://www.w3.org/tr/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <%@include file="Header/GlobalJavaScript.jsp" %> <%-- Sets all the javascript global variables that are initiated by the java application --%>

        <%@include file="Header/MobileHeader.jsp" %> <%-- contains all the css links and javascript links --%>
        <%@include file="OpenLayersConfig.jsp" %> <%-- this is a javascript file that initiazlies the OpenLayers map --%>
    </head>


    <body id="bodyClass" onresize="resizeMap();"  onload="resizeMap();mobileInit();">
        <%-- Main form of the application (main menu), it executes a new page everytime a new menu item is chosen --%>

        <form id="baseForm" name="baseForm" action="${basepath}${names.acdmServlet}" method="post">

            <span id="helpDiv" style="border-radius: 10px;">
                <%@include file="Options/MapInstructions.jsp" %>
            </span> 

            <!-- List of optional layers -->




            <!-- These are the dropdowns for the base layer-->


            <c:if test="${cqlfilter}">
                <%-- CQL Custom filter buttons and text field. --%>
                <%@include file="Options/CQLFilter.jsp" %> 
            </c:if>





            <%@include file="RequiredDivs.jsp" %> <%-- Contains the title of the layer and the div that hold the whole map --%>

            <c:if test='${netcdf}'>




                <!--<span id="loadingAnimContainer" class="loadingAnimContainer" style="display:block;visibility:visible">-->

                <div id="l-animation">
                    <p > Loading 0 % <img src="${basepath}/common/images/load.gif" height="12" border="0" alt="loading" />	</A>	</p>
                </div>
            </c:if>


            <table id="mobileLevel1" cellpadding="5px"  border="0">
                <tr >                        
                    <td id="mobileLev1optClose"><span  style="font-size:50px;" class="mobileButton"  onclick="hideMobileMenuLevel1(1)">Open</span></td>
                    <td id="mobileLev1Hide"><span  style="font-size:50px;padding-left:2px;padding-right:2px;" class="mobileButton" onclick="hideMobileMenuLevel1(0)">Close</span></td>
                    <td id="mobileLev1Tools"><span style="font-size:50px;" class="mobileButton" onclick="hideMobileMenuLevel1(2)">Tools</span></td>
                    <td id="mobileLev1HideTitle"><span  style="font-size:50px;" class="mobileButton" onclick="hideMobileMenuLevel1('titleON')" id="titleOnText">Title On</span></td>
                    <td id="mobileLev1Help"><span  style="font-size:50px;" class="mobileButton" >Help?</span></td>




                </tr>

            </table>

            <span id="transectParent">
                <button type="button" name="type" value="line" id="lineToggle" class="mobileButton" 
                        onclick="hideMobileMenuLevel1('mobileLev3Back');
                            toggleControlMobile(this);" >Transect Tool</button>
            </span>

            <table id="mobileLevel2" border="3" width="100%" height="100%">

                <tr>
                    <td id="mobileLev2MainLayers" class="mobileButton level2button" onclick="hideMobileMenuLevel1('mainLayers')">Main Layers</td>

                    <td id="mobileLev2OptionalLayers" class="mobileButton level2button" onclick="hideMobileMenuLevel1('optionalLayers')">Optional Layers</td>

                </tr>


                <tr>
                    <c:if test='${netcdf}'>
                        <td id="mobileLev2Calendars" class="level2button mobileButton" onclick="hideMobileMenuLevel1('calendars')">Calendars</td>
                    </c:if>

                    <c:if test='${!netcdf}'>
                        <td  id="mobileLev2Calendars" class="level2button mobileButtonDisabled" onclick="notAvailableOption()">Calendars</td>
                    </c:if>


                    <td id="mobileLev2GoogleEarth" class="level2button mobileButton"><a  id="kmlLink" href="${linkKML}" onclick="KMZDownAlert()">


                            <img  border="0" src="${basepath}/common/images/kmz/google_earth_logo_topMenu.png" alt="Descargar en KML" width="25" height="25" />
                            <font color="white">Google Earth</font>
                        </a></td>

                </tr>

                <tr>
                    <td id="mobileLev2Transparency" class="level2button mobileButton"  onclick="hideMobileMenuLevel1('transparency')">Transparency</td>

                    <c:if test='${netcdf}'>
                        <script>
                        if (layerDetails.zaxis === undefined) {
                            
                             document.write('<td id="mobileLev2Depth" class="level2button mobileButtonDisabled"  onclick="notAvailableOption();" >Depth </td>');
                            
                        }
                        else{
                       
                                document.write('<td id="mobileLev2Depth" class="level2button mobileButton"  onclick="hideMobileMenuLevel1(\'depth\')" >Depth </td>');
                        }
                                        
                
                        </script>

                        </c:if>
                    
                    <c:if test='${!netcdf}'>
                        <td id="mobileLev2Depth" class="level2button mobileButtonDisabled"  onclick="notAvailableOption()" >Depth </td> 
                    </c:if>
                    
                    
                    
                </tr>

                <c:if test='${netcdf}'>
                    <tr>

                        <td id="mobileLev2ColorPalette"  class="level2button mobileButton " onclick="hideMobileMenuLevel1('colorPalette')">Color Palette</td>

                        <td id="mobileLev2TransectTool" class="level2button mobileButton" onclick="toggleControlMobile(this);
                            hideMobileMenuLevel1('transect')">Transect Tool</td>

                    </tr>
                </c:if>
                            
                 <c:if test='${!netcdf}'>
                    <tr>

                        <td id="mobileLev2ColorPalette" class="level2button mobileButtonDisabled " onclick="notAvailableOption()">Color Palette</td>

                        <td id="mobileLev2TransectTool" class="level2button mobileButtonDisabled" onclick="notAvailableOption()">Transect Tool</td>

                    </tr>
                </c:if>            
                            
                            
                            
                <tr>
                    <td id="mobileLev2ZoomOptions" class="level2button mobileButton" onclick="hideMobileMenuLevel1('zoom')">Zoom Options</td>


                    <td id="mobileLev2CloseMenu"  class="level2button mobileButton" onclick="hideMobileMenuLevel1(3)">Close Menu</td>



                </tr>
            </table>

            <table id="mobileLevel3" border="0" >



                <tr>

                    <td id="mobileLev3Back"><span  class="mobileButton"  onclick="hideMobileMenuLevel1('mobileLev3Back')">Back</span></td>





                    <td  id="level3MainLayers"><span class="WindowMobile" id="mainMenuParent">
                            <div class="ie_shadow" id="mainMenuTitle">Base Layers</div>
                            ${menuHelper:createMainMenu(MenuDelUsuario,language)}
                            <br>
                                <c:if test="${cqlfilter}">
                                    <span id="ocqlMenuButtonParent">
                                        <button type="button" name="type" id="idOcqlMenuButton" class="buttonStyle" 
                                                onclick="toggleCustomFilterTextBox();" >Custom filter</button>
                                    </span>
                                </c:if>

                        </span>




                    </td>




                    <td id="level3OptionalLayers">
                        <span class="WindowMobile" id="optionalMenuParent"><%@include file="Options/mobile/OptionalLayers.jsp" %></span>
                    </td>



                    <td id="level3Calendars">

                        <c:if test='${netcdf}'>
                            <%@include file="MobileNcWMSOptions.jsp" %>  <%-- This page has all the calendars, the animaton divs  --%>
                        </c:if>
                    </td>





                    <td id="level3Transparency" ><%@include file="Options/mobile/Transparency.jsp" %>
                    </td>







                    <td id="level3Depth"> <%@include file="Options/mobile/Elevation.jsp" %>

                    </td>







                    <td id="level3ColorPalette">
                        <!-- Current palette and color range -->
                        <!--<div id="palettesParent">-->
                        <%@include file="Options/mobile/Palettes.jsp" %> 
                        <!--</div>-->

                    </td>

















                </tr>

            </table>

            
        </form>

     
    </body>
</html>
