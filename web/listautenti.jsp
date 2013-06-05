<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%@include file="schede.html" %>
<script src="js/listautenti.js"></script>
<%  
String nome, cognome, ban;
String bannato = ""; 
Integer id;
Integer i = 0;
rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" ORDER BY \"NOME\"");
out.print("<table>");   
out.print("<tr><td>Nome</td><td>Cognome</td></tr>");        
while(rs.next()){
    i++;
    nome = rs.getString("NOME");           
    cognome = rs.getString("COGNOME");
    ban = rs.getString("BAN");
    try{
        if(ban.equals("on")){
            bannato = " btn-danger active";
        }
    }catch(Exception e){}
    id = rs.getInt("ID");
    out.print("<tr>"
                + "<td>"
                    + "<a href='index.jsp?pag=profile&cod=" + id + "'>" + nome + "</a>"
                + "</td>"
                + "<td>"
                    + "<a href='index.jsp?pag=profile&cod=" + id + "'>" + cognome + "</a>"
                + "</td>"
                + "<td>"
                    + "<a href='index.jsp?pag=listaarticoliutente&n=" + id + "'>Lista articoli</a>"
                + "</td>"
                + "<td class='span1'></td>"
                + "<td>"
                    + "<button type='button' class='btn" + bannato + "' id=\"" + i + "\" value=" + id + " onclick='ban(\"" + i + "\");'>Elimina</button>"
                + "</td>"
            + "</tr>");
}
out.print("</table>");
out.print("<button type='button' class='btn' onclick='inviaRisultati();'>Invia</button>");
out.print("<input type='hidden' id='i' value=" + i + "></input>");
%>