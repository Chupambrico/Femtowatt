<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="connect.jsp" %>
<script src="js/administrator.js"></script>
<form>
    <table border="0">
        <tr>
            <td>Numero pagine per articolo:</td>
            <td><input type="text" name="npagine" style="width:150px;"/></td>
        </tr>
        <tr>
            <td>Duarata massima sessione:</td>
            <td><input type="text" name="temposession" style="width:150px;"/></td>
        </tr>
    </table>
    <input class="btn" type="button" name="invia" value="Invia!" onclick="inviaRisultati();"/>
    <input class="btn" type="button" name="preview" value="Preview"/>
</form> 
<a href="try.jsp?pag=listautenti">Lista utenti</a>    
<%
rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" ORDER BY ID ASC");
out.print("<form name='admin'>");
out.print("<table border='0'>");
out.print("<tr><td>Nome Articolo</td><td>Data inserimento</td><td>Abilitato</td></tr>");
int i = 0;
while (rs.next()) {
    String id = rs.getString("ID");       
    String titolo = rs.getString("TITOLO");                        
    String data = rs.getString("DATA");
    String attivo = rs.getString("ATTIVO");
    String ap = "";
    String dis = "";
    try{
        if(attivo.equals("on")){
            ap = " btn-success active";
            dis = " btn-inverse";
        }else{
            ap = " btn-inverse";
            dis = " btn-danger active";
        }
    }catch(Exception e){}
    i++;
    out.print("<tr>"
                + "<td>"
                    + "<a href='try.jsp?pag=viewPage&cod=" + id + "'>" + titolo + "</a>"
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
                        + "btn btn-danger" + dis
                        + "' id=" + -i + " onclick='toggle(" + -i + ");'>"
                            + "Disapprova"
                        + "</button>"
                    + "</div>"
                + "</td>"
            + "</tr>");                 
}
out.print("</table>");
out.print("<input type='hidden' id='i' value=" + i + "></input>");
out.print("</form>");
%>