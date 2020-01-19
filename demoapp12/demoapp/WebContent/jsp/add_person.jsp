<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Person</title>
</head>

<%
if (session.getAttribute("listEntryReason") != null){
	System.out.println("entry reason list is not empty");
}else{
	System.out.println("entry reason list is empty");
}
	
%>
<style>
div.ex {
	text-align: right width:300px;
	padding: 10px;
	border: 5px solid grey;
	margin: 0px
}
</style>
<body>
	<h1>Add Person Information</h1>
	<div class="ex">
		<form action = "<%=request.getContextPath()%>/PetServlet">
			<table style="with: 50%">
				<tr>
					<td>First Name</td>
					<td><input type="text" name="firstname" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="lastname" /></td>
				</tr>
				<tr>
					<td>Email Id</td>
					<td><input type="text" name="emailid" /></td>
				</tr>
				<tr>
					<td>Phone Number</td>
					<td><input type="text" name="phonenumber" /></td>
				</tr>
				<tr>
					<td>Street Address</td>
					<td><input type="text" name="streetaddress" /></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td>State</td>
					<td><input type="text" name="state" /></td>
				</tr>
				<tr>
					<td>Zip</td>
					<td><input type="text" name="zip" /></td>
				</tr>
				<tr>
					<td>Driver License</td>
					<td><input type="text" name="driverlicense" /></td>
				</tr>
				<tr>
					<td>State Issuance</td>
					<td><input type="text" name="stateissuance" /></td>
				</tr>
				<tr>
					<td>License Expiry Date</td>
					<td><input type="text" name="licenseexpirydate" /></td>
				</tr>
				
				<tr><td></td></tr>
			</table>
			<input type="hidden" name="param" value="add_person.jsp" />			
			<input type="submit" value="Add Person" />
			<a href="./home.jsp">Home</a>
		</form>
		<br>
		
	</div>
	
</body>
</html>