<%@ page contentType="text/html; charset=UTF-8" %>

<title>Authentification</title>
</head>
<body>
  <div >
    <form  method="POST" action="accueil.jsp">
      <div ></div>
      <div >       
        <h2 >Connexion bibliothèque</h2>
        <input type="text" class="form-control" name="login" placeholder="Login" required="" />
        <input type="password" class="form-control" name="mdp" placeholder="Password" required=""/>      
        <button  type="submit">Connexion</button>
      </div>   
    </form>
  </div>
</html>