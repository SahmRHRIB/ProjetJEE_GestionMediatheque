<html lang="fr">
<head>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="mediatheque.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
Mediatheque m = Mediatheque.getInstance();
List<Document> list = m.tousLesDocuments();
String login = (String)session.getAttribute("login");
String mdp =(String) session.getAttribute("mdp");
%>

  <title>Bibliothèquaire</title>
</head>
<body>
<h1>Bonjour <%=login%> </h1>
<div >
   <div >Ajout de document</div>
   <form action="ajoutState.jsp" method="post">
      Titre : <input type="text" class="input-field" name="titre" value="" />
      Auteur : <input type="text" class="input-field" name="auteur" value="" />
         Type :
         <select name="type" class="select-field" required>
			<option value="" select></option>
			<option value="1">CD</option>
            <option value="2">DVD</option>
            <option value="3">Livre</option>
         </select>
      <span> </span><input type="submit" value="Submit" />
   </form>
</div>
<a href="biblio.jsp"><input type="button" name="Répondre "value="Retour"/></a>

</body>
</html>