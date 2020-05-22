<%@ page import ="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from fise_observatii");
    ResultSetMetaData rsmd = rs.getMetaData();
    
	String[] toInsert = request.getParameterValues("updateInput");

		int update = 0;
		update = st.executeUpdate("UPDATE fise_observatii SET " +
		"ID_DIAGNOSTIC = ' "+toInsert[0]+"' , "+
		"DATA_INTERNARE = ' "+toInsert[1]+"' , "+
		"DATA_EXTERNARE = ' "+toInsert[2]+"' "+
		" WHERE "+rsmd.getColumnName(1)+"="+session.getAttribute("IDrow"));		
		
		if(update <= 0)
			response.sendRedirect("logout.jsp");
		
	response.sendRedirect("medic_homepage.jsp");
%>