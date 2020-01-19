<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=ISO-8859-1">
<title>Adoption Process</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
.h-divider{
 margin-top:10px;
 margin-bottom:10px;
 height:5px;
 width:100%;
 border-top:1px solid blue;
}
</style>
<body>
<%
Animal animal = (Animal)session.getAttribute("animal");
request.getSession().setAttribute("animal", animal);
Person adopter = (Person)session.getAttribute("adopter");
%>

	<div class="container">
		<form action="<%=request.getContextPath()%>/PetServlet">
		<div class="form-row">
			<h5>Pet Details: </h5>
		</div>
		<div class="form-row">
			<div class="col-sm-9">					
					<div class="form-row  ">
						<div class="form-group col-sm-4">
							<label for="petname" class="col-form-label ">Pet Name</label>
							<input type="text" class="form-control" name="petname" value="<%= animal.getAnimal_name()%>" />
						</div>
						
						<div class="form-group col-sm-2">
							<label for="category" class="col-form-label ">Category</label>
							<select name="category" class="form-control">
							        <option value=""><%=animal.getAnimal_category() %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-2">
							<label for="gender" class="col-form-label ">Gender</label>
							<select name="gender" class="form-control">
							    <option value=""><%= animal.getAnimal_gender().equals("M")?"Male":"Female" %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-2">
							<label for="size" class="col-form-label ">Size</label>
							<select name="size" class="form-control">
							        <option value="<%= animal.getAnimal_size_id() %>"><%=animal.getAnimal_size() %></option>
							</select>
						</div>
					</div>
					
					<div class="form-row  ">
						<div class="form-group col-sm-2">
							<label for="agegroup" class="col-form-label ">Age Group</label>
							<select name="agegroup" class="form-control">
								<option value="<%=animal.getAnimal_age_group() %>"><%=animal.getAnimal_age_group() %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-4">
							<label for="breed" class="col-form-label ">Breed</label>
							<select name="breed" class="form-control">
							        <option value="<%=animal.getAnimal_breed() %>"><%=animal.getAnimal_breed() %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-2">
							<label for="weight" class="col-form-label ">Weight</label>
							<input type="text" class="form-control" name="weight" value="<%=animal.getAnimal_weight() %>" />
						</div>
						
						<div class="form-group col-sm-2">
							<label for="color" class="col-form-label ">Color</label>
							<input type="text" class="form-control" name="color" value="<%=animal.getAnimal_color() %>" />
						</div>
					</div>
					
					<div class="form-row  ">
						<div class="form-group col-sm-4">
							<label for="entryreason" class="col-form-label ">Entry Reason</label>
							<select name="entryreason" class="form-control">
								<option value=""><%=animal.getAnimal_entry_reason() %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-2">
							<label for="arrivaldate" class="col-form-label ">Arrival Date</label>
							<input type="text" class="form-control" name="arrivaldate" value="<%=animal.getAnimal_arrival_date() %>" />
						</div>
						
						<div class="form-group col-sm-2">
						<label for=neutered class="col-form-label ">Neutered</label>
						<select name="neutered" class="form-control">
						    <option value=""><%=animal.isIs_neutered()? "Yes" : "No" %></option>
						</select>
					</div>
					</div>
					
					<div class="form-row  ">
						<div class="form-group col-sm">
							<label for="description" class="col-form-label ">Description</label>
							<textarea name="description" class="form-control"><%=animal.getAnimal_description() %> </textarea> 
						</div>
					</div>
					
					<div class="form-row  ">
						<div class="form-group col-sm-4">
							<label for="kidsfriendly" class="col-form-label ">Friendly with Kids</label>
							<select name="kidsfriendly" class="form-control">
							    <option value=""><%=animal.isIs_children_friendly()? "Yes" : "No" %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-4">
							<label for="catsfriendly" class="col-form-label ">Friendly with Cats</label>
							<select name="catsfriendly" class="form-control">
								<option value=""><%=animal.isIs_cat_friendly()? "Yes" : "No" %></option>
							</select>
						</div>
						
						<div class="form-group col-sm-4">
							<label for="dogsfriendly" class="col-form-label ">Friendly with Dogs</label>
							<select name="dogsfriendly" class="form-control">
							    <option value=""><%=animal.isIs_dog_friendly()? "Yes" : "No" %></option>
							</select>
						</div>
						
						
					</div>
			</div>
			
			<div class="col-sm-3"><img src='data:image/jpeg;base64,<%=animal.getAnimal_image() %>'>
			</div>
		</div>		
		  	
		  	<br/><div class="h-divider"> </div><br/>
		  	<div class="form-row">
				<h5>Adopter Details </h5>
			</div>
		  	
		    <div class="form-row">
			    	<div class="form-group col-md-3">	
							<label for="firstname" class="col-form-label ">First Name</label>
							<input type="text" class="form-control" name="firstname" value="<%= adopter.getFirst_name()%>" />
					</div>
					<div class="form-group col-md-3">
							<label for="lastname" class="col-form-label ">Last Name</label>
							<input type="text" class="form-control" name="lastname" value="<%= adopter.getLast_name()%>" />
					</div>	
					<div class="form-group col-md-3">	
							<label for="emailid" class="col-form-label ">Email Id</label>
							<input type="text" class="form-control" name="emailid" value="<%= adopter.getEmail_id()%>" />
					</div>
					<div class="form-group col-md-3">			
							<label for="phonenumber" class="col-form-label ">Phone Number</label>
							<input type="text" class="form-control" name="phonenumber" value="<%= adopter.getPhone_number()%>" />
					</div>	
			</div>
			<div class="form-row">
					<div class="form-group col-md-3">	
							<label for="streetaddress" class="col-form-label ">Street Address</label>
							<input type="text" class="form-control" name="streetaddress" value="<%= adopter.getStreet_address()%>" />
					</div>			
					<div class="form-group col-md-3">
							<label for="city" class="col-form-label ">City</label>
							<input type="text" class="form-control" name="city" value="<%= adopter.getCity()%>" />
					</div>
					<div class="form-group col-md-3">	
							<label for="state" class="col-form-label ">State</label>
							<input type="text" class="form-control" name="state" value="<%= adopter.getState()%>" />
					</div>	
					<div class="form-group col-md-3">	
							<label for="zip" class="col-form-label ">Zip</label>
							<input type="text" class="form-control" name="zip" value="<%= adopter.getZip()%>" />
					</div>	
			</div>			
			<div class="form-row">
					<div class="form-group col-md-4">
							<label for="driverlicense" class="col-form-label ">Driver License</label>
							<input type="text" class="form-control" name="driverlicense" value="<%= adopter.getDriver_license()%>" />
					</div>	
					<div class="form-group col-md-4">	
							<label for="stateissuance" class="col-form-label ">State Issuance</label>
							<input type="text" class="form-control" name="stateissuance" value="<%= adopter.getState_issuance()%>" />
					</div>	
					<div class="form-group col-md-4">	
							<label for="licenseexpirydate" class="col-form-label ">License Expiry Date</label>
							<input type="text" class="form-control" name="licenseexpirydate" value="<%= adopter.getLicense_expiry_date()%>" />
					</div>	
			</div>			
						
			<br/><div class="h-divider"> </div><br/>
			
			<div class="form-row">
					<div class="form-group col-md-9">
						<input type="submit" class="btn-primary" value="Confirm Adoption">
					</div>
			    	<div class="form-group col-md-3">
			    		<a href="./home.jsp" style="padding-left: 100%;">Home</a>
			    	</div>
			    	<input type="hidden" name="param" value="adoption_process.jsp" />			    	
			</div>
	    </form>
		
	</div>
</body>
</html>