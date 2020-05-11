<%@ page import ="java.sql.*" %>
<%
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from " + session.getAttribute("tableInsert"));
    ResultSetMetaData rsmd = rs.getMetaData();
    
    String[] columns = new  String [rsmd.getColumnCount()];
    for (int i = 1; i <= rsmd.getColumnCount(); i++ )
    	columns[i-1] = rsmd.getColumnName(i).toString(); //coloane pentru UPDATE

	String[] toInsert = request.getParameterValues("insertInput"); //date coloane pt UPDATE
	if (toInsert != null && toInsert.length != 0) {
		for (String insert : toInsert){
			 System.out.print(" "+insert+" ");
		}	
	}

	//response.sendRedirect("administrator_afisare_table.jsp");

%>