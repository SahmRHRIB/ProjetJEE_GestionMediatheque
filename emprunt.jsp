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
Utilisateur u = (Utilisateur) session.getAttribute("user");

%>
<title>Abonné</title>
</head>
<body>
<table>
	<tr>
	<th>Id</th>
	<th>Type</th>
	<th>Nom</th>
	<th>Auteur</th>
	<th>Action</th>
	</tr>
	<% for (int i=0;i<list.size();i++) { %>
	<%Object[] obj= list.get(i).affiche();%>
	<tr>	
	<% for(int j =0;j<obj.length;j++){%>
    <td><%=obj[j]%></td>
	<%}%>
		<td>
		<form method="POST" action="empruntState.jsp">
		<input type="text" name="id" value="<%=obj[0]%>" hidden>
		<input type="submit" value="Emprunter">
		</form>
		</td>
	</tr>
	<%}%>
	</table>
	<a href="abonne.jsp"><input type="button" name="<--" value="Retour"/></a>
</body>
</html>