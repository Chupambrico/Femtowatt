<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<%@include file="schede.html" %>
<script src="js/listautenti.js"></script>
<%  
String nome, cognome;
Integer id, lvl;
Integer i = 0;
rs = q.esecuzioneQuery("SELECT * FROM \"UTENTE\" ORDER BY \"NOME\"");
out.print("<table>");   
out.print("<tr><td>Nome - Cognome</td><td></td><td></td><td></td><td>Livello</td></tr>");        
while(rs.next()){
    i++;
    nome = rs.getString("NOME");           
    cognome = rs.getString("COGNOME");
    lvl = rs.getInt("LIVELLO");
    id = rs.getInt("ID");
    String l = "s" + lvl;
    session.setAttribute(l, "selected");
    out.print("<tr>"
                + "<td>"
                    + "<a href='index.jsp?pag=profile&cod=" + id + "'>" + nome + " " + cognome + "</a>"
                + "</td>"
                + "<td class='span1'></td>"
                + "<td>"
                    + "<a href='index.jsp?pag=listaarticoliutente&n=" + id + "'>Lista articoli</a>"
                + "</td>"
                + "<td class='span1'></td>"
                + "<td>"
                    + "<select id='lvl" + i + "' name='" + rs.getInt("ID") + "' class='span1'>"
                        + "<option value='0'" + session.getAttribute("s0") + ">0</option>"
                        + "<option value='1'" + session.getAttribute("s1") + ">1</option>"
                        + "<option value='2'" + session.getAttribute("s2") + ">2</option>"
                        + "<option value='3'" + session.getAttribute("s3") + ">3</option>"
                        + "<option value='4'" + session.getAttribute("s4") + ">4</option>"
                        + "<option value='5'" + session.getAttribute("s5") + ">5</option>"
                        + "<option value='6'" + session.getAttribute("s6") + ">6</option>"
                        + "<option value='7'" + session.getAttribute("s7") + ">7</option>"
                        + "<option value='8'" + session.getAttribute("s8") + ">8</option>"
                        + "<option value='9'" + session.getAttribute("s9") + ">9</option>"
                        + "<option value='10'" + session.getAttribute("s10") + ">10</option>"
                    + "</select>"
                + "</td>"
                + "<td class='span1'></td>"
                + "<td>"
                    + "<div class='btn-group'>"
                        + "<button type='button' class='btn' id=\"" + i + "\" value=" + id + " onclick='ban(\"" + i + "\");'>Elimina</button>");
    try{
        if(lvl == 0){
            out.print("<button type='button' class='btn btn-warning' disabled>Utente bannato</button>");
        }
    }catch(Exception e){}
    out.print("</div>"
                + "</td>"
            + "</tr>");
    session.removeAttribute(l);
}
out.print("</table>");
out.print("<button type='button' class='btn' onclick='inviaRisultati();'>Invia</button>");
out.print("<input type='hidden' id='i' value=" + i + "></input>");
%>