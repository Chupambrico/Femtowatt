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
        String visual[] = dataNascita.split("-");
        dataNascita=visual[2];
        dataNascita+="/"+ visual[1];
        dataNascita+="/"+visual[0];               
               
        out.print("<table border='0'>");
        out.print("<tr><td>Nome</td><td>: <b>" + nome + "</b></td></tr>");
        out.print("<tr><td>Cognome</td><td>: <b>" + cognome + "</b></td></tr>");
        out.print("<tr><td>Data di nascita</td><td>: <b>" + dataNascita + "</b></td></tr>");
        out.print("<tr><td>Email</td><td>: <b>" + email + "</b></td></tr>");
        out.print("<tr><td>Username</td><td>: <b>" + username + "</b></td></tr>");
        if(livello.equals("10")){livello="<font color='red'>Amministratore</font>";}
        if(livello.equals("5")){livello="<font color='lime'>Utente normale</font>";}
        if(livello.equals("1")){livello="<font color='blue'>Guest</font>";}
        if(livello.equals("0")){livello="<font color='red'>Bannato</font>";}
        out.print("<tr><td>Livello</td><td>: <b>" + livello + "</b></td></tr>");
        out.print("</table>");
  }
%>