<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%  
String nome, cognome; 
Integer id;                                                              
rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" ORDER BY \"NOME\"");
out.print("<table>");   
out.print("<tr><td>Nome</td><td>Cognome</td></tr>");        
while(rs.next()){
    nome = rs.getString("NOME");           
    cognome = rs.getString("COGNOME");
    id = rs.getInt("ID");
    out.print("<tr><td><a href='profilo.jsp?cod=" + id + "'>" + nome + "</a></td><td><a href='profilo.jsp?cod=" + id + "'>" + cognome + "</a></td></tr>");
}
out.print("</table>"); 
%>