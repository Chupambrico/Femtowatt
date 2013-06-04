<%@page import="java.sql.*" import="java.util.*" import="java.net.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
    rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" WHERE \"ID\"='" + request.getParameter("cod") + "'");
    while(rs.next()){
        String id = rs.getString("ID");
        String nome = rs.getString("NOME");
        String cognome = rs.getString("COGNOME");
        String dataNascita = rs.getString("DATADINASCITA");
        String email = rs.getString("EMAIL");
        String username = rs.getString("USERNAME");
        String livello = rs.getString("LIVELLO");
        
        out.print("<table border='0'>");
        out.print("<tr><td>Id</td><td>: <b>" + id + "</b></td></tr>");
        out.print("<tr><td>Nome</td><td>: <b>" + nome + "</b></td></tr>");
        out.print("<tr><td>Cognome</td><td>: <b>" + cognome + "</b></td></tr>");
        out.print("<tr><td>Data di nascita</td><td>: <b>" + dataNascita + "</b></td></tr>");
        out.print("<tr><td>Email</td><td>: <b>" + email + "</b></td></tr>");
        out.print("<tr><td>Username</td><td>: <b>" + username + "</b></td></tr>");
        out.print("<tr><td>Livello</td><td>: <b>" + livello + "</b></td></tr>");
        out.print("</table>");
  }
%>