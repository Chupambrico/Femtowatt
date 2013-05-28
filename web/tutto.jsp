<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
rs = q.esecuzioneQuery("SELECT DISTINCT TITOLO FROM \"PAGINA\"  ORDER BY \"TITOLO\" ");
while(rs.next()){
    out.print(rs.getString("TITOLO") + "/");
}
%>