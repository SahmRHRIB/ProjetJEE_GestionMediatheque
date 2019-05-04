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
Utilisateur u = m.getUser(login,mdp);
%>

<title>Abonné</title>
</head>
<body>
<h1>Bonjour <%=login%>! </h1>
<form method="POST" action="emprunt.jsp">
		<input type="submit" value="Service Emprunt">
</form>
<form method="POST" action="retour.jsp">
		<input type="submit" value="Service Retour">
</form>
<a href="deco.jsp"><input type="button" name="Deconnexion" value="Deconnexion"/></a>

</body>
</html>