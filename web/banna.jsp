<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
Enumeration parametri = request.getParameterNames();
while(parametri.hasMoreElements()){
    String nome = (String) parametri.nextElement(); 
    String valore = request.getParameter(nome); 
    Integer id = Integer.parseInt(nome);
    q.esecuzioneUpdate("UPDATE \"UTENTE\" SET \"BAN\"='" + valore + "' WHERE ID='" + id + "'");
}
%>
