<%


String username = request.getParameter("username");
String password = request.getParameter("password");

if(username.toLowerCase().equals("admin")){
	  if(password.toLowerCase().equals("admin"))
		  response.sendRedirect("admin_homepage.jsp");
	  else
		  response.sendRedirect("logout.jsp");
}
else
	  response.sendRedirect("logout.jsp");



%>