
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customers"%>
<% Customers cust = (Customers) request.getAttribute("cust");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer</title>
        <link href="style.css" rel="stylesheet" type="text/css" >
    </head>
    <body>
        <div class="wrap"> <!--div to hold other divs-->
            
            <%@include file="includes/search.jsp" %>  <!-- Search Bar -->

            <%@include file="includes/header.jsp" %>  <!-- Header -->

            <%@include file="includes/menu.jsp" %>  <!--Menu-->

            <div class="main">

                <p>
                <form name ="updateForm" action ="updateCustomer" method="get">
                    <fieldset>
                        <legend>Update Customer</legend>
                        <br>
                        <label class="field">Customer ID:</label>
                        <input type="text" name="id" value="<%= cust.getCustID()%>" readonly/>
                        <br><br>
                        <label class="field">First Name:</label>
                        <input type="text" name="fName" value="<%= cust.getFirstName()%>" pattern="[A-Z][A-Za-z]+" title="Only letters allowed.  Needs to be at least 2 letters long with the first letter capitalized"/>
                        <br><br>
                        <label class="field">Last Name:</label>
                        <input type="text" name="lName" value="<%= cust.getLastName()%>" pattern="[A-Z][A-Za-z]+" title="Only letters allowed.  Needs to be at least 2 letters long with the first letter capitalized"/>
                        <br><br>
                        <label class="field">Address1:</label>
                        <input type="text" name="addr1" value="<%= cust.getAddr1()%>" />
                        <br><br>
                        <label class="field">Address2:</label>
                        <input type="text" name="addr2" value="<%= cust.getAddr2()%>" />
                        <br><br>
                        <label class="field">City:</label>
                        <input type="text" name="city" value="<%= cust.getCity()%>" />
                        <br><br>
                        <label class="field">State:</label>
                        <select name="state">
                                <option value=""><%= cust.getState()%></option>
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="AR">Arkansas</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="CT">Connecticut</option>
                                <option value="DE">Delaware</option>
        			<option value="DC">District of Columbia</option>
                                <option value="FL">Florida</option>
                        	<option value="GA">Georgia</option>
                		<option value="HI">Hawaii</option>
        			<option value="ID">Idaho</option>
                                <option value="IL">Illinois</option>
                        	<option value="IN">Indiana</option>
                		<option value="IA">Iowa</option>
        			<option value="KS">Kansas</option>
                                <option value="KY">Kentucky</option>
                                <option value="LA">Louisiana</option>
                                <option value="ME">Maine</option>
                                <option value="MD">Maryland</option>
                                <option value="MA">Massachusetts</option>
        			<option value="MI">Michigan</option>
                		<option value="MN">Minnesota</option>
                        	<option value="MS">Mississippi</option>
                                <option value="MO">Missouri</option>
        			<option value="MT">Montana</option>
                		<option value="NE">Nebraska</option>
                        	<option value="NV">Nevada</option>
                                <option value="NH">New Hampshire</option>
				<option value="NJ">New Jersey</option>
				<option value="NM">New Mexico</option>
				<option value="NY">New York</option>
				<option value="NC">North Carolina</option>
				<option value="ND">North Dakota</option>
				<option value="OH">Ohio</option>
				<option value="OK">Oklahoma</option>
        			<option value="OR">Oregon</option>
        			<option value="PA">Pennsylvania</option>
        			<option value="RI">Rhode Island</option>
        			<option value="SC">South Carolina</option>
        			<option value="SD">South Dakota</option>
        			<option value="TN">Tennessee</option>
        			<option value="TX">Texas</option>
        			<option value="UT">Utah</option>
                                <option value="VT">Vermont</option>
                                <option value="VA">Virginia</option>
                                <option value="WA">Washington</option>
                        	<option value="WV">West Virginia</option>
                		<option value="WI">Wisconsin</option>
        			<option value="WY">Wyoming</option>
                            </select>
                        <br><br>
                        <label class="field">Zip:</label>
                        <input type="text" name="zip" value="<%= cust.getZip()%>" pattern="\d{5,5}" title="Zip codes are 5 nubmers long."/>
                        <br><br>
                        <label class="field">Email Address:</label>
                        <input type="email" name="email" value="<%= cust.getEmailAddr()%>" />
                        <br><br>
                        <label class="field">Age</label>
                        <input type="number" min="1" max="120" name="age" value="<%= cust.getAge()%>" />
                        <br>
                        <div class="center">
                            <input type="submit" name="Submit" value="Update" />
                        </div>
                    </fieldset>
                </form>
                </p>

            </div>
            <%@include file="includes/footer.jsp" %><!--Footer-->

        </div> <!--close wrap div-->
    </body>
</html>
