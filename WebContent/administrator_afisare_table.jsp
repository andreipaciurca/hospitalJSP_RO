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
    <title>Administrator: Afisare | Stergere</title>
</head>
<body>
    
    <div class="login-page">
        <div class="form">

          <h2 style="font-weight: bold; font-style: normal;">(Admin) Afisare | Stergere</h2>
          
          <%
          String table = request.getParameter("selectTable");
          if(table==null || table=="")
        	  response.sendRedirect("administrator_afisare.jsp");
          else
        	  session.setAttribute("table", table);
          
          table = session.getAttribute("table").toString();
          
          out.println("<h4 style=\"font-weight: bold; font-style: normal;\">Tabel: "+table.toUpperCase()+"</h4>");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital",
                  "root", "");
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("select * from " + table);
          ResultSetMetaData rsmd = rs.getMetaData();
          int columnCount = rsmd.getColumnCount();
          %>
          <form method="POST" action="AdminDeleteTables.jsp">
          <table>
          	<tr>
          	<%
          	for (int i = 1; i <= columnCount; i++ )
          	  out.println("<th>"+rsmd.getColumnName(i)+"</th>"); 
          	out.println("<th>DELETE</th>");
          	%>
          	</tr>
          	<%
          	String valueRowID = "";
          	while(rs.next()){
          		out.println("<tr>");
          		for (int i = 1; i <= columnCount; i++ ){
                	  out.println("<td>"+rs.getString(i)+"</td>");
                	  if(i==1) //prima coloana -> cheia primara a tabelului: ID_(text)
                	  	valueRowID = rs.getString(i);
          		}
          		out.println("<td><input type=\"checkbox\" name=\"idCheckBox\" value="+"\""+valueRowID+"\""+"/></td>");
          		out.println("</tr>");
          	}
          	%>
          </table>
          <br>
          <button type="submit">Delete</button>
          </form>

          <br><br><br>


          <button type="submit" onclick="window.location.reload(false);">Refresh</button>
          <form action="changeTable.jsp" method="POST">
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