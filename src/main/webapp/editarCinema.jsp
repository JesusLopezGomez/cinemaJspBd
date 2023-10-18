<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.jacaranda.repository.CineRepository"%>
<%@page import="com.jacaranda.model.Cinema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar cine</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
//Intento ver si me ha puesto los datos para añadir un nuevo cine
	Cinema c = null;
	try{
		
		
		c = CineRepository.getCinema(request.getParameter("cine"));
		
	%>
		<form action="">
		  <div class="form-group row">
		    <label for="cine" class="col-4 col-form-label">Cine</label> 
		    <div class="col-8">
		      <input id="cine" name="cine" type="text" class="form-control" value='<%=c.getCine() %>' readonly>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="ciudad" class="col-4 col-form-label">Ciudad</label> 
		    <div class="col-8">
		      <input id="ciudad" name="ciudad" type="text" class="form-control" value='<%=c.getCiudadCine() %>'>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="ciudad" class="col-4 col-form-label">Direccion</label> 
		    <div class="col-8">
		      <input id="ciudad" name="direccion" type="text" class="form-control" value='<%=c.getDireccionCine() %>'>
		    </div>
		  </div> 
		  <div class="form-group row">
		    <div class="offset-4 col-8">
		      <button name="submit" type="submit" class="btn btn-primary">Submit</button>
		    </div>
		  </div>
		</form>
		<%
		if(request.getParameter("submit") != null){
			Cinema c2 = new Cinema(request.getParameter("cine"),request.getParameter("ciudad"),request.getParameter("direccion"));
			CineRepository.anniadirCine(c2);
		}
		%>

	<%}catch(Exception e){
	}
%>
</body>
</html>