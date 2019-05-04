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

String login = request.getParameter("login");
String mdp = request.getParameter("mdp");

if(m.getUser(login,mdp)==null){
	 request.getRequestDispatcher("index.jsp").forward(request, response);
}

Utilisateur u = m.getUser(login,mdp);
session.setAttribute("user",u);
session.setAttribute("login",login);
session.setAttribute("mdp",mdp);


if(u.isBibliothecaire()!=true){
	 request.getRequestDispatcher("abonne.jsp").forward(request, response);
}else{
	 request.getRequestDispatcher("biblio.jsp").forward(request, response);
}
%>

<body>
</body>
</html>