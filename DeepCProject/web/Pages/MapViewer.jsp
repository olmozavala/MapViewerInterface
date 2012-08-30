<%@page pageEncoding="iso-8859-1"%>
<%@ taglib prefix="menuHelper" uri="/WEB-INF/TLD/htmlStaticFunctions.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="names" class="com.mapviewer.model.PagesNames" scope="page"> </jsp:useBean>
<jsp:useBean id="globals" class="com.mapviewer.model.Globals" scope="page"> </jsp:useBean>

    <!DOCTYPE HTML PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN"
        "http://www.w3.org/tr/html4/loose.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
        <%@include file="Header/GlobalJavaScript.jsp" %>
        <%@include file="Header/Header.jsp" %>
        <%@include file="OpenLayersConfig.jsp" %>
    </head>

    <body onload="init();initMenus('${animationURL}')" scroll="no">

        <%@include file="RequiredDivs.jsp" %>
		<c:if test='${netcdf}'>
			<%@include file="NcWMSOptions.jsp" %>
		</c:if>

 
	


        <!-- This is the div that contains all of the user options, drop down of
          main layers, vector layers, kml data, etc. -->
      

        <!-- Foot page --> 
        <div id="pieDePaginaIzq" class="leftFoot">
            <!--			<p class="footNote" align="left">-->
            &nbsp;
            <a  href="http://www.deep-c.org/">
    <!--					<img border="0" src="${basepath}/common/images/Logos/logo-uniatmos-chi.png" alt="UNIATMOS" width="169" height="54" /> </a>-->
                <a  href="http://www.fsu.edu/">
                    <img border="0" src="${basepath}/common/images/Logos/FSU.png" alt="FSU" width="61" height="60" /></a>
                &nbsp;
                <a  href="http://coaps.fsu.edu/">
                    <img border="0" src="${basepath}/common/images/Logos/COAPSoz.png" alt="COAPS" width="60" height="60" /></a>
                &nbsp 
                <a  href="http://www.deep-c.org/">
                    <img border="0" src="${basepath}/common/images/Logos/DeepC.png" alt="DeepC" width="102" height="60" /></a>
                &nbsp 
                <a  href="http://www.noaa.gov/">
                    <img border="0" src="${basepath}/common/images/Logos/NOAA.png" alt="NOAA" width="61" height="60" /></a>
                <p class="footNote" align="left">
                    &nbsp 
                    &copy; <script language="javascript">document.write(getDate("%Y"));</script>.  Deep-C Consortium. All Rights Reserved. &nbsp;
                </p>
        </div>
    </body>

</html>

