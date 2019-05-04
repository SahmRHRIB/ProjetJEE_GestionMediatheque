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

Document doc = m.getDocument(num);
Utilisateur u= (Utilisateur) session.getAttribute("user");
String login = (String)session.getAttribute("login");
String mdp =(String) session.getAttribute("mdp");
String msg="Emprunt réussi !";
try{
m.emprunt(doc,u);
}catch(EmpruntException e){
	msg="Déjà emprunté !";
}
%>
<title>Abonné</title>
</head>
<body>
<h1><%=msg%></h1>
<a href="emprunt.jsp"><input type="button" name="Répondre "value="Retour"/></a>
</body>
</html>