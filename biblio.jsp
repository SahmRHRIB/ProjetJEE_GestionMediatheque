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
String login = (String)session.getAttribute("login");
String mdp =(String) session.getAttribute("mdp");
%>
<h1>Bonjour <%=login%>! </h1>

<form method="POST" action="ajout.jsp">
		<input type="submit" value="Service Ajout Document">
</form>
<a href="deco.jsp"><input type="button" name="Deconnexion" value="Deconnexion"/></a>
