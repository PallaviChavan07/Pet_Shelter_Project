<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Adopter</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
	<div class="container">
	<h1 class="display-5 text-center">Add Adopter Information</h1>
		<form action = "<%=request.getContextPath()%>/PetServlet">
			<div class="form-row">
			    	<div class="form-group col-md-3">	
							<label for="firstname" class="col-form-label ">First Name</label>
							<input type="text" class="form-control" name="firstname" />
					</div>
					<div class="form-group col-md-3">
							<label for="lastname" class="col-form-label ">Last Name</label>
							<input type="text" class="form-control" name="lastname" />
					</div>	
					<div class="form-group col-md-3">	
							<label for="emailid" class="col-form-label ">Email Id</label>
							<input type="text" class="form-control" name="emailid" />
					</div>
					<div class="form-group col-md-3">			
							<label for="phonenumber" class="col-form-label ">Phone Number</label>
							<input type="text" class="form-control" name="phonenumber" />
					</div>	
			</div>
			<div class="form-row">
					<div class="form-group col-md-3">	
							<label for="streetaddress" class="col-form-label ">Street Address</label>
							<input type="text" class="form-control" name="streetaddress" />
					</div>			
					<div class="form-group col-md-3">
							<label for="city" class="col-form-label ">City</label>
							<input type="text" class="form-control" name="city" />
					</div>
					<div class="form-group col-md-3">	
							<label for="state" class="col-form-label ">State</label>
							<input type="text" class="form-control" name="state" />
					</div>	
					<div class="form-group col-md-3">	
							<label for="zip" class="col-form-label ">Zip</label>
							<input type="text" class="form-control" name="zip" />
					</div>	
			</div>			
			<div class="form-row">
					<div class="form-group col-md-4">
							<label for="driverlicense" class="col-form-label ">Driver License</label>
							<input type="text" class="form-control" name="driverlicense" />
					</div>	
					<div class="form-group col-md-4">	
							<label for="stateissuance" class="col-form-label ">State Issuance</label>
							<input type="text" class="form-control" name="stateissuance" />
					</div>	
					<div class="form-group col-md-4">	
							<label for="licenseexpirydate" class="col-form-label ">License Expiry Date</label>
							<input type="text" class="form-control" name="licenseexpirydate" />
					</div>	
			</div>			
			<div class="form-row">
				<div class="form-group col-md-9">
					<input type="submit" class="btn-primary" value="Add Adopter" />
				</div>
		    	<div class="form-group col-md-3">
		    		<a href="./home.jsp" style="padding-left: 90%;">Home</a>
		    	</div>
		    	<input type="hidden" name="param" value="add_adopter.jsp" />			    	
			</div>
						
		</form>
	</div>
</body>
</html>