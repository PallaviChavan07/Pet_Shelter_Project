<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="width=device-width, initial-scale=1, text/html; charset=ISO-8859-1">
<title>Pet Search</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
	<form action = "<%=request.getContextPath()%>/PetServlet">
		<div class="container">
		  <h1>Pet Search</h1>
		  <div class="row">
		    <div class="col-sm-3">
		    	<select class="form-control" name="category">
				    <c:forEach items="${listCategory}" var="category">
				        <option value="${category.animal_category_id}">${category.animal_category}</option>
				    </c:forEach>
				</select>
		        
		    </div>
		    <div class="col-sm-3">
		    	<select class="form-control" name="gender">
				    <option value="M">Male</option>
				    <option value="F">Female</option>
				 </select>
		    </div>
		    
		    <div class="col-sm-3">
		    	<select class="form-control" name="agegroup">
					<option value="Puppy">Puppy</option>
					<option value="Kitten">Kitten</option>
					<option value="Young">Young</option>
				    <option value="Adult">Adult</option>
				    <option value="Senior">Senior</option>
				    <option value="Baby">Baby</option>
				 </select>
		    </div>
		    
		    <div class="col-sm-2">
		    	<input type="submit" class="form-control btn-primary" value="Search">
		    </div>
		    
		    <div class="col-sm-1">
		    	<a href="./home.jsp" style="padding-left: 100%;">Home</a>
		    </div>
	    	<input type="hidden" name="param" value="pet_search.jsp">
			<input type="hidden" name="search" value="true">
			
		  </div>
		</div>
		
		
		<%
		if (session.getAttribute("display") != null && session.getAttribute("animalList") != null){
			List<Animal> animalList = (List<Animal>)session.getAttribute("animalList");
			if (animalList.size() <= 0) {
				out.println("<div class='container'><div class='row' style='padding-top: 5%;'>");
				out.println("<div class='alert alert-info' role='alert'>No animals found for selected filters. Please try some other combination.</div>");
				out.println("</div></div>");
			}
			else {
				out.println("<div class='container'><div class='card-columns' style='margin-top: 2%;'>");
				for (Animal a : animalList) {
					String gender = "Male";
					if (a.getAnimal_gender().toLowerCase().equals("f")) { gender = "Female"; }
					String buildProfileUrl = request.getContextPath() + "/PetServlet?param=pet_search.jsp&seeprofile=true&id="+a.getAnimal_id(); 
					out.println("<div class='card bg-light'><img class='card-img-top' style='height:60%;' src='data:image/jpeg;base64," + a.getAnimal_image() + "' alt='Card image'><div class='card-body text-center'><h4 class='card-title'>" + a.getAnimal_name() + "</h4><p class='card-text'>" + a.getAnimal_breed() + " | " + gender + " | " + a.getAnimal_age_group() + "</p><a href='" + buildProfileUrl + "' class='btn btn-primary'>See Profile</a></div></div>");
				}				
				out.println("</div></div>");
			}
		}
		%>
	</form>
	
</body>
</html>
