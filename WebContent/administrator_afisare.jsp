<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="administrator_afisare.css">
    <meta name="author" content="Paciurca Andrei-Alexandru">
    <meta http-equiv="Content-Type" content="text/html;">
    <title>Administrator: Afisare | Stergere</title>

    <script type="text/javascript">
        function Reset() {
            var dropDown = document.getElementById("tabel");
            dropDown.selectedIndex = 0;
            window.location.reload();
        }
    </script>

</head>
<body>
    
    <div class="login-page">
        <div class="form">

          <h2 style="font-weight: bold; font-style: normal;">(Admin) Afisare | Stergere</h2><br>
        
          <form method="POST" action="administrator_afisare_table.jsp">
            <select id="tabel" name="selectTable" onfocus='this.size=6;' onblur='this.size=0;' onchange='this.size=1; this.blur();'>
                <option value="" disabled selected>Select table</option>
                <option value="fise_observatii">Fise Observatii</option>    
                <option value="pacienti">Pacienti</option>
                <option value="medici">Medici</option>
                <option value="sectii">Sectii</option>
                <option value="diagnostice">Diagnostice</option>
                <option value="users">Users</option>
            </select>
            <button type="submit">Submit</button>
          </form>
          
          <br><br><br>
          
		  <form action="goAdminHome.jsp" method="POST">
            <button type="submit">Go Back</button>
          </form>
		  <button type="reset" onclick="Reset();">Reset</button>
          <form action="logout.jsp" method="post">
            <button type="submit">LogOut</button>
          </form>
        
        </div>
      </div>

      <div id="footer"><p>&copy; Paciurca Andrei-Alexandru &#64; AC TUIASI</p></div>

</body>
</html>