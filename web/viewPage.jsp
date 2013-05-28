<%@page import="java.sql.*" import="database.CreaConnessione" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%
String id = request.getParameter("cod"); 
String testo = "";   
String titolo = "";
String autore = "";
Integer ids = Integer.parseInt(id);   

rs = q.esecuzioneQuery("SELECT *" + 
                           "FROM \"PAGINA\", \"UTENTE\"" + 
                           "WHERE \"PAGINA\".\"IDUTENTE\" = \"UTENTE\".\"ID\"" + 
                           "AND \"PAGINA\".\"ID\" = " + ids);
while (rs.next()){
    titolo = rs.getString("TITOLO");
    autore = rs.getString("USERNAME");            
    testo = rs.getString("TESTO");
}

rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" WHERE \"PAGINALEGATA\" = " + ids + " ORDER BY NPAGINA ASC");
while (rs.next()){
    testo += rs.getString("TESTO");
}                            
out.print("Titolo : <b>" + titolo + "</b><br>");
out.print("Autore : <b>" + autore + "</b><br><br>");
out.print("Testo  : <br>" + testo);
%>
<br><br>
<a href="try.jsp?pag=showPages">Indietro</a>