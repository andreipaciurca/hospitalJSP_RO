<%@ page import ="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from " + session.getAttribute("tableInsert"));
    ResultSetMetaData rsmd = rs.getMetaData();
    
    String columns = " ( ";
    for (int i = 1; i <= rsmd.getColumnCount(); i++ ){
    	if(i<rsmd.getColumnCount())
    		columns = columns +  rsmd.getColumnName(i).toString() + " , ";
    	else
    		columns = columns +  rsmd.getColumnName(i).toString() + " ) ";
    	}	
    	
	String values = " ( ";
	String[] toInsert = request.getParameterValues("insertInput"); //date coloane pt UPDATE
	if (toInsert != null && toInsert.length != 0) {
		for (int i = 1; i <= rsmd.getColumnCount(); i++ ){
	    	if(i<rsmd.getColumnCount())
	    		values +=   "'" + toInsert[i-1]+ "'" + " , ";
	    	else
	    		values +=  "'" + toInsert[i-1]+ "'" + " ) ";
	    	}		
	}
	
	

	/*int update = st.executeUpdate("INSERT INTO "+session.getAttribute("tableInsert")+" "+columns+" VALUES "+values);
	if(update > 0){
		response.sendRedirect("admin_inserare.jsp");
	}
	else{
		response.sendRedirect("logout.jsp");
	}*/
%>