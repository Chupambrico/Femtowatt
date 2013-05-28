<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
try{
    Login l = new Login(c.connetti());
    l.login(request.getParameter("u"), request.getParameter("p"));
    session.setAttribute("nome", request.getParameter("u"));
    session.setAttribute("password", request.getParameter("p"));
    rs = q.esecuzioneQuery("SELECT \"LIVELLO\" FROM \"UTENTE\" WHERE \"USERNAME\" = '" + request.getParameter("u") + "'", true);
    Integer liv = rs.getInt("LIVELLO");
    session.setAttribute("livello", liv);
    session.setAttribute("idSession", session.getId());
    out.print(session.getAttribute("nome"));
}catch(Exception e){}
%>