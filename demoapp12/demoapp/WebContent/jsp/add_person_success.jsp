<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Person Success</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<br/><br/>
	<div class="alert alert-success">
	  <strong>${firstname} added Successfully.</strong>
	  <a href="<%=request.getContextPath()%>/PetServlet?param=home.jsp&task=petsearch">Click here</a> to search a pet for recently added adopter.
	</div>
	<br/><br/>
	
	<div class="form-row">
		<div class="form-group col-sm">
	    	<a href="./home.jsp" style="padding-left: 100%;">Home</a>
	    </div>			    	
	</div>	
</div>

</body>
</html>