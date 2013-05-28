<%@page import="java.sql.*" import="java.util.*" import="java.net.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
  String nome = request.getParameter("alfa");
  rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" WHERE \"USERNAME\"='" + nome + "'");
  out.print(rs.next());
%>