<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Paciurca Andrei-Alexandru">
    <meta http-equiv="Content-Type" content="text/html;">
    <link rel="stylesheet" type="text/css" href="administrator_homepage.css">
    <title>Registratura: Homepage</title>
</head>
<body>
    
    <div class="login-page">
        <div class="form">
        
          <h2 style="font-weight: bold; font-style: normal;">User: Registratura</h2><br>
          
          <form class="login-form" action="registratura_creare_fisa.jsp" method="post">
            <button type="submit">Creare fisa observatii</button>
          </form>
          
          <br><br>
          
          <form action="logout.jsp" method="post">
            <button type="submit">LogOut</button>
          </form>
        
        </div>
      </div>

      <div id="footer"><p>&copy; Paciurca Andrei-Alexandru &#64; AC TUIASI</p></div>

</body>
</html>