<%@page import="java.util.List"%>
<%@page import="com.jacaranda.repository.CineRepository"%>
<%@page import="com.jacaranda.model.Cinema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado cines</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<% 
		List<Cinema> result = null;
		try{
			result = CineRepository.getCinemas();
		}catch(Exception e){
			
		}
	%>

	<table class="table">
		<thread>
			<tr>
				<th scope="col">Cine</th>
				<th scope="col">Direccion</th>
				<th scope="col">Ciudad</th>
			</tr>
		</thread>
		<% for (Cinema c: result){%>
				<tr>
					<td><%=c.getCine()%></td>
					<td><%=c.getCiudadCine()%></td>
					<td><%=c.getDireccionCine()%></td>
					<td>
						<form action="./editarCinema.jsp">
							<input type="text" name="cine" value='<%=c.getCine()%>' hidden>
							<button type="submit">Editar</button>
						</form>
					</td>
					<td>
						<form action="./deleteCinema.jsp">
							<input type="text" name="cineBorrar" value='<%=c.getCine()%>' hidden>
							<button type="submit" name="borrar">Borrar</button>
						</form>
					</td>
				</tr>
		<% }%>
		
		<%if(request.getParameter("borrar") != null){
			CineRepository.deleteCinema(request.getParameter("cineBorrar"));
		}%>
		
	</table>
</body>
</html>