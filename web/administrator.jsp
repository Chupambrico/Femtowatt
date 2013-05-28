<%@page import="java.sql.*" import="database.CreaConnessione"  import="java.sql.*" import="database.Query" contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="connect.jsp" %>
<form method="post" action="try.jsp?pag=administrator">
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
    <input class="btn" type="button" name="invia" value="Invia!"/>
    <input class="btn" type="button" name="preview" value="Preview"/>
</form> 
<a href="try.jsp?pag=listautenti">Lista utenti</a>    
<%
rs = q.esecuzioneQuery("SELECT * FROM \"PAGINA\" ORDER BY ID ASC");
out.print("<form method='post' action='approvapag.jsp'>");
out.print("<table border='0'>");
out.print("<tr><td>Nome Articolo</td><td>Data inserimento</td><td>Abilitato</td></tr>");
int i = 0;
while (rs.next()) {
    String  id = rs.getString("ID");       
    String  titolo = rs.getString("TITOLO");                        
    String  data = rs.getString("DATA");
    String attivo = rs.getString("ATTIVO");
    if(attivo != null){
        attivo = "checked";
    }else{
        attivo = "";
    }
    i++;
    out.print("<tr><td><a href='try.jsp?pag=viewPage&cod=" + id + "'>" + titolo + "</a></td><td>" + data + "</td><td><input type='checkbox' name='" + i + "' value='" + id + "'" + attivo + "/></td></tr>");                 
}
out.print("</table>");
out.print("</form>");
%>