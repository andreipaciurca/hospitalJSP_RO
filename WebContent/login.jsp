<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="login.css">
    <meta name="author" content="Paciurca Andrei-Alexandru">
    <meta http-equiv="Content-Type" content="text/html;">
    <title>LogIn</title>
</head>
<body>
    
    <div class="login-page">
        <div class="form">
          <h2 style="font-weight: bold; font-style: normal;">LogIn</h2><br>
          <form class="login-form" method="post" action="loginLogic.jsp">
            <input type="text" name="username" placeholder="USERNAME"/>
            <input type="password" name="password" placeholder="PASSWORD"/>
            <button type="submit">login</button>
          </form>
        </div>
      </div>

      <div id="footer"><p>&copy; Paciurca Andrei-Alexandru &#64; AC TUIASI</p></div>

</body>
</html>
