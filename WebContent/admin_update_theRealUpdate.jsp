<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" 
		 import ="java.time.LocalDateTime"
%>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="administrator_afisare.css">
    <meta name="author" content="Paciurca Andrei-Alexandru">
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Administrator: Modificare</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
    
    <div class="login-page">
        <div class="form">

          <h2 style="font-weight: bold; font-style: normal;">(Admin) Update</h2>
          
          <%
          String tableUpdate = request.getParameter("tableUpdate");
          if(tableUpdate==null || tableUpdate=="")
        	  response.sendRedirect("admin_select_update.jsp");
          else
        	  session.setAttribute("tableUpdate", tableUpdate);
          
          tableUpdate = session.getAttribute("tableUpdate").toString();
          
          out.println("<h4 style=\"font-weight: bold; font-style: normal;\">Tabel: "+tableUpdate.toUpperCase()+"</h4>");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital",
                  "root", "");
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("select * from " + tableUpdate);
          ResultSetMetaData rsmd = rs.getMetaData();
          int columnCount = rsmd.getColumnCount();
          %>
          
          <form method="POST" action="">
	          <table>
	          	<tr>
	          	<%
	          	for (int i = 1; i <= columnCount; i++ )
	          	  out.println("<th>"+rsmd.getColumnName(i)+"</th>");
	          	out.println("<th>UPDATE</th>");
	          	%>
	          	</tr>
	          	<%
	          	if(rs.next() == false)
	          		response.sendRedirect("goAdminUpdate.jsp");
	          	else{
		          	String valueRowID = "";
		          	do{
		          		out.println("<tr>");
		          		for (int i = 1; i <= columnCount; i++ ){
		                	  out.println("<td>"+rs.getString(i)+"</td>");
		                	  if(i==1) //prima coloana -> cheia primara a tabelului: ID_(text)
		                	  	valueRowID = rs.getString(i);
		          		}
		          		out.println("<td><input type=\"radio\" name=\"idRadio\" value="+"\""+valueRowID+"\""+"/></td>");
		          		out.println("</tr>");
		          	}while(rs.next());
	          	}
	          	%>
	          </table>
	          
	          <br>
	          
	          <button type="submit">Submit</button>
          </form>

          <br><br><br>

          <button type="submit" onclick="window.location.reload(false);">Refresh</button>
          
          <form action="goAdminUpdate.jsp" method="POST">
            <button type="submit">Go Back</button>
          </form>
          
          <form action="logout.jsp" method="POST">
            <button type="submit">LogOut</button>
          </form>

        </div>
      </div>

      <div id="footer"><p>&copy; Paciurca Andrei-Alexandru &#64; AC TUIASI</p></div>

</body>
</html>