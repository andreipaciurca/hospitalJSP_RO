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
    <title>Medic: Modificare</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
    
    <div class="login-page">
        <div class="form">

          <h2 style="font-weight: bold; font-style: normal;">(Medic) Update</h2>
          
          <%
          String tableUpdate = "fise_observatii";
          String radioToUpdate = request.getParameter("idRadioUpdate");
          
          if(tableUpdate==null || tableUpdate=="")
        	  response.sendRedirect("medic_homepage.jsp");
          else
        	  session.setAttribute("tableUpdate", tableUpdate);
          
          tableUpdate = session.getAttribute("tableUpdate").toString();
          
          out.println("<h4 style=\"font-weight: bold; font-style: normal;\">Tabel: "+tableUpdate.toUpperCase()+"</h4>");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spital","root", "");
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("select * from " + tableUpdate);
          ResultSetMetaData rsmd = rs.getMetaData();
          int columnCount = rsmd.getColumnCount();
          %>
          
          <form method="POST" action="medic_update_finalLogic.jsp">
	          <table>
	          	<tr>
	          	<%
	          	for (int i = 1; i <= columnCount; i++ )
	          		if(rsmd.getColumnName(i).toString().toLowerCase().contains("id_diagnostic"))
	          	  		out.println("<th>"+rsmd.getColumnName(i)+"</th>"); 
	          		else if(rsmd.getColumnName(i).toString().toLowerCase().contains("data_"))
	          			out.println("<th>"+rsmd.getColumnName(i)+"</th>"); 
	          		else
	          			continue;
	          	%>
	          	</tr>
	          	<tr>
	          	<%
	          	rs = st.executeQuery("select * from " + tableUpdate + " WHERE "+rsmd.getColumnName(1)+"="+radioToUpdate);
	          	rs.next();
	          	String date = LocalDateTime.now().toString();
	          	for (int i = 1; i <= columnCount; i++ ){
	          				if(i==1)
	          					session.setAttribute("IDrow", rs.getString(i));
	                	   if(rsmd.getColumnName(i).toString().toLowerCase().contains("id_diagnostic"))
	                		  out.println("<td><input type=\"text\" onkeypress=\"return (event.charCode == 8 || event.charCode == 0 || event.charCode == 13) ? null : event.charCode >= 48 && event.charCode <= 57\" min=\"0\" step=\"1\" size=90 name=\"updateInput\" value=" +"\"" + rs.getString(i)+" \""+ " required/></td>");
	                	  else if(rsmd.getColumnName(i).toString().toLowerCase().contains("data_"))
	                		  out.println("<td><input type=\"text\" placeholder=\"yyyy-mm-dd hh:mm:ss\" size=110 name=\"updateInput\" value="+"\"" + rs.getString(i)+"\""+" /></td>");
	                	  else
	                		  continue;   
	          		}
	          	%>
	          	</tr>
	          </table>
	          
	          <br>
	          
	          <button type="submit">Submit</button>
          </form>

          <br><br><br>

          <button type="submit" onclick="window.location.reload(false);">Refresh</button>
          
          <form action="goMedicHomepage.jsp" method="POST">
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