<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connect.jsp" %>
<script src="js/listaarticoli.js"></script>
<%
rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" ORDER BY ID ASC");
out.print("<table border='0'>");
out.print("<tr><td>Nome Articolo</td><td>Data inserimento</td><td>Abilitato</td><td></td><td>Elimina</td></tr>");
int i = 0;
while (rs.next()) {
    String id = rs.getString("ID");       
    String titolo = rs.getString("TITOLO");                        
    String data = rs.getString("DATA");
    String attivo = rs.getString("ATTIVO");
    String cancella = rs.getString("DEL");
    String ap = "";
    String dis = "";
    try{
        if(attivo.equals("on")){
            ap = " btn-success active";
        }else{
            dis = " btn-danger active";
        }
    }catch(Exception e){}
    i++;
    out.print("<tr>"
                + "<td>"
                    + "<a href='index.jsp?pag=viewPage&cod=" + id + "'>" + titolo + "</a>"
                + "</td>"
                + "<td>"
                    + data
                + "</td>"
                + "<td>"
                    + "<div class='btn-group'  data-toggle='buttons-radio'>"
                        + "<button type='button' class='"
                        + "btn" + ap
                        + "' id=" + i + " value=" + id + " onclick='toggle(" + i + ");'>"
                            + "Approva"
                        + "</button>"
                        + "<button type='button' class='"
                        + "btn" + dis
                        + "' id=" + -i + " onclick='toggle(" + -i + ");'>"
                            + "Disapprova"
                        + "</button>"
                    + "</div>");
    out.print("<td class='span1'></td>"
            + "<td>"
                + "<div class='btn-group'>"
                    + "<button type='button' class='btn' id=\"" + i + "d\" onclick='del(\"" + i + "d\");'>Elimina</button>");
    try{
        if(cancella.equals("on")){
            out.print("<button type='button' class='btn btn-warning' disabled>Richiesta cancellazione</button>");
                    
        }
    }catch(Exception e){}
    out.print("</div>");
    out.print("</td></tr>");
}
out.print("</table>");
out.print("<button type='button' class='btn' onclick='inviaRisultati();'>Invia</button>");
out.print("<input type='hidden' id='i' value=" + i + "></input>");
%>