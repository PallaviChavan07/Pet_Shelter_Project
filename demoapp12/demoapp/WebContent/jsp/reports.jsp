<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
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
</head>

<body>
<%
	String InTakeDataPoints = "[]";
	String AdoptionDataPoints = "[]";
	if (session.getAttribute("graphreport") != null && session.getAttribute("graphreport").equals(1)) {
		Gson gsonObj = new Gson();
		Map<Object,Object> map = null;
		List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
		
		if (session.getAttribute("inMap") != null && session.getAttribute("graphreport").equals(1)) {
			HashMap<String, Integer> inMap = (HashMap<String, Integer>)session.getAttribute("inMap");
			Iterator it = inMap.entrySet().iterator();
		    while (it.hasNext()) {
		        Map.Entry pair = (Map.Entry)it.next();
		        map = new HashMap<Object,Object>();
		        map.put("label", pair.getKey());
		        map.put("y", pair.getValue());
		        list.add(map);
		    }
		}
		InTakeDataPoints = gsonObj.toJson(list);
		
		list = new ArrayList<Map<Object,Object>>();	
		if (session.getAttribute("outMap") != null && session.getAttribute("graphreport").equals(1)) {
		    HashMap<String, Integer> outMap = (HashMap<String, Integer>)session.getAttribute("outMap");
		    Iterator it = outMap.entrySet().iterator();
		    while (it.hasNext()) {
		        Map.Entry pair = (Map.Entry)it.next();
		        map = new HashMap<Object,Object>();
		        map.put("label", pair.getKey());
		        map.put("y", pair.getValue());
		        list.add(map);
		    }
		}	 
		AdoptionDataPoints = gsonObj.toJson(list);
	}
%>

<script language="javascript">
function createUrl() {
	if (document.getElementsByName('months') != 'undefined') {
		var sel = document.getElementsByName('months')[0];
		var sv = sel.value;
		var buildurl = '<%=request.getContextPath()%>/PetServlet?param=reports.jsp&report=longtermpets&months=';
		//console.log(buildurl + sv);
		window.location.href = buildurl + sv;
	}
}

window.onload = function() {
	var chart = new CanvasJS.Chart("GraphReport", {
		animationEnabled: true,
		theme: "light",
		title: { text: "Shelter Monthly Traffic" },
		axisX: { title: "Months" },
		axisY: { title: "Count", },
		toolTip: { shared: true },
		data: [{
			type: "line",
			name: "InTake",
			yValueFormatString: "###",
			showInLegend: true,
			dataPoints: <%out.print(InTakeDataPoints);%>
		}, {
			type: "line",
			name: "Adoption",
			yValueFormatString: "###",
			showInLegend: true,
			dataPoints: <%out.print(AdoptionDataPoints);%>
		}]
	});
	chart.render();
}
</script>

<div class="jumbotron text-center">
	  <h1>Reports</h1>
	  <a href="./home.jsp" style="padding-left: 90%;">Home</a>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-4">
			<form>
			<table class="table table-striped">
				<tr>
					<td> <a href="#" onclick='createUrl()'>  Pets in the shelter more than months </a></td>
					<td>
					<select name="months" id="month">
					    <option value="1">1</option>
					    <option value="2">2</option>
					    <option value="3">3</option>
					    <option value="4">4</option>
					    <option value="5">5</option>
					    <option value="6">6</option>
					 </select>
					 </td>
				</tr>
			</table>
				<input type="hidden" name="param" value="reports.jsp" />
			</form>
		</div>
		<div class="col-sm-4">
			<form>
			<table class="table table-striped">
				<tr>
					<td> <a href="<%=request.getContextPath()%>/PetServlet?param=reports.jsp&report=entryreason"> Shelter Entry Reason </a></td>
				</tr>
			</table>
				<input type="hidden" name="param" value="reports.jsp" />
			</form>
		</div>
		<div class="col-sm-4">
			<form>
			<table class="table table-striped">
				<tr>
					<td> <a href="<%=request.getContextPath()%>/PetServlet?param=reports.jsp&report=monthlyinout"> Monthly In Out of Pets </a></td>					
				</tr>
			</table>
				<input type="hidden" name="param" value="reports.jsp" />
			</form>
		</div>
	</div>
	
	
	<div class="row" id="GenericReports">		
	  	<div class="col-sm-12"> 
			<%
			if(session.getAttribute("resultset") != null){
				//out.println("resultset is not null");
				ResultSet resultset = (ResultSet)session.getAttribute("resultset");				
				ResultSetMetaData rsmd = resultset.getMetaData();				
				%>
				<table class="table table-striped">
				<thead>
				<tr>
					<%for(int i = 1; i<= rsmd.getColumnCount(); i++){%>
						<th><%=rsmd.getColumnName(i)%>	</th>
					<% 			
					}
				  %>	
				</tr>
				</thead>
				<%while(resultset.next()){%>
				<tr>	
					<% 		
					for(int i = 1; i<= rsmd.getColumnCount(); i++){
						%>
						<td><%=resultset.getString(i).toString()%>	</td>
					<% 			
					}
				  %>
				  </tr>
				  <%
				}%>
				</table>
			<%}%>		
		</div>
	</div>
	<div id="GraphReport" style="height: 370px; width: 100%;"> </div>
</div>
	<%
	//System.out.println(session.getAttribute("graphreport"));
	if (session.getAttribute("graphreport") == null) {
		%><script language="javascript">document.getElementById('GraphReport').remove();</script><%
	} else if (session.getAttribute("graphreport").equals(0)) {
		%><script language="javascript">document.getElementById('GraphReport').remove();</script><%
	} else if (session.getAttribute("graphreport").equals(1)) {
		%><script language="javascript">document.getElementById('GenericReports').remove();</script><%
	}
	%>
</body>
</html>