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
<title>Abonné</title>
</head>
<body>
<h1>Retour</h1>
<form method="POST" action="retourState.jsp">
	Numéro du livre à retourner : <input type="text" name="id" value="">
	<input type="submit" value="Retourner">
</form>
<a href="abonne.jsp"><input type="button" name="<--" value="Retour"/></a>

</body>
</html>