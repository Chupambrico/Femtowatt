<%@page import="java.util.*" import="java.net.*" import="java.sql.*" import="database.CreaConnessione" import="database.Login" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp"%>
<%
rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\",\"UTENTE\" WHERE \"PAGINA\".\"IDUTENTE\"=\"UTENTE\".\"ID\" AND \"PAGINA\".\"ATTIVO\" = 'on' AND \"PAGINA\".\"DEL\" <> 'on' ORDER BY \"DATA\" DESC ,\"ORA\" DESC ");
int i=0;
int id = 0;
String titolo, argomento, testo, autore, ora, data;
out.print("<table width='800px'>");
while((rs.next()) && (i < 10)){//Bottone number 1
    i++;
    id = rs.getInt("ID");
    argomento = rs.getString("ARGOMENTO");
    titolo = rs.getString("TITOLO");
    autore = rs.getString("USERNAME");
    testo = rs.getString("TESTO");
    testo = testo.replaceAll("\\<.*?\\>", "");

    Integer ltesto = testo.length();

    if(ltesto > 100){
        testo = testo.substring(0,30);
    }else{
        ltesto = (int)(ltesto * 0.3);
        testo = testo.substring(0, ltesto) ; 
    }
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