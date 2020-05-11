<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="administrator_afisare.css">
    <meta name="author" content="Paciurca Andrei-Alexandru">
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Administrator: Inserare</title>
</head>
<body>
    
    <div class="login-page">
        <div class="form">

          <h2 style="font-weight: bold; font-style: normal;">(Admin) Inserare</h2>
          
          <%
          String tableInsert = request.getParameter("selectTableInsert");
          if(tableInsert==null || tableInsert=="")
        	  response.sendRedirect("administrator_afisare.jsp");
          else
        	  session.setAttribute("tableInsert", tableInsert);
          
          tableInsert = session.getAttribute("tableInsert").toString();
          
          out.println("<h4 style=\"font-weight: bold; font-style: normal;\">Tabel: "+tableInsert.toUpperCase()+"</h4>");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital",
                  "root", "");
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("select * from " + tableInsert);
          ResultSetMetaData rsmd = rs.getMetaData();
          int columnCount = rsmd.getColumnCount();
          %>
          <form method="POST" action="AdminInsertData.jsp">
          <table>
          	<tr>
          	<%
          	for (int i = 1; i <= columnCount; i++ )
          	  out.println("<th>"+rsmd.getColumnName(i)+"</th>"); 
          	%>
          	</tr>
          	<tr>
          	<%
          		for (int i = 1; i <= columnCount; i++ ){
                	  if(i==1)
                		  out.println("<td><input type=\"hidden\"  name=\"insertInput\" value=\"NULL\"></td>");
                	  else if(rsmd.getColumnName(i).toString().toLowerCase().contains("id_"))
                		  out.println("<td><input type=\"number\" min=\"0\" pattern=\"[0-9]+\" size=75 name=\"insertInput\" value="+"\""+""+"\""+"/></td>");
                	  else if(rsmd.getColumnName(i).toString().toLowerCase().contains("data_"))
                		  out.println("<td><input type=\"date\" size=75 name=\"insertInput\" value="+"\""+""+"\""+"/></td>");
                	  else
                		  out.println("<td><input type=\"text\" size=75 name=\"insertInput\" value="+"\""+""+"\""+"/></td>");
          		}
          	%>
          	</tr>
          </table>
          <br>
          <button type="submit">Submit</button>
          </form>

          <br><br><br>


          <button type="submit" onclick="window.location.reload(false);">Refresh</button>
          <form action="goAdminInsert.jsp" method="POST">
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