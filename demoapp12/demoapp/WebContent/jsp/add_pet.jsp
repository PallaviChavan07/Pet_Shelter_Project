<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<title>Add Pet Information</title>
</head>

<%
if (session.getAttribute("listEntryReason") != null){
	System.out.println("entry reason list is not empty");
}else{
	System.out.println("entry reason list is empty");
}
if(session.getAttribute("listSize") != null){
	System.out.println("Size list is not empty");
}else{
	System.out.println("Size list is empty");
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
	<h1 class="display-5 text-center">Add Pet Information</h1>
		<form action = "<%=request.getContextPath()%>/PetServlet" method="post" enctype="multipart/form-data">
				<div class="form-row" style="margin-bottom:10 cm;">
					<div class="form-group col-md-4">						
						<label for="petname" class="col-form-label ">Pet Name</label>
						<input type="text" class="form-control" name="petname" id="petname" />
					</div>
					<div class="form-group col-md-4">					
					<label for="category" class="col-form-label">Category</label>
						<select name="category" class="form-control">
					    <c:forEach items="${listCategory}" var="category">
					        <option value="${category.animal_category_id}">${category.animal_category}</option>
					    </c:forEach>
					</select>
					</div>
					<div class="form-group col-md-4">						
						<label for="breed" class="col-form-label ">Breed</label>
						<select name="breed" class="form-control">
						    <c:forEach items="${listBreed}" var="breed">
						        <option value="${breed.breed_id}">${breed.breed_name}</option>
						    </c:forEach>
						</select>
					</div>
				</div>
				
				
				<div class="form-row  ">
					<div class="form-group col-md-3">						
						<label for="petname" class="col-form-label ">Gender</label>
						<select name="gender" class="form-control">
						    <option value="M">Male</option>
						    <option value="F">Female</option>
						 </select>
					 </div>
				
					<div class="form-group col-md-3">					
					<label for="size" class="col-form-label ">Size</label>
					
					<select name="size" class="form-control">
					    <c:forEach items="${listSize}" var="size">
					        <option value="${size.animal_size_id}" id="size">${size.animal_size}</option>
					    </c:forEach>
					</select>
					</div>
				
					<div class="form-group col-md-3">					
						<label for="agegroup" class="col-form-label ">Age Group</label>
						<select name="agegroup" class="form-control" id="agegroup">
							<option value="Puppy">Puppy</option>
							<option value="Kitten">Kitten</option>
							<option value="Young">Young</option>
						    <option value="Adult">Adult</option>
						    <option value="Senior">Senior</option>
						    <option value="Baby">Baby</option>
						</select>
					</div>
					
					<div class="form-group col-md-3">							
						<label for="neutered" class="col-form-label ">Neutered</label>
						<select name="neutered" class="form-control">
						    <option value="true">Yes</option>
						    <option value="false">No</option>
						 </select>
					</div>
				
				</div>
				
				<div class="form-row  ">
					<div class="form-group col-md-4">						
						<label for="arrivaldate" class="col-form-label">Arrival Date</label>
						<input type="text" name="arrivaldate" id = "arrivaldate" class="form-control"/>
					</div>
				
					<div class="form-group col-md-4">					
						<label for="weight" class="col-form-label">Weight</label>
						<input type="text" name="weight" id="weight" class="form-control" />
					</div>	
				
					<div class="form-group col-md-4">					
						<label for="color" class="col-form-label text-right">Color</label>
						<input type="text" name="color" id="color" class="form-control"/>
					</div>	
				</div>
				
				<div class="form-row  ">
					<div class="form-group col-md-2">					
						<label for="kidsfriendly" class=" col-form-label">Friendly with Kids</label>
						<select name="kidsfriendly" class="form-control">
						    <option value="true">Yes</option>
						    <option value="false">No</option>
						 </select>
					</div>	 
					<div class="form-group col-md-2"> 
						<label for="catsfriendly" class="col-form-label">Friendly with Cats</label>
						<select name="catsfriendly" class="form-control">
						    <option value="true">Yes</option>
						    <option value="false">No</option>
						 </select>
					</div>	 
					<div class="form-group col-md-2">					
						<label for="dogsfriendly" class="col-form-label ">Friendly with Dogs</label>
						<select name="dogsfriendly" class="form-control">
						    <option value="true">Yes</option>
						    <option value="false">No</option>
						 </select>
					</div>
					<div class="form-group col-md-6">
						<label for="entryreason" class="col-form-label">Entry Reason</label>
						<select name="entryreason" class="form-control">
						    <c:forEach items="${listEntryReason}" var="entryreason">
						        <option value="${entryreason.entry_reason_id}">${entryreason.entry_reason}</option>
						    </c:forEach>
						</select>
					</div>
				</div>
				<div class="form-row ">
					<div class="form-group col-md">						
						<label for="description" class="col-form-label ">Description</label>
						<textarea name="description" class="form-control" ></textarea>
					</div>
				</div>
				
			
			<br/><br/>
			<div class="form-row">
				<div class="form-group col-md-5">
					<input type="file" name="addphoto"  size="50"/>
				</div>
				<div class="form-group col-md-5">
					<input type="submit" value="Add Pet"  class="btn btn-primary"/>
				</div>
		    	<div class="form-group col-md-2">
		    		<a href="./home.jsp" style="padding-left: 100%;">Home</a>
		    	</div>
		    	<input type="hidden" name="param" value="add_pet.jsp" />			    	
			</div>
			 
		</form>
		<br>
		
	</div>
	
</body>
</html>