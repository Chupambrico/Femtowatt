<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%  
String titolo, argomento, autore, testo, data, ora; 
Integer id;
String idUtente = request.getParameter("n");
rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND \"UTENTE\".\"ID\" = '" + idUtente + "' AND \"PAGINA\".\"ATTIVO\" = 'on' AND \"PAGINA\".\"DEL\" <> 'on' ORDER BY \"DATA\"");
out.print("<table>");   
while(rs.next()){
        id = rs.getInt("ID");
        argomento = rs.getString("ARGOMENTO");
        titolo = rs.getString("TITOLO");
        autore = rs.getString("USERNAME");
        testo = rs.getString("TESTO");
        testo = testo.replaceAll("\\<.*?\\>", "");

        testo = testo.substring(0,100);
        
        data = rs.getString("DATA");
        ora = rs.getString("ORA");
        out.print("<tr><td><b><h4><a href='index.jsp?pag=viewPage&cod=" + id + "'>" + titolo + "</a></h4></b></td></tr>");
        out.print("<tr><td>In " + argomento + "</td></tr>");
        out.print("<tr><td>By <b>" + autore + "</b></td></tr>");
        out.print("<tr><td><i>" + testo + "...</i></td></tr>");
        out.print("<tr><td>" + data + " " + ora + "</td></tr>");
        out.print("<tr><td><hr width='800px' size='1' style='border: small dashed' ></td></tr>");
    }
out.print("</table>"); 
%>