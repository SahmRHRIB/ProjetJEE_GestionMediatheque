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

String name = request.getParameter("titre");
String auteur = request.getParameter("auteur");
int typeD = Integer.parseInt(request.getParameter("type"));
Object[] objs=new Object[2];
objs[0] = name;
objs[1] = auteur;
m.nouveauDocument(typeD,objs);
%>
<title>Ajout</title>
</head>
<body>
<h1>Ajout Réussi</h1>
<a href="ajout.jsp"><input type="button" name="Répondre "value="Retour"/></a>
</body>
</html>