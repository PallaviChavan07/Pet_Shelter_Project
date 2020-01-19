<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Login page</title>
</head>
<body>
	<div class="jumbotron text-center">
	  <h1>User Login</h1> 
	</div>
	<center>
	<form action = "Login">
	<div class="container">
		<div class="form-group row  ">
			<label for="userid" class="col-sm-5 col-form-label text-right">Enter UserID</label>
		    <div class="col-sm-3">
		      <input type="text" class="form-control" id="userid" name="username">
		    </div>
		</div>
		<div class="form-group row">
	    	<label for="password" class="col-sm-5 col-form-label text-right">Enter Password</label>
		    <div class="col-sm-3">
		      <input type="password" class="form-control" id="password" name="password" >
		    </div>
	  </div>
	  <div class="row">
	   <!--   <label for="submit" class="col-sm col-form-label "></label>-->
		<div class=" col-sm ">
			<button type="submit" id="submit" class="btn btn-primary">Sign in</button>
			<input type="hidden" name="param" value="login.jsp" />
		</div>
	</div>	
	</div>
	</form>
	</center>
</body>
</html>