<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username.toLowerCase().equals("admin")){
		  if(password.toLowerCase().equals("admin"))
			  response.sendRedirect("admin_homepage.jsp");
		  else
			  response.sendRedirect("logout.jsp");
	}
	else if(username.toLowerCase().equals("medic")){
		if(password.toLowerCase().equals("medic"))
			  response.sendRedirect("medic_homepage.jsp");
		  else
			  response.sendRedirect("logout.jsp");
	}
	else if(username.toLowerCase().equals("registratura")){
		if(password.toLowerCase().equals("registratura"))
			  response.sendRedirect("registratura_homepage.jsp");
		  else
			  response.sendRedirect("logout.jsp");
	}
	else
		  response.sendRedirect("logout.jsp");

%>