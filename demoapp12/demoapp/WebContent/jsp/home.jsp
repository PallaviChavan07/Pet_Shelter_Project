<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>welcome</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<%	
	if(session.getAttribute("username") == null){
		response.sendRedirect(request.getContextPath() + "/Login");
	}
    int empId = Integer.parseInt( String.valueOf(session.getAttribute("username")));
	System.out.println("ON HOME jsp empId = "+empId);
	request.getSession().setAttribute("empId", empId);
%>

<div class="jumbotron text-center">
	  <h1>Pet Care</h1>
</div>

<br/><br/>
<div class="container">
	<div class="row">
		<div class="col-lg-3 card bg-light">
			<img class="card-img-top" src="../images/addpet.png">
			<div class="card-body text-center">
				<a class="card-title" href="<%=request.getContextPath()%>/PetServlet?param=home.jsp&task=addpet"><strong>Add Pet</strong></a>
			</div>
		</div>
		
		<div class="col-lg-3 card bg-light">
			<img class="card-img-top" src="../images/adopter.jpg">
			<div class="card-body text-center">
				<a class="card-title" href="<%=request.getContextPath()%>/PetServlet?param=home.jsp&task=addadopter"><strong>Add Adopter</strong></a>
			</div>
		</div>
		
		<div class="col-lg-3 card bg-light">
			<img class="card-img-top" src="../images/search.png">
			<div class="card-body text-center">
				<a class="card-title" href="<%=request.getContextPath()%>/PetServlet?param=home.jsp&task=petsearch"><strong>Pet Search</strong></a>
			</div>
		</div>
		
		<div class="col-lg-3 card bg-light">
			<img class="card-img-top" src="../images/reports.jpg">
			<div class="card-body text-center">
				<a class="card-title" href="<%=request.getContextPath()%>/PetServlet?param=home.jsp&task=reports"><strong>Reports</strong></a>
			</div>
		</div>
				
	</div>
</div>

<form action = "Logout">
<br/><br/><br/><br/>
<div class="card-body text-center">
	<a class="card-title" href="<%=request.getContextPath()%>/Logout"><strong>Logout</strong></a>
</div>
<input type="hidden" name="jsppage" value="home.jsp">
</form>
<%
session.setAttribute("animalList", null);
session.setAttribute("inMap", null);
session.setAttribute("outMap", null);
session.setAttribute("resultset", null);
session.setAttribute("graphreport", null);
%>
</body>
</html>