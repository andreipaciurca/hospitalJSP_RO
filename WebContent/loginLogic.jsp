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
		  response.sendRedirect("admin_homepage.jsp");
	  else
		  response.sendRedirect("logout.jsp");
}
else if(username.toLowerCase().equals("registratura")){
	if(password.toLowerCase().equals("registratura"))
		  response.sendRedirect("admin_homepage.jsp");
	  else
		  response.sendRedirect("logout.jsp");
}
else
	  response.sendRedirect("logout.jsp");



%>