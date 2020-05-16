<%@ page import ="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from " + session.getAttribute("tableUpdate").toString());
    ResultSetMetaData rsmd = rs.getMetaData();
    
	String[] toInsert = request.getParameterValues("updateInput"); //date coloane pt UPDATE

	for (int i = 1; i <= rsmd.getColumnCount(); i++ ){
		int update = st.executeUpdate("UPDATE "+session.getAttribute("tableUpdate").toString()+" SET "+rsmd.getColumnName(i)+" = ' "+toInsert[i-1]+"' WHERE "+rsmd.getColumnName(1)+"="+toInsert[0]);
		if(update <= 0){
			response.sendRedirect("logout.jsp");
		}
	}
	response.sendRedirect("admin_select_update.jsp");
%>