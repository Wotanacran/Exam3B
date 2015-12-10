<%-- 
    Document   : index
    Created on : Oct 16, 2015, 7:00:06 PM
    Author     : Tyler Hodgson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers</title>
        <link href="style.css" rel="stylesheet" type="text/css" >
    </head>
    <body>
        <div class="wrap"> <!--div to hold other divs-->

            <%@include file="includes/search.jsp" %>  <!-- Search Bar -->
            
            <%@include file="includes/header.jsp" %>  <!-- Header -->
                    
            <%@include file="includes/menu.jsp" %>  <!--Menu-->

            <div class="main">
                <h1>Customers Database</h1>
        
            </div>
        <%@include file="includes/footer.jsp" %><!--Footer-->
        
        </div> <!--close wrap div-->
    </body>
</html>
