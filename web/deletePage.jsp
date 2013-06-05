<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
String id = request.getParameter("cod"); 
Integer ids = Integer.parseInt(id);
q.esecuzioneUpdate("UPDATE  \"PAGINA\" SET \"DEL\"='on' WHERE ID='"+ids+"' ");
%>
