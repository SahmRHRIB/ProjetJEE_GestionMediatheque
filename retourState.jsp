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
int num = Integer.parseInt(request.getParameter("id"));
String login = (String)session.getAttribute("login");
String mdp =(String) session.getAttribute("mdp");
Document doc = m.getDocument(num);
m.retour(doc);
%>
<title>Abonné</title>
</head>
<body>
<h1>Retour Réussi</h1>
<a href="retour.jsp"><input type="button" name="Répondre "value="Retour"/></a>
</body>
</html>