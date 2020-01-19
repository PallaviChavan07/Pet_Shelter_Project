<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=ISO-8859-1">
<title>Pet Details</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
Animal animal = (Animal)session.getAttribute("animal");
request.getSession().setAttribute("animal", animal);
Person adopter = (Person)session.getAttribute("adopter");
request.getSession().setAttribute("adopter", adopter);
%>
<div class="container">
<h2>Pet Details</h2>
		<form action="<%=request.getContextPath()%>/PetServlet">
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
			
			<div class="form-row">
				<div class="form-group col-sm-2">
					<input type="submit" class="btn-primary" value="Adopt Me">
				</div>
		    	<div class="form-group col-sm-9">
		    		<a href="./home.jsp" style="padding-left: 100%;">Home</a>
		    	</div>
		    	<input type="hidden" name="param" value="pet_details.jsp" />			    	
			</div>			
			  	  
		    </form>
    
    
    
</div>
<% session.setAttribute("animalList", null); %>
</body>
</html>