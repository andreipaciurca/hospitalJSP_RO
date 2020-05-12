<%@ page import ="java.sql.*" %>
<%
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from " + session.getAttribute("table"));
    ResultSetMetaData rsmd = rs.getMetaData();
    
    String ID = rsmd.getColumnName(1);
    
	String[] select = request.getParameterValues("idCheckBox");
	if (select != null && select.length != 0) {
		for (String delete : select){
			 st.executeUpdate("DELETE from "+session.getAttribute("table")+" where "+ID+"="+delete);
		}	
	}
	
	response.sendRedirect("administrator_afisare_table.jsp");

%>