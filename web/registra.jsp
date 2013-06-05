<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%
String nome = request.getParameter("nome") ;      
String cognome = request.getParameter("cognome") ; 
String dataDiN = request.getParameter("dataDiN") ; 
String utente = request.getParameter("utente") ; 
String password = request.getParameter("password") ; 
String email = request.getParameter("email") ; 
String controlloData[] = dataDiN.split("/");
String giorno = controlloData[0];
String mese = controlloData[1];
String anno = controlloData[2];
String data = mese + "/" + giorno + "/" + anno;
q.esecuzioneUpdate("INSERT INTO \"UTENTE\" (\"NOME\", \"COGNOME\", \"DATADINASCITA\", \"EMAIL\", \"USERNAME\", \"PASS\", \"LIVELLO\", \"BAN\") VALUES ('" + nome + "', '" + cognome + "', '" +data+ "', '" + email + "', '" + utente + "', '" + password + "', '1', 'off')");
%>
