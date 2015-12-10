<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a Customer</title>
        <link href="style.css" rel="stylesheet" type="text/css" >
    </head>
    <body>
        <div class="wrap"> <!--div to hold other divs-->
            
            <%@include file="includes/search.jsp" %>  <!-- Search Bar -->

            <%@include file="includes/header.jsp" %>  <!-- Header -->

            <%@include file="includes/menu.jsp" %>  <!--Menu-->

            <div class="main">
                <p>
                <form name ="addForm" action ="addCustomer" method="get">
                    <fieldset>
                        <legend>Add A New Customer</legend>
                        <label class="field">First Name:</label>
                        <input type="text" name="fName" value="" />
                        <br>
                        <label class="field">Last Name:</label>
                        <input type="text" name="lName" value="" />
                        <br>
                        <label class="field">Address1:</label>
                        <input type="text" name="addr1" value="" />
                        <br>
                        <label class="field">Address2:</label>
                        <input type="text" name="addr2" value="" />
                        <br>
                        <label class="field">City</label>
                        <input type="text" name="city" value="" />
                        <br>
                        <label class="field">State</label>
                        <input type="text" name="state" value="" />
                        <br>
                        <label class="field">Zip</label>
                        <input type="text" name="zip" value="" />
                        <br>
                        <label class="field">Email Address</label>
                        <input type="text" name="email" value="" />
                        <br>
                        <label class="field">Age</label>
                        <input type="text" name="age" value="" />
                        <br>                        
                        <div class="center">
                            <input type="submit" name="Submit" value="Submit" />
                            <input type="reset" name="Clear" value="Clear" />
                        </div>
                    </fieldset>
                </form>
                </p>
            </div>
            <%@include file="includes/footer.jsp" %><!--Footer-->

        </div> <!--close wrap div-->
    </body>
</html>